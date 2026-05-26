import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';

class NextStepsTimeline extends StatelessWidget {
  const NextStepsTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      'Salon will contact you if needed',
      'Arrive 5 minutes early',
      'You can reschedule anytime from bookings'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Next Steps', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: steps.length,
          itemBuilder: (context, idx) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEF2FF), // Violet tint circle wrapper node asset base
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, size: 13, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      steps[idx],
                      style: const TextStyle(fontSize: 13.5, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}