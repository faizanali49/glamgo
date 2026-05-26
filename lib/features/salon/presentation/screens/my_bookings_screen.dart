import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:glamgo/features/salon/presentation/widgets/booking_segment_selector.dart';
import 'package:glamgo/features/salon/presentation/widgets/history_appointment_card.dart';
import 'package:glamgo/features/salon/presentation/widgets/history_dashboard_metrics.dart';

import '../providers/booking_history_providers.dart';

class MyBookingsScreen extends ConsumerWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredBookings = ref.watch(filteredBookingsProvider);
    final historyAsyncState = ref.watch(bookingHistoryStreamProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Bookings',
              style: TextStyle(
                color: Color(0xFF3730A3),
                fontWeight: FontWeight.w900,
                fontSize: 26,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Manage your appointments',
              style: TextStyle(color: AppColors.textTertiary, fontSize: 13),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFF3F4F6),
              child: IconButton(
                icon: const Icon(
                  Icons.tune_rounded,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 76,
      ),
      body: Column(
        children: [
          const BookingSegmentSelector(),

          Expanded(
            child: historyAsyncState.when(
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              error: (err, _) =>
                  Center(child: Text('Error loading dashboard data: $err')),
              data: (_) {
                if (filteredBookings.isEmpty) {
                  return const Center(
                    child: Text(
                      'No appointments found in this status category.',
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 14,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: filteredBookings.length,
                  itemBuilder: (context, index) {
                    return HistoryAppointmentCard(
                      booking: filteredBookings[index],
                    );
                  },
                );
              },
            ),
          ),

          // Pinned Base Context Info Metrics Widgets Dashboard Grid row
          const HistoryDashboardMetrics(),
        ],
      ),
    );
  }
}
