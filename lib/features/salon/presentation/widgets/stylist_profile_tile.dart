import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';

import '../../domain/models/stylist_models.dart';
import '../providers/stylist_providers.dart';

class StylistProfileTile extends ConsumerWidget {
  final StylistModel stylist;

  const StylistProfileTile({super.key, required this.stylist});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStylistId = ref.watch(selectedStylistIdProvider);
    final isSelected = selectedStylistId == stylist.id;

    Color badgeColor;
    switch (stylist.availability) {
      case StylistAvailability.online:
        badgeColor = const Color(0xFF10B981);
        break;
      case StylistAvailability.away:
        badgeColor = const Color(0xFFFBBF24);
        break;
      case StylistAvailability.offline:
        badgeColor = const Color(0xFF9CA3AF);
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Stylist Image Avatar Setup with Custom Offline Status Ring Badge
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(stylist.imageUrl),
                backgroundColor: const Color(0xFFE5E7EB),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    color: badgeColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),

          // Central Spec Matrix Segment Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      stylist.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 2),
                    Text(
                      '${stylist.rating}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '${stylist.yearsExperience}+ years exp • ${stylist.specialization}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12.5,
                  ),
                ),
                const SizedBox(height: 8),

                // Embedded Metadata Category Accent Tags Row Map
                Row(
                  children: stylist.tags
                      .map(
                        (tag) => Container(
                          margin: const EdgeInsets.only(right: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          // Radio Selection Trigger Interface Asset Link
          Radio<String?>(
            value: stylist.id,
            groupValue: selectedStylistId,
            activeColor: AppColors.primary,
            onChanged: (val) =>
                ref.read(selectedStylistIdProvider.notifier).state = val,
          ),
        ],
      ),
    );
  }
}
