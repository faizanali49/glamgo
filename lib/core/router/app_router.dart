import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/features/profile/presentation/screens/profile_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/booking_confirmed_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/booking_details_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/booking_summary_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/choose_stylist_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/explore_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/my_bookings_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/salon_detail_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/select_date_time_screen.dart';
import 'package:glamgo/features/salon/presentation/screens/service_detail_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/salon/presentation/screens/home_screen.dart';
import '../../features/salon/presentation/screens/location_permission_screen.dart';
import '../../features/salon/presentation/widgets/main_navigation_shell.dart';

class RouteNames {
  static const String login = 'login';
  static const String otp = 'otp';
  static const String locationPermission = 'locationPermission';
  static const String home = 'home';
  static const String explore = 'explore';
  static const String bookings = 'bookings';
  static const String profile = 'profile';
}

final goRouterExtractorProvider = Provider<GoRouter>((ref) {
  // Global root navigator key for full-screen dialogs or auth redirection
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      // Out-of-shell onboarding flow paths
      GoRoute(
        name: RouteNames.login,
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RouteNames.otp,
        path: '/otp',
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        name: RouteNames.locationPermission,
        path: '/location-permission',
        builder: (context, state) => const LocationPermissionScreen(),
      ),
      // Append route mapping to GoRouter matching array list context block:
      GoRoute(
        path: '/salon/:id',
        builder: (context, state) {
          final salonId = state.pathParameters['id'] ?? 'default_id';
          return SalonDetailScreen(salonId: salonId);
        },
      ),
      GoRoute(
        path: '/booking-summary',
        builder: (context, state) => const BookingSummaryScreen(),
      ),
      GoRoute(
        path: '/service-detail/:serviceId',
        builder: (context, state) {
          final serviceId =
              state.pathParameters['serviceId'] ?? 'default_service';
          return ServiceDetailScreen(serviceId: serviceId);
        },
      ),
      GoRoute(
        path: '/choose-stylist',
        builder: (context, state) => const ChooseStylistScreen(),
      ),
      GoRoute(
        path: '/select-date-time',
        builder: (context, state) => const SelectDateTimeScreen(),
      ),
      GoRoute(
        path: '/booking-success',
        builder: (context, state) => const BookingConfirmedScreen(),
      ),
      GoRoute(
        path: '/booking-details',
        builder: (context, state) => const BookingDetailsScreen(),
      ),
      // Main App Persistent Navigation Core Shell Structure
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigationShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.home,
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.explore,
                path: '/explore',
                builder: (context, state) => const ExploreScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.bookings,
                path: '/bookings',
                builder: (context, state) => const MyBookingsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.profile,
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
