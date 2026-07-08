import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/database/app_database.dart';
import 'legend.dart';

class PlaceVisitDonutChart extends StatelessWidget {
  final Map<String, List<Duty>> placeGroups;

  const PlaceVisitDonutChart({super.key, required this.placeGroups});

  @override
  Widget build(BuildContext context) {
    final placeVisits =
        placeGroups.entries
            .map((entry) => MapEntry(entry.key, entry.value.length))
            .where((entry) => entry.value > 0)
            .toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    if (placeVisits.isEmpty) {
      return const Center(child: Text('No place visit data available'));
    }

    final topPlaces = placeVisits.take(5).toList();

    final otherVisits = placeVisits
        .skip(5)
        .fold<int>(0, (sum, item) => sum + item.value);

    if (otherVisits > 0) {
      topPlaces.add(MapEntry('Others', otherVisits));
    }

    final totalVisits = topPlaces.fold<int>(0, (sum, item) => sum + item.value);

    final mostVisited = topPlaces.first;

    final colors = [
      AppColors.primary,
      AppColors.success,
      AppColors.warning,
      AppColors.expense,
      Colors.purple,
      Colors.teal,
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
                  sectionsSpace: 4,
                  sections: List.generate(topPlaces.length, (index) {
                    final item = topPlaces[index];
                    final percent = item.value / totalVisits;

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
                    'Most Visited',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    mostVisited.key,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${mostVisited.value} visits',
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
          final percent = item.value / totalVisits;

          return Column(
            children: [
              Legend(
                title: item.key,
                value: '${item.value} visits',
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
