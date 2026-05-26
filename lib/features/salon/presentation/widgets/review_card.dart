import 'package:flutter/material.dart';
import 'package:hbazar/core/theme/app_colors.dart';
import '../../domain/models/salon_detail_models.dart';

class ReviewCard extends StatelessWidget {
  final ReviewSummaryModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(review.reviewerName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary)),
              Text(review.relativeTime, style: const TextStyle(color: AppColors.textTertiary, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '"${review.comment}"',
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontStyle: FontStyle.italic, height: 1.4),
          ),
        ],
      ),
    );
  }
}