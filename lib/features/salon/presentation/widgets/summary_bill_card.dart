import 'package:flutter/material.dart';
import 'package:glamgo/core/theme/app_colors.dart';

class SummaryBillCard extends StatelessWidget {
  final double amount;
  const SummaryBillCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BILL SUMMARY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 0.5)),
              SizedBox(height: 4),
              Text('Total Payable Amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
            ],
          ),
          Text(
            'Rs. ${amount.toInt()}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.primary),
          )
        ],
      ),
    );
  }
}