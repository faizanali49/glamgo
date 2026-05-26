import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import '../../domain/models/booking_details_models.dart';

class BookingStatusTimeline extends StatelessWidget {
  final List<TrackingStepModel> timeline;
  const BookingStatusTimeline({super.key, required this.timeline});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE5E7EB))),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: timeline.length,
        itemBuilder: (context, index) {
          final step = timeline[index];
          final isLast = index == timeline.length - 1;

          Color indicatorColor = const Color(0xFFE5E7EB);
          Widget innerWidget = const SizedBox();

          if (step.status == TrackingStepStatus.completed) {
            indicatorColor = AppColors.primary;
            innerWidget = const Icon(Icons.check, size: 12, color: Colors.white);
          } else if (step.status == TrackingStepStatus.active) {
            indicatorColor = AppColors.primary;
            innerWidget = Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle));
          }

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: step.status == TrackingStepStatus.active ? AppColors.primary : indicatorColor,
                        shape: BoxShape.circle,
                        border: step.status == TrackingStepStatus.active ? Border.all(color: AppColors.primary.withOpacity(0.3), width: 3) : null,
                      ),
                      child: Center(child: innerWidget),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(width: 2, color: step.status == TrackingStepStatus.completed ? AppColors.primary : const Color(0xFFE5E7EB)),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: step.status == TrackingStepStatus.inactive ? AppColors.textTertiary : AppColors.primary
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(step.subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}