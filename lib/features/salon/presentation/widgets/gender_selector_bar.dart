import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';

import '../providers/service_detail_providers.dart';

class GenderSelectorBar extends ConsumerWidget {
  const GenderSelectorBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeGender = ref.watch(selectedGenderProvider);
    final options = ['Male', 'Female'];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: options.map((gender) {
          final isSelected = activeGender == gender;
          return Expanded(
            child: GestureDetector(
              onTap: () =>
                  ref.read(selectedGenderProvider.notifier).state = gender,
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                child: Text(
                  gender,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
