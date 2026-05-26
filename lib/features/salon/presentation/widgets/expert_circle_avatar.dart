import 'package:flutter/material.dart';
import 'package:hbazar/core/theme/app_colors.dart';
import '../../domain/models/salon_detail_models.dart';

class ExpertCircleAvatar extends StatelessWidget {
  final ExpertModel expert;

  const ExpertCircleAvatar({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(expert.imageUrl),
            backgroundColor: const Color(0xFFE5E7EB),
          ),
          const SizedBox(height: 6),
          Text(expert.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 12),
              const SizedBox(width: 2),
              Text('${expert.rating}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }
}