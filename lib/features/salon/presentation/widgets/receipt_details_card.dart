import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

import '../../domain/models/booking_receipt_models.dart';

class ReceiptDetailsCard extends StatelessWidget {
  final BookingReceiptModel receipt;
  const ReceiptDetailsCard({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          // Service Headliner Row
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  receipt.imageUrl,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receipt.serviceName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.spa_outlined,
                          size: 14,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          receipt.salonName,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: Color(0xFFE5E7EB), height: 1),
          ),

          // Core Allocation Specifications Grid Data Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetaBlock(
                'DATE & TIME',
                '${DateFormat('dd MMM').format(receipt.appointmentDate)} • ${receipt.appointmentTimeDisplay}',
              ),
              _buildMetaBlock('STAFF', receipt.staffName),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetaBlock(
                'TOTAL PAID',
                'Rs. ${receipt.totalPaid.toInt()}',
                isAccent: true,
              ),
              _buildMetaBlock('BOOKING ID', receipt.bookingId),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetaBlock(
    String title,
    String subtitle, {
    bool isAccent = false,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.textTertiary,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isAccent ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
