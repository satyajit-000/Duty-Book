import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enumerations/ac_type.dart';
import '../../core/extensions/duty_list_extension.dart';
import '../../core/extensions/number_extension.dart';
import '../../core/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../providers/duties_provider.dart';
import '../../providers/duty_summary_provider.dart';
import '../../shared/widgets/records_filter_header.dart';
import '../../shared/widgets/success_box.dart';
import '../../shared/widgets/warning_box.dart';
import '../analysis/widgets/editable_info_row.dart';
import 'widgets/place_distribution_card.dart';
import 'widgets/report_card.dart';
import 'widgets/report_row.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duties = ref
        .watch(dutiesProvider)
        .maybeWhen(data: (duties) => duties, orElse: () => <Duty>[]);

    final summary = ref.watch(dutySummaryProvider);

    final fullAcDuties = duties
        .where((duty) => duty.acType == AcType.full)
        .toList();
    final halfAcDuties = duties
        .where((duty) => duty.acType == AcType.half)
        .toList();
    final nonAcDuties = duties
        .where((duty) => duty.acType == AcType.non)
        .toList();

    final bestPlace = duties.bestPerformingPlace;

    final bestPlaceDuties = bestPlace == null
        ? <Duty>[]
        : duties.groupByPlace()[bestPlace] ?? <Duty>[];

    const mileage = 12.0;
    const fuelPrice = 102.0;

    final expectedFuelCost = mileage == 0
        ? 0
        : ((summary.totalKm / mileage) * fuelPrice).round();

    final fuelDifference = expectedFuelCost - summary.totalFuel;

    final acPerformanceData = [
      (
        metric: 'Duties',
        full: fullAcDuties.length.toString(),
        half: halfAcDuties.length.toString(),
        non: nonAcDuties.length.toString(),
      ),
      (
        metric: 'KM',
        full: fullAcDuties.totalKm.formatted,
        half: halfAcDuties.totalKm.formatted,
        non: nonAcDuties.totalKm.formatted,
      ),
      (
        metric: 'Revenue',
        full: fullAcDuties.totalRevenue.inr,
        half: halfAcDuties.totalRevenue.inr,
        non: nonAcDuties.totalRevenue.inr,
      ),
      (
        metric: 'Fuel',
        full: fullAcDuties.totalFuel.inr,
        half: halfAcDuties.totalFuel.inr,
        non: nonAcDuties.totalFuel.inr,
      ),
      (
        metric: 'Profit',
        full: fullAcDuties.totalProfit.inr,
        half: halfAcDuties.totalProfit.inr,
        non: nonAcDuties.totalProfit.inr,
      ),
      (
        metric: 'Profit / KM',
        full: fullAcDuties.averageProfit.inr,
        half: halfAcDuties.averageProfit.inr,
        non: nonAcDuties.averageProfit.inr,
      ),
    ];

    final bestAc = duties.bestAcType;

    final bestAcDuties = switch (bestAc) {
      AcType.full => fullAcDuties,
      AcType.half => halfAcDuties,
      AcType.non => nonAcDuties,
      null => <Duty>[],
    };

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const RecordsFilterHeader(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ReportCard(
                  title: 'Duty Summary',
                  child: Column(
                    children: [
                      ReportRow(
                        label: 'Total Duties',
                        value: summary.totalDuties.toString(),
                      ),
                      ReportRow(
                        label: 'Total KM',
                        value: '${summary.totalKm.formatted} KM',
                      ),
                      ReportRow(
                        label: 'Average KM / Duty',
                        value: '${duties.averageKm.round().formatted} KM',
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Income & Profit',
                  child: Column(
                    children: [
                      ReportRow(
                        label: 'Revenue',
                        value: '+${summary.totalRevenue.inr}',
                        valueColor: AppColors.success,
                      ),
                      ReportRow(
                        label: 'Fuel Expense',
                        value: '-${summary.totalFuel.inr}',
                        valueColor: AppColors.expense,
                      ),
                      ReportRow(
                        label: 'Other Expenses',
                        value: '-${summary.totalOtherExpense.inr}',
                        valueColor: AppColors.expense,
                      ),
                      const Divider(),
                      ReportRow(
                        label: 'Net Profit',
                        value: '+${summary.totalProfit.inr}',
                        valueColor: summary.totalProfit >= 0
                            ? AppColors.success
                            : AppColors.expense,
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Other Expenses',
                  child: Column(
                    children: [
                      ...duties.expenseBreakdown.entries.map(
                        (expense) => ReportRow(
                          label: expense.key,
                          value: expense.value.inr,
                        ),
                      ),
                      const Divider(),
                      ReportRow(label: 'Total', value: duties.totalExpense.inr),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Fuel Validation',
                  child: Column(
                    children: [
                      const ReportRow(label: 'Mileage', value: '$mileage KM/L'),
                      ReportRow(label: 'Fuel Price', value: fuelPrice.inr),
                      ReportRow(
                        label: 'Expected Fuel Cost',
                        value: expectedFuelCost.inr,
                      ),
                      ReportRow(
                        label: 'Actual Fuel Cost',
                        value: summary.totalFuel.inr,
                      ),
                      ReportRow(
                        label: 'Difference',
                        value: fuelDifference >= 0
                            ? '+${fuelDifference.inr}'
                            : '-${(-fuelDifference).inr}',
                        valueColor: fuelDifference >= 0
                            ? AppColors.success
                            : AppColors.expense,
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Fuel Validation',
                  child: Column(
                    children: [
                      ReportRow(
                        label: 'Total KM',
                        value: '${summary.totalKm.formatted} KM',
                      ),

                      EditableInfoRow(label: 'Mileage', value: '$mileage KM/L'),

                      EditableInfoRow(
                        label: 'Fuel Price',
                        value: fuelPrice.inr,
                      ),

                      ReportRow(
                        label: 'Expected Fuel Cost',
                        value: expectedFuelCost.inr,
                      ),

                      ReportRow(
                        label: 'Actual Fuel Cost',
                        value: summary.totalFuel.inr,
                      ),
                      const Divider(),
                      ReportRow(
                        label: 'Difference',
                        value: fuelDifference >= 0
                            ? '+${fuelDifference.inr}'
                            : '-${(-fuelDifference).inr}',
                        valueColor: fuelDifference >= 0
                            ? AppColors.success
                            : AppColors.expense,
                      ),

                      const SizedBox(height: 8),

                      if (fuelDifference >= 0)
                        SuccessBox(
                          message:
                              'Fuel expense is ${fuelDifference.inr} lower than expected.',
                        )
                      else
                        WarningBox(
                          message:
                              'Fuel expense exceeded expected by ${(-fuelDifference).inr}.',
                        ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'AC Performance Comparison',
                  child: Table(
                    border: TableBorder.all(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      const TableRow(
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                        ),
                        children: [
                          _TableCell('Metric', isHeader: true),
                          _TableCell('Full', isHeader: true),
                          _TableCell('Half', isHeader: true),
                          _TableCell('Non', isHeader: true),
                        ],
                      ),

                      ...acPerformanceData.map(
                        (row) => TableRow(
                          children: [
                            _TableCell(row.metric, isHeader: true),
                            _TableCell(row.full),
                            _TableCell(row.half),
                            _TableCell(row.non),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Best Performing AC',
                  child: Column(
                    children: [
                      ReportRow(
                        label: 'Best AC Type',
                        value: bestAc?.displayName ?? '-',
                      ),

                      ReportRow(
                        label: 'Total Duties',
                        value: bestAcDuties.length.toString(),
                      ),

                      ReportRow(
                        label: 'Total Revenue',
                        value: bestAcDuties.totalRevenue.inr,
                      ),

                      ReportRow(
                        label: 'Total Profit',
                        value: bestAcDuties.totalProfit.inr,
                        valueColor: AppColors.success,
                      ),

                      ReportRow(
                        label: 'Average Profit / KM',
                        value: bestAcDuties.averageProfit.inr,
                        valueColor: AppColors.success,
                      ),

                      ReportRow(
                        label: 'Average KM / duty',
                        value:
                            '+${bestAcDuties.averageKm.round().formatted} KM',
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Best Performing Place',
                  child: Column(
                    children: [
                      ReportRow(label: 'Place', value: bestPlace ?? '-'),
                      ReportRow(
                        label: 'Total Duties',
                        value: bestPlaceDuties.length.toString(),
                      ),
                      ReportRow(
                        label: 'Total KM',
                        value: '${bestPlaceDuties.totalKm.formatted} KM',
                      ),
                      ReportRow(
                        label: 'Total Revenue',
                        value: bestPlaceDuties.totalRevenue.inr,
                      ),
                      ReportRow(
                        label: 'Total Profit',
                        value: bestPlaceDuties.totalProfit.inr,
                        valueColor: AppColors.success,
                      ),
                      ReportRow(
                        label: 'Average Profit / KM',
                        value: bestPlaceDuties.averageProfit.inr,
                        valueColor: AppColors.success,
                      ),
                    ],
                  ),
                ),

                ReportCard(
                  title: 'Place Distribution',
                  child: PlaceDistributionCard(places: duties.placesByProfit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String text;
  final bool isHeader;

  const _TableCell(this.text, {this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
          color: isHeader ? AppColors.primary : AppColors.textPrimary,
        ),
      ),
    );
  }
}
