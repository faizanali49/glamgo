import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:glamgo/core/theme/app_sizes.dart';
import 'package:glamgo/features/salon/presentation/widgets/horizontal_calendar_strip.dart';
import 'package:glamgo/features/salon/presentation/widgets/time_slot_segment_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../providers/booking_slot_providers.dart';

class SelectDateTimeScreen extends ConsumerWidget {
  const SelectDateTimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedSlot = ref.watch(selectedTimeSlotProvider);
    final slotsAsync = ref.watch(timeSlotsStreamProvider(selectedDate));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Column(
          children: [
            Text(
              'Select Date & Time',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Choose your preferred appointment time',
              style: TextStyle(color: AppColors.textTertiary, fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.screenPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSizes.h12,
                  const Text(
                    'DATE',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.0,
                    ),
                  ),
                  AppSizes.h12,

                  // Horizontal Strip Scroller Calendar
                  const HorizontalCalendarStrip(),
                  AppSizes.h24,

                  // Waiting Info Status Box
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.divider),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.verified_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'No waiting expected for selected slots',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSizes.h32,

                  const Text(
                    'Available Time Slots',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  AppSizes.h24,

                  // Conditional Render Stream Map Segments
                  slotsAsync.when(
                    data: (slots) {
                      final morningSlots = slots
                          .where((s) => s.time.hour < 12)
                          .toList();
                      final afternoonSlots = slots
                          .where((s) => s.time.hour >= 12 && s.time.hour < 18)
                          .toList();
                      final eveningSlots = slots
                          .where((s) => s.time.hour >= 18)
                          .toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TimeSlotSegmentGrid(
                            title: 'Morning',
                            icon: Icons.wb_sunny_outlined,
                            slots: morningSlots,
                          ),
                          AppSizes.h24,
                          TimeSlotSegmentGrid(
                            title: 'Afternoon',
                            icon: Icons.light_mode_outlined,
                            slots: afternoonSlots,
                          ),
                          AppSizes.h24,
                          TimeSlotSegmentGrid(
                            title: 'Evening',
                            icon: Icons.nightlight_round_outlined,
                            slots: eveningSlots,
                          ),
                        ],
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    error: (err, _) =>
                        Center(child: Text('Failed loading slots: $err')),
                  ),

                  AppSizes.h32,

                  // Cancellation Terms Banner Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.textTertiary,
                        size: 16,
                      ),
                      AppSizes.w12,
                      Expanded(
                        child: Text(
                          'You can reschedule your appointment anytime before 2 hours. Cancellations after that may incur a small fee.',
                          style: TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),

          // Core Actions Pinned Output Sheet Framework
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
                          'Selected Slot',
                          style: TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 11,
                          ),
                        ),
                        AppSizes.h8,
                        Text(
                          selectedSlot != null
                              ? '${DateFormat('dd MMM').format(selectedDate)}  •  ${selectedSlot.displayString}'
                              : 'Select a slot',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: selectedSlot != null
                                ? AppColors.primaryDark
                                : AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: selectedSlot != null
                          ? () {
                              GoRouter.of(context).push('/booking-summary');
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFFE5E7EB),
                        disabledForegroundColor: AppColors.textTertiary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
    );
  }
}
