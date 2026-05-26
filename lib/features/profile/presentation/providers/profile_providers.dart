import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfile {
  final String name;
  final String phone;
  final String avatarUrl;
  final int totalBookings;
  final int completedBookings;
  final int savedSalons;

  UserProfile({
    required this.name,
    required this.phone,
    required this.avatarUrl,
    required this.totalBookings,
    required this.completedBookings,
    required this.savedSalons,
  });
}

// Simulated session profile provider
final profileStateProvider = Provider.autoDispose<UserProfile>((ref) {
  return UserProfile(
    name: 'Ayesha Malik',
    phone: '+92 300 1234567',
    avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=150',
    totalBookings: 12,
    completedBookings: 9,
    savedSalons: 5,
  );
});