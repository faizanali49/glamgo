import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:glamgo/core/theme/app_sizes.dart';
import 'package:glamgo/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

import '../providers/salon_detail_providers.dart';
import '../widgets/action_icon_button.dart';
import '../widgets/expert_circle_avatar.dart';
import '../widgets/review_card.dart';
import '../widgets/service_tile_card.dart';

class SalonDetailScreen extends ConsumerWidget {
  final String salonId;

  const SalonDetailScreen({super.key, required this.salonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(salonDetailProvider(salonId));
    final selectedServices = ref.watch(selectedServicesProvider);

    return Scaffold(
      body: detailAsync.when(
        data: (salon) => Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // Collapsible image header anchor stack
                  SliverAppBar(
                    expandedHeight: 240,
                    pinned: true,
                    backgroundColor: AppColors.primaryDark,
                    leading: IconButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    actions: [
                      IconButton(
                        icon: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.notifications_none,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        salon.bannerImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Content Body
                  SliverPadding(
                    padding: const EdgeInsets.all(AppSizes.screenPadding),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Floating Card Style Meta Header Info
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEF2FF),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: const Text(
                                  'OPEN NOW',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              AppSizes.w12,
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              AppSizes.w4,
                              Text(
                                '${salon.rating} (${salon.reviewsCount} Reviews)',
                                style: AppTextStyles.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          AppSizes.h12,
                          Text(salon.name, style: AppTextStyles.h1Sans),
                          AppSizes.h8,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.textTertiary,
                                size: 16,
                              ),
                              AppSizes.w4,
                              Expanded(
                                child: Text(
                                  salon.address,
                                  style: AppTextStyles.bodySmall,
                                ),
                              ),
                            ],
                          ),
                          AppSizes.h24,

                          // Action Buttons Row
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ActionIconButton(icon: Icons.call, label: 'Call'),
                              ActionIconButton(
                                icon: Icons.near_me_outlined,
                                label: 'Directions',
                              ),
                              ActionIconButton(
                                icon: Icons.share_outlined,
                                label: 'Share',
                              ),
                            ],
                          ),
                          AppSizes.h32,

                          // About Section
                          const Text(
                            'About',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          AppSizes.h8,
                          Text(
                            salon.description,
                            style: AppTextStyles.bodyMedium,
                          ),
                          AppSizes.h32,

                          // Services Heading Layout
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Our Services',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'View Price List',
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                          AppSizes.h8,

                          // Loop matching operational fields
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: salon.services.length,
                            itemBuilder: (context, idx) {
                              final service = salon.services[idx];
                              return ServiceTileCard(
                                service: service,
                                isSelected: selectedServices.contains(
                                  service.id,
                                ),
                                onSelect: () => ref
                                    .read(selectedServicesProvider.notifier)
                                    .toggleService(service.id),
                              );
                            },
                          ),
                          AppSizes.h32,

                          // Experts Carousel Block
                          const Text(
                            'Our Experts',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          AppSizes.h12,
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: salon.experts.length,
                              itemBuilder: (context, idx) => ExpertCircleAvatar(
                                expert: salon.experts[idx],
                              ),
                            ),
                          ),
                          AppSizes.h32,

                          // Reviews Matrix Area Block
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Reviews',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'View All',
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),

                          // Display Rating Banner Info Card
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.divider),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  '${salon.rating}',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                AppSizes.h8,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    5,
                                    (_) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                AppSizes.h8,
                                Text(
                                  'Based on ${salon.reviewsCount} verified reviews',
                                  style: AppTextStyles.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          AppSizes.h12,

                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: salon.topReviews.length,
                            itemBuilder: (context, idx) =>
                                ReviewCard(review: salon.topReviews[idx]),
                          ),

                          // Location Sub-block Graphics section map anchor layout
                          AppSizes.h32,
                          const Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          AppSizes.h12,
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=600',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColors.primary,
                                  size: 40,
                                ),
                                Positioned(
                                  bottom: 12,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.map, size: 16),
                                    label: const Text(
                                      'Open in Maps',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppSizes.h8,
                          Text(salon.address, style: AppTextStyles.bodySmall),
                          AppSizes.h12,

                          // Bottom threshold padding margin constraint to account for persistent overlay structure height
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Persistent Responsive Bottom Action Checkout Drawer Layer
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
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
                            'Starting from',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            'Rs. ${selectedServices.isEmpty ? salon.services.first.price.toInt() : selectedServices.length * 500}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).push('/choose-stylist');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'BOOK APPOINTMENT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, _) => Center(
          child: Text('Error generating profile detailed views: $err'),
        ),
      ),
    );
  }
}
