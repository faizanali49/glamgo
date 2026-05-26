import 'package:flutter/material.dart';
import 'package:hbazar/core/theme/app_colors.dart';

class TrustIndicatorRow extends StatelessWidget {
  const TrustIndicatorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _SingleTrustItem(icon: Icons.clean_hands_outlined, text: 'Hygienic Tools'),
        _SingleTrustItem(icon: Icons.verified_outlined, text: 'Certified Stylists'),
        _SingleTrustItem(icon: Icons.people_outline, text: 'Trusted by 1k+'),
      ],
    );
  }
}

class _SingleTrustItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SingleTrustItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 22),
        const SizedBox(height: 6),
        Text(text, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w500)),
      ],
    );
  }
}