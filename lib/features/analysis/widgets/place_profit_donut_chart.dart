import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/duty_list_extension.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/database/app_database.dart';
import 'legend.dart';

class PlaceProfitDonutChart extends StatelessWidget {
  final Map<String, List<Duty>> placeGroups;

  const PlaceProfitDonutChart({super.key, required this.placeGroups});

  @override
  Widget build(BuildContext context) {
    final placeProfits =
        placeGroups.entries
            .map((entry) => MapEntry(entry.key, entry.value.totalProfit))
            .where((entry) => entry.value > 0)
            .toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    if (placeProfits.isEmpty) {
      return const Center(child: Text('No place profit data available'));
    }

    final topPlaces = placeProfits.take(5).toList();
    final otherProfit = placeProfits
        .skip(5)
        .fold<int>(0, (sum, item) => sum + item.value);

    if (otherProfit > 0) {
      topPlaces.add(MapEntry('Others', otherProfit));
    }

    final totalProfit = topPlaces.fold<int>(0, (sum, item) => sum + item.value);

    final colors = [
      AppColors.success,
      AppColors.primary,
      AppColors.warning,
      AppColors.expense,
      Colors.purple,
      Colors.teal,
    ];

    final bestPlace = topPlaces.first;

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
                  sections: List.generate(topPlaces.length, (index) {
                    final item = topPlaces[index];
                    final percent = item.value / totalProfit;

                    return PieChartSectionData(
                      value: item.value.toDouble(),
                      title: percent.percent,
                      radius: 52,
                      color: colors[index % colors.length],
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    );
                  }),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Best Place',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bestPlace.key,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.success,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    bestPlace.value.inr,
                    style: const TextStyle(
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

        ...List.generate(topPlaces.length, (index) {
          final item = topPlaces[index];
          final percent = item.value / totalProfit;

          return Column(
            children: [
              Legend(
                title: item.key,
                value: item.value.inr,
                color: colors[index % colors.length],
                percent: percent,
              ),
              if (index != topPlaces.length - 1) const Divider(),
            ],
          );
        }),
      ],
    );
  }
}
