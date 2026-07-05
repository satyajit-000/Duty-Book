import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class BarRow extends StatelessWidget {
  final String label;
  final String value;
  final double percent;

  const BarRow({
    super.key,
    required this.label,
    required this.value,
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
                label,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 10,
            backgroundColor: AppColors.border,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
