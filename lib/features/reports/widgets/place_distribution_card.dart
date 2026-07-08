import 'package:flutter/material.dart';

import '../../../core/enumerations/ac_type.dart';
import '../../../core/extensions/duty_list_extension.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/database/app_database.dart';

class PlaceDistributionCard extends StatelessWidget {
  final List<MapEntry<String, List<Duty>>> places;

  const PlaceDistributionCard({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(child: Text('No place data available'));
    }

    return Column(
      children: places.map((entry) {
        final place = entry.key;
        final duties = entry.value;

        final full = duties.where((e) => e.acType == AcType.full).length;
        final half = duties.where((e) => e.acType == AcType.half).length;
        final non = duties.where((e) => e.acType == AcType.non).length;

        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.primaryLight.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10),

              _InfoLine(label: 'Visits', value: '${duties.length} times'),
              _InfoLine(
                label: 'Total KM',
                value: '${duties.totalKm.formatted} KM',
              ),
              _InfoLine(label: 'Revenue', value: duties.totalRevenue.inr),
              _InfoLine(label: 'Profit', value: duties.totalProfit.inr),
              _InfoLine(label: 'Profit / KM', value: duties.averageProfit.inr),

              const Divider(height: 22),

              Row(
                children: [
                  _AcChip(label: 'Full', value: full, color: AppColors.success),
                  const SizedBox(width: 8),
                  _AcChip(label: 'Half', value: half, color: AppColors.warning),
                  const SizedBox(width: 8),
                  _AcChip(label: 'Non', value: non, color: AppColors.expense),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _InfoLine extends StatelessWidget {
  final String label;
  final String value;

  const _InfoLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class _AcChip extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _AcChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '$label: $value',
          textAlign: TextAlign.center,
          style: TextStyle(color: color, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
