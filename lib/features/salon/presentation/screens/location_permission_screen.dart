import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hbazar/core/theme/app_colors.dart';
import 'package:hbazar/core/theme/app_sizes.dart';
import 'package:hbazar/core/theme/app_text_styles.dart';

import '../providers/location_controller_provider.dart';
import '../widgets/location_illustration.dart';

class LocationPermissionScreen extends ConsumerWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationControllerProvider);
    final isLoading = locationState.isLoading;

    ref.listen(locationControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error resolving location parameters: ${next.error}'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'GlamGo',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            // Prevents UI from overly extending width patterns on tablet landscape orientation
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(AppSizes.screenPadding),
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(flex: 2),

                      // Adaptive Vector Container Layout Widget
                      const Center(child: LocationIllustration()),

                      const Spacer(flex: 2),

                      const Text(
                        'Enable your location',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h1Sans,
                      ),
                      AppSizes.h12,
                      const Text(
                        'We use your location to find nearby salons and faster booking options',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyLarge,
                      ),

                      const Spacer(flex: 3),

                      ElevatedButton.icon(
                        onPressed: isLoading
                            ? null
                            : () async {
                                final isGranted = await ref
                                    .read(locationControllerProvider.notifier)
                                    .triggerSystemLocationPermission();
                                if (isGranted) {
                                  GoRouter.of(context).go('/home');
                                }
                              },
                        icon: isLoading
                            ? const SizedBox.shrink()
                            : const Icon(Icons.my_location, size: 20),
                        label: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Allow Location Access'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSizes.radiusSmall,
                            ),
                          ),
                          textStyle: AppTextStyles.buttonText,
                        ),
                      ),
                      AppSizes.h12,
                      OutlinedButton.icon(
                        onPressed: isLoading ? null : () {},
                        icon: const Icon(
                          Icons.edit_location_alt_outlined,
                          size: 20,
                        ),
                        label: const Text('Enter Location Manually'),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.cardBackground,
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(
                            color: AppColors.divider,
                            width: 1.5,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSizes.radiusSmall,
                            ),
                          ),
                          textStyle: AppTextStyles.buttonText.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
