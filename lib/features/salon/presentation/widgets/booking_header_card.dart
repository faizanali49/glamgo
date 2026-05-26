import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import '../../domain/models/booking_details_models.dart';

class BookingHeaderCard extends StatelessWidget {
  final DetailedBookingModel booking;
  const BookingHeaderCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE5E7EB))),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('SERVICE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textTertiary)),
              Text('Booking ID ${booking.bookingId}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            ],
          ),
          const SizedBox(height: 6),
          Text(booking.serviceName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.spa_outlined, size: 16, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(booking.salonName, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: Divider(color: Color(0xFFE5E7EB), height: 1),
          ),
          Row(
            children: [
              Expanded(child: _buildMetaDateTile(Icons.calendar_today_outlined, '12 Mon', 'Date')),
              Container(width: 1, height: 32, color: const Color(0xFFE5E7EB)),
              Expanded(child: _buildMetaDateTile(Icons.access_time, booking.appointmentTimeDisplay, 'Time')),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMetaDateTile(IconData icon, String value, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.primary, size: 18),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.textTertiary)),
          ],
        )
      ],
    );
  }
}