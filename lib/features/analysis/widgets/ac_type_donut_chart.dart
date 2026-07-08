import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/enumerations/ac_type.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import 'legend.dart';

class AcTypeDonutChart extends StatelessWidget {
  final int fullCount;
  final int halfCount;
  final int nonCount;

  const AcTypeDonutChart({
    super.key,
    required this.fullCount,
    required this.halfCount,
    required this.nonCount,
  });

  @override
  Widget build(BuildContext context) {
    final total = fullCount + halfCount + nonCount;

    if (total == 0) {
      return const Center(child: Text('No AC data available'));
    }

    final fullPercent = fullCount / total;
    final halfPercent = halfCount / total;
    final nonPercent = nonCount / total;

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
                      value: fullCount.toDouble(),
                      title: fullPercent.percent,
                      radius: 52,
                      color: AppColors.success,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                    PieChartSectionData(
                      value: halfCount.toDouble(),
                      title: halfPercent.percent,
                      radius: 52,
                      color: AppColors.warning,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                    PieChartSectionData(
                      value: nonCount.toDouble(),
                      title: nonPercent.percent,
                      radius: 52,
                      color: AppColors.expense,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              // CENTER TEXT
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Total Duties',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    total.inr,
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
        const SizedBox(height: 12),
        Legend(
          title: AcType.full.displayName,
          value: '$fullCount duties',
          color: AppColors.success,
          percent: fullPercent,
        ),

        const Divider(),

        Legend(
          title: AcType.half.displayName,
          value: '$halfCount duties',
          color: AppColors.warning,
          percent: halfPercent,
        ),

        const Divider(),

        Legend(
          title: AcType.non.displayName,
          value: '$nonCount duties',
          color: AppColors.expense,
          percent: nonPercent,
        ),
      ],
    );
  }
}
