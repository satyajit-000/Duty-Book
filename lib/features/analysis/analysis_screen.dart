import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../providers/filter_provider.dart';
import '../../shared/widgets/records_filter_header.dart';
import '../../shared/widgets/summary_item.dart';
import '../records/widgets/display_options_dialog.dart';

class AnalysisScreen extends ConsumerWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(filterProvider).type;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          RecordsFilterHeader(
            selectedDate: DateTime(2026, 7),
            onPrevious: () {},
            onNext: () {},
            onFilterTap: () {
              showDialog(
                context: context,
                builder: (_) => DisplayOptionsDialog(
                  selectedFilter: selectedFilter,
                  onSelected: (filter) {
                    ref.read(filterProvider.notifier).updateFilter(filter);
                  },
                ),
              );
            },
            summaryItems: const [
              SummaryItem(
                title: 'REVENUE',
                value: '+₹26,000',
                color: AppColors.success,
              ),
              SummaryItem(
                title: 'FUEL',
                value: '-₹9,500',
                color: AppColors.expense,
              ),
              SummaryItem(
                title: 'PROFIT',
                value: '+₹16,500',
                color: Colors.white,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Showing: ${selectedFilter.name}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                const _AnalysisCard(
                  title: 'Revenue vs Fuel',
                  child: Column(
                    children: [
                      _BarRow(label: 'Revenue', value: '₹26,000', percent: 1.0),
                      SizedBox(height: 12),
                      _BarRow(label: 'Fuel', value: '₹9,500', percent: 0.36),
                    ],
                  ),
                ),

                const _AnalysisCard(
                  title: 'Profit',
                  child: _BigValue(
                    value: '₹16,500',
                    subtitle: 'Estimated profit after fuel',
                    color: AppColors.success,
                  ),
                ),

                const _AnalysisCard(
                  title: 'KM Analysis',
                  child: Column(
                    children: [
                      _InfoRow(label: 'Total KM', value: '1,845 KM'),
                      _InfoRow(label: 'Average per duty', value: '84 KM'),
                    ],
                  ),
                ),

                const _AnalysisCard(
                  title: 'AC Type Split',
                  child: Column(
                    children: [
                      _BarRow(label: 'Full AC', value: '42%', percent: 0.42),
                      SizedBox(height: 12),
                      _BarRow(label: 'Half AC', value: '38%', percent: 0.38),
                      SizedBox(height: 12),
                      _BarRow(label: 'Non AC', value: '20%', percent: 0.20),
                    ],
                  ),
                ),

                const _AnalysisCard(
                  title: 'Expense Breakdown',
                  child: Column(
                    children: [
                      _InfoRow(label: 'Fuel', value: '₹9,500'),
                      _InfoRow(label: 'Toll', value: '₹1,200'),
                      _InfoRow(label: 'Parking', value: '₹450'),
                      _InfoRow(label: 'Service', value: '₹800'),
                    ],
                  ),
                ),

                const _AnalysisCard(
                  title: 'Fuel Validation',
                  child: Column(
                    children: [
                      _InfoRow(label: 'Total KM', value: '1,845 KM'),
                      _EditableInfoRow(
                        label: 'Fuel Cost per Ltr',
                        value: '₹110',
                      ),
                      _InfoRow(label: 'Expected Fuel Cost', value: '₹11,275'),
                      _InfoRow(label: 'Actual Fuel Cost', value: '₹9,500'),
                      SizedBox(height: 8),
                      _SuccessBox(
                        message: 'Fuel expense is ₹1,775 lower than expected.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalysisCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _AnalysisCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _BarRow extends StatelessWidget {
  final String label;
  final String value;
  final double percent;

  const _BarRow({
    required this.label,
    required this.value,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 10,
            backgroundColor: AppColors.border,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class _BigValue extends StatelessWidget {
  final String value;
  final String subtitle;
  final Color color;

  const _BigValue({
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: AppColors.textSecondary)),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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

class _EditableInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _EditableInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          Row(
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(width: 6),
              const Icon(
                Icons.edit_rounded,
                size: 16,
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SuccessBox extends StatelessWidget {
  final String message;

  const _SuccessBox({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: AppColors.success,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _WarningBox extends StatelessWidget {
  final String message;

  const _WarningBox({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: AppColors.warning,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
