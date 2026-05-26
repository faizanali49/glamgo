import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:intl/intl.dart';
import '../../domain/models/booking_summary_models.dart';

class SummaryDetailsGrid extends StatelessWidget {
  final BookingSummaryModel summary;
  const SummaryDetailsGrid({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left Half: Appointment Slot Parameters
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('APPOINTMENT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 0.5)),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Text(DateFormat('dd').format(summary.appointmentDate), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary)),
                              Text(DateFormat('MMM').format(summary.appointmentDate).toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: AppColors.primary)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(summary.appointmentTimeDisplay, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
                              const SizedBox(height: 2),
                              Text('with ${summary.specialistName}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            
            // Middle Vertical Divider Line
            Container(width: 1, color: AppColors.divider),

            // Right Half: Customer Detail Section Frame Block
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CUSTOMER', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 0.5)),
                    const SizedBox(height: 12),
                    Text(summary.customerName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    Text(summary.customerPhone, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}