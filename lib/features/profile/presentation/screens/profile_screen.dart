import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';

import '../providers/profile_providers.dart';
import '../widgets/profile_metrics_card.dart';
import '../widgets/settings_tile_group.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileStateProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textPrimary),
          onPressed: () {},
        ),
        title: const Text(
          'GlamGo',
          style: TextStyle(
            color: Color(0xFF3730A3),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Avatar Image Frame with Edit Node Overlay
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: const Color(0xFFFEE2E2),
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.primary,
                      child: const Icon(
                        Icons.edit,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              user.phone,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textTertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),

            ProfileMetricsCard(
              total: user.totalBookings,
              completed: user.completedBookings,
              saved: user.savedSalons,
            ),
            const SizedBox(height: 16),

            // Settings Categorized Tile Matrix Groups
            const SettingsTileGroup(
              categoryTitle: 'ACCOUNT',
              tiles: [
                SettingsTileItem(
                  icon: Icons.person_outline,
                  label: 'Edit Profile',
                ),
                SettingsTileItem(
                  icon: Icons.location_on_outlined,
                  label: 'Manage Addresses',
                ),
                SettingsTileItem(
                  icon: Icons.payment_outlined,
                  label: 'Payment Methods',
                ),
                SettingsTileItem(
                  icon: Icons.notifications_none_outlined,
                  label: 'Notification Settings',
                ),
              ],
            ),

            const SettingsTileGroup(
              categoryTitle: 'BOOKINGS & SAVED',
              tiles: [
                SettingsTileItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'My Bookings',
                ),
                SettingsTileItem(icon: Icons.history, label: 'Rebook History'),
                SettingsTileItem(
                  icon: Icons.favorite_border,
                  label: 'Favorites / Saved Salons',
                ),
              ],
            ),

            const SettingsTileGroup(
              categoryTitle: 'SUPPORT',
              tiles: [
                SettingsTileItem(
                  icon: Icons.help_outline,
                  label: 'Help & Support',
                ),
                SettingsTileItem(
                  icon: Icons.assignment_outlined,
                  label: 'FAQs',
                ),
                SettingsTileItem(icon: Icons.mail_outline, label: 'Contact Us'),
              ],
            ),

            const SettingsTileGroup(
              categoryTitle: 'APP SETTINGS',
              tiles: [
                SettingsTileItem(icon: Icons.language, label: 'Language'),
                SettingsTileItem(
                  icon: Icons.gpp_good_outlined,
                  label: 'Privacy Policy',
                ),
                SettingsTileItem(
                  icon: Icons.description_outlined,
                  label: 'Terms & Conditions',
                ),
              ],
            ),

            // Destructive Action Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, size: 18),
                label: const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFDC2626),
                  side: const BorderSide(color: Color(0xFFF3F4F6), width: 2),
                  minimumSize: const Size(double.infinity, 54),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
