import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';

class SettingsTileItem {
  final IconData icon;
  final String label;
  const SettingsTileItem({required this.icon, required this.label});
}

class SettingsTileGroup extends StatelessWidget {
  final String categoryTitle;
  final List<SettingsTileItem> tiles;

  const SettingsTileGroup({
    super.key,
    required this.categoryTitle,
    required this.tiles,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              categoryTitle,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 0.5),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: tiles.length,
              separatorBuilder: (context, index) => const Divider(color: Color(0xFFF3F4F6), height: 1, indent: 52),
              itemBuilder: (context, index) {
                final item = tiles[index];
                return ListTile(
                  leading: Icon(item.icon, color: AppColors.primary, size: 22),
                  title: Text(
                    item.label,
                    style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF), size: 20),
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}