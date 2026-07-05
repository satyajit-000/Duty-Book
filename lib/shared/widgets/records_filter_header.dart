import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_colors.dart';

class RecordsFilterHeader extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onFilterTap;
  final List<Widget> summaryItems;

  const RecordsFilterHeader({
    super.key,
    required this.selectedDate,
    required this.onPrevious,
    required this.onNext,
    required this.onFilterTap,
    required this.summaryItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          const SizedBox(height: 8),

          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_rounded, color: Colors.white),
              ),
              IconButton(
                onPressed: onPrevious,
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    DateFormat('MMMM yyyy').format(selectedDate),
                    style: const TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: onNext,
                icon: const Icon(Icons.chevron_right, color: Colors.white),
              ),
              IconButton(
                onPressed: onFilterTap,
                icon: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: summaryItems,
          ),
        ],
      ),
    );
  }
}
