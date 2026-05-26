import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hbazar/core/theme/app_colors.dart';

import '../providers/booking_slot_providers.dart';

class HorizontalCalendarStrip extends ConsumerWidget {
  const HorizontalCalendarStrip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysAsync = ref.watch(calendarDaysStreamProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    return SizedBox(
      height: 100,
      child: daysAsync.when(
        data: (days) => ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: days.length,
          itemBuilder: (context, idx) {
            final item = days[idx];
            final isSelected = DateUtils.isSameDay(selectedDate, item.date);

            return GestureDetector(
              onTap: () {
                ref.read(selectedDateProvider.notifier).state = item.date;
                ref.read(selectedTimeSlotProvider.notifier).state =
                    null; // Clear chosen time slot on date mutation
              },
              child:
                  Container(
                        width: 62,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : AppColors.divider,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.weekdayName,
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? Colors.white.withOpacity(0.8)
                                    : AppColors.textSecondary,
                                fontWeight: isSelected
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.dayNumber,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textPrimary,
                              ),
                            ),
                            if (isSelected) ...[
                              const SizedBox(height: 4),
                              const CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ],
                        ),
                      )
                      .animate(target: isSelected ? 1 : 0)
                      .scaleY(begin: 1.0, end: 0.85, duration: 100.ms)
                      .then()
                      .scaleY(begin: 0.85, end: 1.0, duration: 100.ms),
            );
          },
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }
}
