import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:glamgo/core/theme/app_sizes.dart';
import 'package:glamgo/core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        children: [
                          TextSpan(text: 'Hello, Welcome '),
                          TextSpan(text: '👋', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    AppSizes.w4,
                    const Text(
                      'Find your perfect salon today',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.divider, width: 1),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            AppSizes.h24,
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.divider, width: 1.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: AppColors.textTertiary),
                  hintText: 'Search salons, services (haircut, facial...)',
                  hintStyle: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
