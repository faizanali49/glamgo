import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';

class MetaStatusRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBadge;

  const MetaStatusRow({
    super.key,
    required this.title,
    required this.value,
    required this.isBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w500)),
          isBadge
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5), // Mint light container background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    value,
                    style: const TextStyle(color: Color(0xFF065F46), fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              : Text(value, style: const TextStyle(color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}