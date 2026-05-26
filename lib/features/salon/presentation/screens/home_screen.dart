import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hbazar/core/theme/app_colors.dart';
import 'package:hbazar/core/theme/app_sizes.dart';
import 'package:hbazar/features/salon/presentation/providers/home_providers.dart';
import 'package:hbazar/features/salon/presentation/widgets/category_selector.dart';
import 'package:hbazar/features/salon/presentation/widgets/home_header.dart';
import 'package:hbazar/features/salon/presentation/widgets/home_service_toggle.dart';
import 'package:hbazar/features/salon/presentation/widgets/salon_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salonsAsync = ref.watch(nearbySalonsProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(homeCategoriesProvider);
            ref.invalidate(homeOffersProvider);
            ref.invalidate(nearbySalonsProvider);
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // Sticky dynamic app bar sections
              const HomeHeader(),

              // Core scrolling grid wrapper container layers
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSizes.h12,
                      const CategorySelector(),
                      AppSizes.h24,
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.2),
                          ),
                        ),
                        child: const Text(
                          'Special offers available now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      AppSizes.h24,
                      const HomeServiceToggle(),
                      AppSizes.h24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Nearby Salons',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(color: AppColors.primaryDark),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Dynamic Multi-Vendor Card List Processing Area
              salonsAsync.when(
                data: (salons) => SliverPadding(
                  padding: const EdgeInsets.only(
                    left: AppSizes.screenPadding,
                    right: AppSizes.screenPadding,
                    bottom:
                        80.0, // Space clear threshold margin for BottomNavigationBar integration
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => SalonCard(salon: salons[index]),
                      childCount: salons.length,
                    ),
                  ),
                ),
                loading: () => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                ),
                error: (err, _) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('Failed loading records: $err')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
