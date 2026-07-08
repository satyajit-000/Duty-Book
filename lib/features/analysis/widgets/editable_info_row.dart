import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class EditableInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;

  const EditableInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          Row(
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.edit_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
