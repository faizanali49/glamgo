import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';

import '../providers/stylist_providers.dart';

class NextAvailableCard extends ConsumerWidget {
  const NextAvailableCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStylistId = ref.watch(selectedStylistIdProvider);
    final isSelected = selectedStylistId == null;

    return GestureDetector(
      onTap: () => ref.read(selectedStylistIdProvider.notifier).state = null,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF4F5FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE5E7EB),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.bolt, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Available Expert',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Fastest booking without waiting',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Radio<bool>(
              value: true,
              groupValue: isSelected,
              activeColor: AppColors.primary,
              onChanged: (_) =>
                  ref.read(selectedStylistIdProvider.notifier).state = null,
            ),
          ],
        ),
      ),
    );
  }
}
