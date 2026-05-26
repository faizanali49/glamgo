import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import '../../domain/models/booking_history_models.dart';
import '../providers/booking_history_providers.dart';

class BookingSegmentSelector extends ConsumerWidget {
  const BookingSegmentSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(activeHistoryTabProvider);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: HistoryStatus.values.map((status) {
          final isSelected = activeTab == status;
          final label = status.name.substring(0, 1).toUpperCase() + status.name.substring(1);

          return Expanded(
            child: GestureDetector(
              onTap: () => ref.read(activeHistoryTabProvider.notifier).state = status,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 11),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    color: isSelected ? Colors.white : const Color(0xFF4B5563),
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