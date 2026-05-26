import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:glamgo/core/theme/app_sizes.dart';
import 'package:glamgo/features/salon/presentation/widgets/next_available_card.dart';
import 'package:glamgo/features/salon/presentation/widgets/stylist_filter_chips.dart';
import 'package:glamgo/features/salon/presentation/widgets/stylist_profile_tile.dart';
import 'package:go_router/go_router.dart';

import '../providers/stylist_providers.dart';

class ChooseStylistScreen extends ConsumerWidget {
  const ChooseStylistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stylistsAsync = ref.watch(stylistsStreamProvider);
    final selectedStylistId = ref.watch(selectedStylistIdProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Choose Your Stylist',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(AppSizes.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Informational Blue Banner Warning/Callout Component
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F2FE),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppColors.primary,
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You can choose a preferred stylist or continue with next available expert',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.5,
                                  color: AppColors.textPrimary,
                                  height: 1.3,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Skipping will not affect service quality',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSizes.h24,

                  // Filter Chips Dynamic Management Scroller Horizontal
                  const StylistFilterChips(),
                  AppSizes.h24,

                  // Standardized Instant Selector Entry Component
                  const NextAvailableCard(),
                  AppSizes.h32,

                  // Section Header Row Meta Counts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Available Stylists',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      stylistsAsync.when(
                        data: (list) => Text(
                          '${list.length} experts',
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 14,
                          ),
                        ),
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  AppSizes.h12,

                  // Core Staff List Render Nodes loop tracking layout properties
                  stylistsAsync.when(
                    data: (stylists) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: stylists.length,
                      itemBuilder: (context, idx) {
                        return StylistProfileTile(stylist: stylists[idx]);
                      },
                    ),
                    loading: () => const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    error: (err, _) => Center(
                      child: Text('Error downloading resource models: $err'),
                    ),
                  ),

                  // Margin viewport bottom clearing spacer component layout rules block
                  const SizedBox(height: 110),
                ],
              ),
            ),
          ),

          // Persistent Adaptive Actions Control Drawer Frame Block
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: AppColors.divider, width: 1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Preferred Layout Allocation',
                          style: TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 11,
                          ),
                        ),
                        AppSizes.h8,
                        Text(
                          selectedStylistId == null
                              ? 'Preferred: Auto Assign'
                              : 'Custom Request Selected',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Text(
                          'You can change later',
                          style: TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push('/select-date-time');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
