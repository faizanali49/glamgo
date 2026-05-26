import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hbazar/core/theme/app_colors.dart';
import '../providers/home_providers.dart';

class HomeServiceToggle extends ConsumerWidget {
  const HomeServiceToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isToggled = ref.watch(homeServiceToggleProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider, width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.business_center_outlined, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need service at home?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary),
                ),
                SizedBox(height: 2),
                Text('Get salon services at your home', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Switch.adaptive(
            value: isToggled,
            onChanged: (val) => ref.read(homeServiceToggleProvider.notifier).state = val,
            activeColor: AppColors.primary,
          )
        ],
      ),
    );
  }
}