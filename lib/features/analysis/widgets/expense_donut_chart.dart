import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import 'legend.dart';

class ExpenseDonutChart extends StatelessWidget {
  final Map<String, int> expenses;
  final int revenue;

  const ExpenseDonutChart({
    super.key,
    required this.expenses,
    required this.revenue,
  });

  @override
  Widget build(BuildContext context) {
    final filteredExpenses = expenses.entries
        .where((e) => e.value > 0)
        .toList();

    if (filteredExpenses.isEmpty) {
      return const Center(child: Text('No expense data available'));
    }

    final total = filteredExpenses.fold(
      0,
      (sum, expense) => sum + expense.value,
    );

    final totalExpensePercentOfRevenue = total / revenue;

    final colors = const [
      AppColors.expense,
      AppColors.warning,
      AppColors.primary,
      AppColors.success,
      Colors.purple,
      Colors.teal,
      Colors.orange,
      Colors.indigo,
    ];

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
                  sectionsSpace: 3,
                  sections: List.generate(filteredExpenses.length, (index) {
                    final expense = filteredExpenses[index];
                    final percent = expense.value / total;

                    return PieChartSectionData(
                      value: expense.value.toDouble(),
                      title: percent.percent,
                      radius: 55,
                      color: colors[index % colors.length],
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    );
                  }),
                ),
              ),
              // CENTER TEXT
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Total Expense',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    total.inr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.danger,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    totalExpensePercentOfRevenue.percent,
                    style: const TextStyle(
                      color: AppColors.expense,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'of Revenue',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        ...List.generate(filteredExpenses.length, (index) {
          final expense = filteredExpenses[index];
          final percent = expense.value / total;

          return Column(
            // padding: const EdgeInsets.only(bottom: 10),
            children: [
              Legend(
                title: expense.key,
                color: colors[index % colors.length],
                value: expense.value.inr,
                percent: percent,
              ),
              if (index < filteredExpenses.length - 1) const Divider(),
            ],
          );
        }),
      ],
    );
  }
}
