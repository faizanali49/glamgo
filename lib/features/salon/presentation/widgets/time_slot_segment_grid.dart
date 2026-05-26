import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hbazar/core/theme/app_colors.dart';

import '../../domain/models/booking_slot_models.dart';
import '../providers/booking_slot_providers.dart';

class TimeSlotSegmentGrid extends ConsumerWidget {
  final String title;
  final IconData icon;
  final List<TimeSlotModel> slots;

  const TimeSlotSegmentGrid({
    super.key,
    required this.title,
    required this.icon,
    required this.slots,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (slots.isEmpty) return const SizedBox.shrink();
    final selectedSlot = ref.watch(selectedTimeSlotProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppColors.textSecondary),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.4,
          ),
          itemCount: slots.length,
          itemBuilder: (context, idx) {
            final slot = slots[idx];
            final isSelected = selectedSlot?.id == slot.id;

            return GestureDetector(
              onTap: slot.isBooked
                  ? null
                  : () => ref.read(selectedTimeSlotProvider.notifier).state =
                        slot,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: slot.isBooked
                      ? const Color(0xFFF3F4F6)
                      : (isSelected ? AppColors.primary : Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: slot.isBooked
                        ? Colors.transparent
                        : (isSelected ? Colors.transparent : AppColors.divider),
                  ),
                ),
                child: Text(
                  slot.displayString,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: slot.isBooked
                        ? AppColors.textTertiary
                        : (isSelected ? Colors.white : AppColors.textPrimary),
                    decoration: slot.isBooked
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
