import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/extensions/number_extension.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/duties_provider.dart';
import '../../providers/duty_summary_provider.dart';
import '../../shared/widgets/records_filter_header.dart';
import 'widgets/ac_profit_row.dart';
import 'widgets/analysis_card.dart';
import 'widgets/bar_row.dart';
import 'widgets/editable_info_row.dart';
import 'widgets/info_row.dart';
import 'widgets/success_box.dart';

class AnalysisScreen extends ConsumerWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duties = ref
        .watch(dutiesProvider)
        .maybeWhen(data: (duties) => duties, orElse: () => []);
    final summary = ref.watch(dutySummaryProvider);

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
                  title: 'Revenue vs Fuel vs Profit',
                  child: Column(
                    children: [
                      BarRow(
                        label: 'Revenue',
                        value: '₹${summary.totalRevenue.inr}',
                        percent: 1,
                      ),

                      const SizedBox(height: 12),

                      BarRow(
                        label: 'Fuel',
                        value: '₹${summary.totalFuel.inr}',
                        percent: summary.totalRevenue == 0
                            ? 0
                            : summary.totalFuel / summary.totalRevenue,
                      ),

                      const SizedBox(height: 12),

                      BarRow(
                        label: 'Profit',
                        value: '₹${summary.totalProfit.inr}',
                        percent: summary.totalRevenue == 0
                            ? 0
                            : summary.totalProfit / summary.totalRevenue,
                      ),
                    ],
                  ),
                ),

                const AnalysisCard(
                  title: 'Fuel Validation',
                  child: Column(
                    children: [
                      InfoRow(label: 'Total KM', value: '1,845 KM'),
                      EditableInfoRow(
                        label: 'Fuel Cost per Ltr',
                        value: '₹110',
                      ),
                      InfoRow(label: 'Expected Fuel Cost', value: '₹11,275'),
                      InfoRow(label: 'Actual Fuel Cost', value: '₹9,500'),
                      SizedBox(height: 8),
                      SuccessBox(
                        message: 'Fuel expense is ₹1,775 lower than expected.',
                      ),
                    ],
                  ),
                ),

                const AnalysisCard(
                  title: 'KM Analysis',
                  child: Column(
                    children: [
                      InfoRow(label: 'Total KM', value: '1,845 KM'),
                      InfoRow(label: 'Average per duty', value: '84 KM'),
                    ],
                  ),
                ),

                const AnalysisCard(
                  title: 'AC Type Split',
                  child: Column(
                    children: [
                      BarRow(label: 'Full AC', value: '42%', percent: 0.42),
                      SizedBox(height: 12),
                      BarRow(label: 'Half AC', value: '38%', percent: 0.38),
                      SizedBox(height: 12),
                      BarRow(label: 'Non AC', value: '20%', percent: 0.20),
                    ],
                  ),
                ),

                const AnalysisCard(
                  title: 'AC Profit Analysis',
                  child: Column(
                    children: [
                      AcProfitRow(
                        acType: 'Full AC',
                        avgProfit: '₹900',
                        avgKm: '80 KM',
                        trips: '8 duties',
                        percent: 1.0,
                      ),
                      SizedBox(height: 14),
                      AcProfitRow(
                        acType: 'Half AC',
                        avgProfit: '₹650',
                        avgKm: '70 KM',
                        trips: '7 duties',
                        percent: 0.72,
                      ),
                      SizedBox(height: 14),
                      AcProfitRow(
                        acType: 'Non AC',
                        avgProfit: '₹500',
                        avgKm: '60 KM',
                        trips: '4 duties',
                        percent: 0.55,
                      ),
                    ],
                  ),
                ),

                const AnalysisCard(
                  title: 'Expense Breakdown',
                  child: Column(
                    children: [
                      InfoRow(label: 'Fuel', value: '₹9,500'),
                      InfoRow(label: 'Toll', value: '₹1,200'),
                      InfoRow(label: 'Parking', value: '₹450'),
                      InfoRow(label: 'Service', value: '₹800'),
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
