import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:glamgo/features/salon/presentation/widgets/booking_header_card.dart';
import 'package:glamgo/features/salon/presentation/widgets/booking_map_card.dart';
import 'package:glamgo/features/salon/presentation/widgets/booking_payment_summary.dart';
import 'package:glamgo/features/salon/presentation/widgets/booking_staff_card.dart';
import 'package:glamgo/features/salon/presentation/widgets/booking_status_timeline.dart';
import '../providers/booking_details_providers.dart';

class BookingDetailsScreen extends ConsumerWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booking = ref.watch(detailedBookingProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Booking Details', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: const Text('Upcoming', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingHeaderCard(booking: booking),
            const SizedBox(height: 20),
            
            const Text('Booking Status', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textTertiary)),
            const SizedBox(height: 10),
            BookingStatusTimeline(timeline: booking.trackingTimeline),
            const SizedBox(height: 20),

            const Text('Service Detail', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textTertiary)),
            const SizedBox(height: 10),
            _buildServiceDetailItem(booking.serviceName, booking.durationMinutes),
            const SizedBox(height: 20),

            BookingStaffCard(name: booking.staffName, rating: booking.staffRating, imageUrl: booking.staffImageUrl),
            const SizedBox(height: 20),

            BookingMapCard(address: booking.locationAddress, distance: booking.distanceFromUser),
            const SizedBox(height: 20),

            BookingPaymentSummary(method: booking.paymentMethod, status: booking.paymentStatus, total: booking.totalAmount),
            const SizedBox(height: 24),

            // Operational Bottom Actions Sheet Group Layout
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_today, size: 16),
                  SizedBox(width: 8),
                  Text('Reschedule Booking', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      minimumSize: const Size(0, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Cancel Booking', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      minimumSize: const Size(0, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone_outlined, size: 16),
                        SizedBox(width: 6),
                        Text('Call Salon', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text('Need help with this booking?', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                  const SizedBox(height: 6),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline, size: 18, color: AppColors.primary),
                    label: const Text('Contact Support', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceDetailItem(String title, int duration) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE5E7EB))),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.access_time, size: 14, color: AppColors.textTertiary),
              const SizedBox(width: 4),
              Text('$duration min', style: const TextStyle(color: AppColors.textTertiary, fontSize: 13)),
            ],
          )
        ],
      ),
    );
  }
}