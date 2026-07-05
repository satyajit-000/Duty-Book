import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AcProfitRow extends StatelessWidget {
  final String acType;
  final String avgProfit;
  final String avgKm;
  final String trips;
  final double percent;

  const AcProfitRow({
    super.key,
    required this.acType,
    required this.avgProfit,
    required this.avgKm,
    required this.trips,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                acType,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              avgProfit,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.success,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '$avgKm average • $trips',
          style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 9,
            backgroundColor: AppColors.border,
            color: AppColors.success,
          ),
        ),
      ],
    );
  }
}
