import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../providers/filter_provider.dart';
import '../../shared/widgets/display_options_dialog.dart';
import '../../shared/widgets/records_filter_header.dart';
import '../../shared/widgets/summary_item.dart';
import 'widgets/report_card.dart';
import 'widgets/report_row.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

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
              children: const [
                Text(
                  'Showing: monthly',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),

                ReportCard(
                  title: 'Duty Summary',
                  child: Column(
                    children: [
                      ReportRow(label: 'Total Duties', value: '22'),
                      ReportRow(label: 'Total KM', value: '1,845 KM'),
                      ReportRow(label: 'Average KM / Duty', value: '84 KM'),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Income & Profit',
                  child: Column(
                    children: [
                      ReportRow(
                        label: 'Revenue',
                        value: '₹26,000',
                        valueColor: AppColors.success,
                      ),
                      ReportRow(
                        label: 'Fuel Expense',
                        value: '₹9,500',
                        valueColor: AppColors.expense,
                      ),
                      ReportRow(
                        label: 'Other Expenses',
                        value: '₹1,850',
                        valueColor: AppColors.expense,
                      ),
                      ReportRow(
                        label: 'Net Profit',
                        value: '₹14,650',
                        valueColor: AppColors.success,
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Other Expenses',
                  child: Column(
                    children: [
                      ReportRow(label: 'Parking', value: '₹450'),
                      ReportRow(label: 'Toll', value: '₹1,200'),
                      ReportRow(label: 'Service', value: '₹800'),
                      ReportRow(label: 'Tyre', value: '₹0'),
                      ReportRow(label: 'Insurance', value: '₹0'),
                      ReportRow(label: 'Engine Oil', value: '₹600'),
                      ReportRow(label: 'Custom Expenses', value: '₹300'),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Fuel Validation',
                  child: Column(
                    children: [
                      ReportRow(label: 'Mileage', value: '18 KM/L'),
                      ReportRow(label: 'Fuel Price', value: '₹110'),
                      ReportRow(label: 'Expected Fuel Cost', value: '₹11,275'),
                      ReportRow(label: 'Actual Fuel Cost', value: '₹9,500'),
                      ReportRow(
                        label: 'Difference',
                        value: '+₹1,775',
                        valueColor: AppColors.success,
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'AC Wise Report',
                  child: Column(
                    children: [
                      ReportRow(label: 'Full AC Duties', value: '8'),
                      ReportRow(label: 'Full AC Revenue', value: '₹12,000'),
                      ReportRow(
                        label: 'Full AC Profit',
                        value: '₹7,200',
                        valueColor: AppColors.success,
                      ),
                      ReportRow(label: 'Half AC Duties', value: '7'),
                      ReportRow(label: 'Half AC Revenue', value: '₹9,000'),
                      ReportRow(
                        label: 'Half AC Profit',
                        value: '₹4,200',
                        valueColor: AppColors.success,
                      ),
                      ReportRow(label: 'Non AC Duties', value: '4'),
                      ReportRow(label: 'Non AC Revenue', value: '₹5,000'),
                      ReportRow(
                        label: 'Non AC Profit',
                        value: '₹1,800',
                        valueColor: AppColors.success,
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Best Performing AC Type',
                  child: Column(
                    children: [
                      ReportRow(label: 'Most Profitable', value: 'Full AC 🏆'),
                      ReportRow(
                        label: 'Average Profit',
                        value: '₹900 / duty',
                        valueColor: AppColors.success,
                      ),
                      ReportRow(label: 'Average Distance', value: '80 KM'),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Best Performing Place',
                  child: Column(
                    children: [
                      ReportRow(
                        label: 'Most Profitable Place',
                        value: 'Puri 🏆',
                      ),
                      ReportRow(
                        label: 'Average Profit',
                        value: '₹1,250 / duty',
                        valueColor: AppColors.success,
                      ),
                      ReportRow(label: 'Average Distance', value: '180 KM'),
                      ReportRow(label: 'Total Duties', value: '5'),
                      ReportRow(label: 'Total Revenue', value: '₹16,000'),
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
