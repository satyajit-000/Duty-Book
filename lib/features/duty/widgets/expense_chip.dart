import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ExpenseChip extends StatelessWidget {
  final String label;
  final int amount;
  final VoidCallback onDelete;

  const ExpenseChip({
    super.key,
    required this.label,
    required this.amount,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Text('₹$amount', style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(width: 6),
          InkWell(
            onTap: onDelete,
            child: const Icon(
              Icons.close_rounded,
              size: 18,
              color: AppColors.expense,
            ),
          ),
        ],
      ),
    );
  }
}
