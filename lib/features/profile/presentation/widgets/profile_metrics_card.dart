import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';

class ProfileMetricsCard extends StatelessWidget {
  final int total;
  final int completed;
  final int saved;

  const ProfileMetricsCard({
    super.key,
    required this.total,
    required this.completed,
    required this.saved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          _buildMetricItem('$total', 'TOTAL\nBOOKINGS'),
          Container(width: 1, height: 36, color: const Color(0xFFE5E7EB)),
          _buildMetricItem('$completed', 'COMPLETED\nBOOKINGS'),
          Container(width: 1, height: 36, color: const Color(0xFFE5E7EB)),
          _buildMetricItem('$saved', 'SAVED\nSALONS'),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String count, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textTertiary,
              height: 1.3,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
