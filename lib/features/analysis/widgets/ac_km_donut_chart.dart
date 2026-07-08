import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/enumerations/ac_type.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import 'legend.dart';

class AcKmDonutChart extends StatelessWidget {
  final int fullKm;
  final int halfKm;
  final int nonKm;

  final double fullAvgKm;
  final double halfAvgKm;
  final double nonAvgKm;

  const AcKmDonutChart({
    super.key,
    required this.fullKm,
    required this.halfKm,
    required this.nonKm,
    required this.fullAvgKm,
    required this.halfAvgKm,
    required this.nonAvgKm,
  });

  @override
  Widget build(BuildContext context) {
    final totalKm = fullKm + halfKm + nonKm;

    if (totalKm <= 0) {
      return const Center(child: Text('No KM data available'));
    }

    final fullPercent = fullKm / totalKm;
    final halfPercent = halfKm / totalKm;
    final nonPercent = nonKm / totalKm;

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
                      value: fullKm.toDouble(),
                      title: fullPercent.percent,
                      color: AppColors.success,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: halfKm.toDouble(),
                      title: halfPercent.percent,
                      color: AppColors.warning,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: nonKm.toDouble(),
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
                    'Total KM',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    totalKm.formatted,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
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

        _KmLegend(
          acType: AcType.full,
          km: fullKm,
          avgKm: fullAvgKm,
          color: AppColors.success,
          percent: fullPercent,
        ),

        const Divider(),

        _KmLegend(
          acType: AcType.half,
          km: halfKm,
          avgKm: halfAvgKm,
          color: AppColors.warning,
          percent: halfPercent,
        ),

        const Divider(),

        _KmLegend(
          acType: AcType.non,
          km: nonKm,
          avgKm: nonAvgKm,
          color: AppColors.expense,
          percent: nonPercent,
        ),
      ],
    );
  }
}

class _KmLegend extends StatelessWidget {
  final AcType acType;
  final int km;
  final double avgKm;
  final Color color;
  final double percent;

  const _KmLegend({
    required this.acType,
    required this.km,
    required this.avgKm,
    required this.color,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Legend(
      title: acType.displayName,
      text: '${avgKm.formatted} KM avg',
      color: color,
      value: '${km.formatted} KM',
      percent: percent,
    );
  }
}
