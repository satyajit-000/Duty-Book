import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/extensions/duty_list_extension.dart';
import '../core/models/duty_summary.dart';
import 'duties_provider.dart';

final dutySummaryProvider = Provider<DutySummary>((ref) {
  final dutiesAsync = ref.watch(dutiesProvider);

  return dutiesAsync.maybeWhen(
    data: (duties) {
      return DutySummary(
        totalRevenue: duties.totalRevenue,
        totalFuel: duties.totalFuel,
        totalOtherExpense: duties.totalOtherExpense,
        totalProfit: duties.totalProfit,
        totalKm: duties.totalKm,
        totalDuties: duties.length,
      );
    },
    orElse: DutySummary.empty,
  );
});
