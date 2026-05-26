import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';

import '../providers/service_detail_providers.dart';

class StyleTypeSelectorRow extends ConsumerWidget {
  const StyleTypeSelectorRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStyle = ref.watch(selectedStyleTypeProvider);
    final styles = ['Classic', 'Modern', 'Fade'];

    return Row(
      children: styles.map((style) {
        final isSelected = selectedStyle == style;
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ChoiceChip(
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(style),
            ),
            selected: isSelected,
            onSelected: (_) =>
                ref.read(selectedStyleTypeProvider.notifier).state = style,
            selectedColor: AppColors.primary,
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? Colors.transparent : AppColors.divider,
              ),
            ),
            showCheckmark: false,
          ),
        );
      }).toList(),
    );
  }
}
