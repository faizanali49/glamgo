import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/core/theme/app_colors.dart';
import 'package:glamgo/core/theme/app_sizes.dart';
import 'package:glamgo/features/salon/presentation/widgets/animated_success_badge.dart';
import 'package:glamgo/features/salon/presentation/widgets/meta_status_row.dart';
import 'package:glamgo/features/salon/presentation/widgets/next_steps_timeline.dart';
import 'package:glamgo/features/salon/presentation/widgets/receipt_details_card.dart';

import '../providers/booking_receipt_providers.dart';

class BookingConfirmedScreen extends ConsumerWidget {
  const BookingConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipt = ref.watch(bookingReceiptProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Content Area
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    const AnimatedSuccessBadge(),
                    AppSizes.h24,

                    const Text(
                      'Booking Confirmed!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF3730A3),
                      ),
                    ),
                    AppSizes.h8,
                    const Text(
                      'Your appointment is successfully booked',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    AppSizes.h32,

                    ReceiptDetailsCard(receipt: receipt),
                    AppSizes.h24,

                    MetaStatusRow(
                      title: 'Status',
                      value: receipt.status.name.toUpperCase(),
                      isBadge: true,
                    ),
                    AppSizes.h24,
                    MetaStatusRow(
                      title: 'Payment Method',
                      value: receipt.paymentMethodDisplay,
                      isBadge: false,
                    ),
                    AppSizes.h32,

                    const NextStepsTimeline(),
                  ],
                ),
              ),
            ),

            // Fixed Action Navigation Stack Base Control
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'View My Booking',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    // onPressed: () => Navigator.of(context).popToRoot(), // Clear flow layer history safely
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      minimumSize: const Size(double.infinity, 54),
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Need help? Contact Support',
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
