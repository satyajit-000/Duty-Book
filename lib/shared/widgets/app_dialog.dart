import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final Widget child;

  const AppDialog({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}
