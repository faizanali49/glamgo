import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hbazar/core/theme/app_colors.dart';
import '../../domain/models/service_detail_models.dart';
import '../providers/service_detail_providers.dart';

class ServiceExpertCard extends ConsumerWidget {
  final ServiceExpertModel expert;

  const ServiceExpertCard({super.key, required this.expert});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStaffId = ref.watch(selectedPreferredStaffIdProvider);
    final isSelected = selectedStaffId == expert.id;

    return GestureDetector(
      onTap: () {
        ref.read(selectedPreferredStaffIdProvider.notifier).state = isSelected ? null : expert.id;
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        width: 90,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      width: 2.5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(expert.imageUrl),
                    backgroundColor: const Color(0xFFE5E7EB),
                  ),
                ),
                if (isSelected)
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.check, size: 12, color: Colors.white),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 6),
            Text(
              expert.name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 12),
                const SizedBox(width: 2),
                Text('${expert.rating}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}