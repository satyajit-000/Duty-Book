import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class InfoBox extends StatelessWidget {
  final String message;

  const InfoBox({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: AppColors.info,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
