import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/enumerations/ac_type.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import 'legend.dart';

class AcProfitDonutChart extends StatelessWidget {
  final int fullProfit;
  final int halfProfit;
  final int nonProfit;

  final double fullProfitPerKm;
  final double halfProfitPerKm;
  final double nonProfitPerKm;

  const AcProfitDonutChart({
    super.key,
    required this.fullProfit,
    required this.halfProfit,
    required this.nonProfit,
    required this.fullProfitPerKm,
    required this.halfProfitPerKm,
    required this.nonProfitPerKm,
  });

  @override
  Widget build(BuildContext context) {
    final totalProfit = fullProfit + halfProfit + nonProfit;

    if (totalProfit <= 0) {
      return const Center(child: Text('No profit data available'));
    }

    final fullPercent = fullProfit / totalProfit;
    final halfPercent = halfProfit / totalProfit;
    final nonPercent = nonProfit / totalProfit;

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
                      value: fullProfit.toDouble(),
                      title: fullPercent.percent,
                      color: AppColors.success,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: halfProfit.toDouble(),
                      title: halfPercent.percent,
                      color: AppColors.warning,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: nonProfit.toDouble(),
                      title: nonPercent.percent,
                      color: AppColors.expense,
                      radius: 55,
                    ),
                  ],
                ),
              ),

              // CENTER TEXT
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Total Profit',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    totalProfit.inr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.success,
                    ),
                  ),

                  const SizedBox(height: 2),

                  const Text(
                    '100%',
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

        _ProfitLegend(
          acType: AcType.full,
          profit: fullProfit,
          profitPerKm: fullProfitPerKm,
          color: AppColors.success,
          percent: fullPercent,
        ),

        const Divider(),

        _ProfitLegend(
          acType: AcType.half,
          profit: halfProfit,
          profitPerKm: halfProfitPerKm,
          color: AppColors.warning,
          percent: halfPercent,
        ),

        const Divider(),

        _ProfitLegend(
          acType: AcType.non,
          profit: nonProfit,
          profitPerKm: nonProfitPerKm,
          color: AppColors.expense,
          percent: nonPercent,
        ),
      ],
    );
  }
}

class _ProfitLegend extends StatelessWidget {
  final AcType acType;
  final int profit;
  final double profitPerKm;
  final Color color;
  final double percent;

  const _ProfitLegend({
    required this.acType,
    required this.profit,
    required this.profitPerKm,
    required this.color,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Legend(
      title: acType.displayName,
      text: '${profitPerKm.inr}/KM avg',
      color: color,
      value: profit.inr,
      percent: percent,
    );
  }
}
