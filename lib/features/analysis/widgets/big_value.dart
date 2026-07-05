import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class BigValue extends StatelessWidget {
  final String value;
  final String subtitle;
  final Color color;

  const BigValue({
    super.key,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: AppColors.textSecondary)),
      ],
    );
  }
}
