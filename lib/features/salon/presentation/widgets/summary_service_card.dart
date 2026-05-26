import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import '../../domain/models/booking_summary_models.dart';

class SummaryServiceCard extends StatelessWidget {
  final SummaryServiceModel service;
  const SummaryServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(service.imageUrl, width: 72, height: 72, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(service.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: AppColors.textTertiary),
                    const SizedBox(width: 4),
                    Text('${service.durationMinutes} min', style: const TextStyle(color: AppColors.textTertiary, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Rs. ${service.price.toInt()}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}