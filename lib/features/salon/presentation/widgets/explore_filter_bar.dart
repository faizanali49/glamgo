import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';

import '../providers/explore_providers.dart';

class ExploreFilterBar extends ConsumerWidget {
  const ExploreFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSelection = ref.watch(activeFilterTagProvider);
    final filterOptions = ['4+ Rating', 'Nearest', 'Low Price', 'Offers'];

    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filterOptions.length,
        itemBuilder: (context, index) {
          final option = filterOptions[index];
          final isSelected = currentSelection == option;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (_) =>
                  ref.read(activeFilterTagProvider.notifier).state = option,
              selectedColor: AppColors.primary,
              backgroundColor: const Color(0xFFF3F4F6),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              showCheckmark: false,
            ),
          );
        },
      ),
    );
  }
}
