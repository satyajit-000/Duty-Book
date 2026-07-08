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
import 'widgets/ac_km_donut_chart.dart';
import 'widgets/ac_profit_donut_chart.dart';
import 'widgets/ac_type_donut_chart.dart';
import 'widgets/analysis_card.dart';
import 'widgets/editable_info_row.dart';
import 'widgets/expense_donut_chart.dart';
import 'widgets/info_row.dart';
import 'widgets/revenue_distribution_donut_chart.dart';
import 'widgets/success_box.dart';
import 'widgets/warning_box.dart';

class AnalysisScreen extends ConsumerWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duties = ref
        .watch(dutiesProvider)
        .maybeWhen(data: (duties) => duties, orElse: () => <Duty>[]);
    final summary = ref.watch(dutySummaryProvider);

    final acGroups = duties.groupByAcType();

    final fullAcDuties = acGroups[AcType.full] ?? <Duty>[];
    final halfAcDuties = acGroups[AcType.half] ?? <Duty>[];
    final nonAcDuties = acGroups[AcType.non] ?? <Duty>[];

    final fullCount = fullAcDuties.length;
    final halfCount = halfAcDuties.length;
    final nonCount = nonAcDuties.length;

    final fullProfit = fullAcDuties.totalProfit;
    final halfProfit = halfAcDuties.totalProfit;
    final nonProfit = nonAcDuties.totalProfit;

    final mileage = 12.0; // later editable
    final fuelPrice = 102.0; // later editable

    final expectedFuel = mileage == 0
        ? 0
        : ((summary.totalKm / mileage) * fuelPrice).round();

    final actualFuel = summary.totalFuel;

    final fuelDifference = expectedFuel - actualFuel;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const RecordsFilterHeader(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                AnalysisCard(
                  title: 'Revenue Distribution',
                  child: RevenueDistributionDonutChart(
                    revenue: summary.totalRevenue,
                    fuel: summary.totalFuel,
                    otherExpense: summary.totalOtherExpense,
                    profit: summary.totalProfit,
                  ),
                ),

                AnalysisCard(
                  title: 'Expense Breakdown',
                  child: ExpenseDonutChart(
                    expenses: duties.expenseBreakdown,
                    revenue: summary.totalRevenue,
                  ),
                ),

                AnalysisCard(
                  title: 'AC Type Split',
                  child: AcTypeDonutChart(
                    fullCount: fullCount,
                    halfCount: halfCount,
                    nonCount: nonCount,
                  ),
                ),

                AnalysisCard(
                  title: 'AC Profit Distribution',
                  child: AcProfitDonutChart(
                    fullProfit: fullProfit,
                    halfProfit: halfProfit,
                    nonProfit: nonProfit,

                    fullProfitPerKm: fullAcDuties.averageProfit,
                    halfProfitPerKm: halfAcDuties.averageProfit,
                    nonProfitPerKm: nonAcDuties.averageProfit,
                    avgProfitPerKm: duties.averageProfit,
                  ),
                ),

                AnalysisCard(
                  title: 'AC KM Distribution',
                  child: AcKmDonutChart(
                    fullKm: fullAcDuties.totalKm,
                    halfKm: halfAcDuties.totalKm,
                    nonKm: nonAcDuties.totalKm,

                    fullAvgKm: fullAcDuties.averageKm,
                    halfAvgKm: halfAcDuties.averageKm,
                    nonAvgKm: nonAcDuties.averageKm,
                    avgKm: duties.averageKm,
                  ),
                ),

                AnalysisCard(
                  title: 'Fuel Validation',
                  child: Column(
                    children: [
                      InfoRow(
                        label: 'Total KM',
                        value: '${summary.totalKm.formatted} KM',
                      ),

                      EditableInfoRow(label: 'Mileage', value: '$mileage KM/L'),

                      EditableInfoRow(
                        label: 'Fuel Price',
                        value: fuelPrice.inr,
                      ),

                      InfoRow(
                        label: 'Expected Fuel Cost',
                        value: expectedFuel.inr,
                      ),

                      InfoRow(label: 'Actual Fuel Cost', value: actualFuel.inr),

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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
