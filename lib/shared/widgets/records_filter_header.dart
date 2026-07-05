import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/extensions/filter_state_extension.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/duty_summary_provider.dart';
import '../../providers/filter_provider.dart';
import 'display_options_dialog.dart';
import 'summary_item.dart';

class RecordsFilterHeader extends ConsumerWidget {
  const RecordsFilterHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);
    final summary = ref.watch(dutySummaryProvider);

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
                onPressed: () {
                  ref.read(filterProvider.notifier).previousPeriod();
                },
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    filter.title,
                    style: const TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: filter.canGoNext
                    ? () {
                        ref.read(filterProvider.notifier).nextPeriod();
                      }
                    : null,
                icon: const Icon(Icons.chevron_right, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => DisplayOptionsDialog(
                      selectedFilter: filter.type,
                      onSelected: (type) {
                        ref.read(filterProvider.notifier).updateFilter(type);
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SummaryItem(
                title: 'REVENUE',
                value: '+₹${summary.totalRevenue}',
                color: AppColors.success,
              ),
              SummaryItem(
                title: 'FUEL',
                value: '-₹${summary.totalFuel}',
                color: AppColors.expense,
              ),
              SummaryItem(
                title: 'PROFIT',
                value: '₹${summary.totalProfit}',
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
