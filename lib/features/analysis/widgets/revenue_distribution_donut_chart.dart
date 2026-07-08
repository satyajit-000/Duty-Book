import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import 'legend.dart';

class RevenueDistributionDonutChart extends StatelessWidget {
  final int revenue;
  final int fuel;
  final int otherExpense;
  final int profit;

  const RevenueDistributionDonutChart({
    super.key,
    required this.revenue,
    required this.fuel,
    required this.otherExpense,
    required this.profit,
  });

  @override
  Widget build(BuildContext context) {
    if (revenue <= 0) {
      return const Center(child: Text('No revenue available'));
    }

    final fuelPercent = fuel / revenue;
    final otherPercent = otherExpense / revenue;
    final profitPercent = profit / revenue;

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  centerSpaceRadius: 60,
                  sectionsSpace: 4,
                  sections: [
                    PieChartSectionData(
                      value: profit.toDouble(),
                      title: profitPercent.percent,
                      color: AppColors.success,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: fuel.toDouble(),
                      title: fuelPercent.percent,
                      color: AppColors.expense,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: otherExpense.toDouble(),
                      title: otherPercent.percent,
                      color: AppColors.warning,
                      radius: 55,
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Revenue',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    revenue.inr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Profit: ${profitPercent.percent}',
                    style: TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Legend(
          title: 'Fuel',
          value: fuel.inr,
          percent: fuelPercent,
          color: AppColors.expense,
        ),

        const Divider(),

        Legend(
          title: 'Other Expense',
          value: otherExpense.inr,
          percent: otherPercent,
          color: AppColors.warning,
        ),

        const Divider(),

        Legend(
          title: 'Profit',
          value: profit.inr,
          percent: profitPercent,
          color: AppColors.success,
        ),
      ],
    );
  }
}
