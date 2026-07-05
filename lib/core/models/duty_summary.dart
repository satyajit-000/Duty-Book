class DutySummary {
  final int totalRevenue;
  final int totalFuel;
  final int totalOtherExpense;
  final int totalProfit;
  final int totalKm;
  final int totalDuties;

  const DutySummary({
    required this.totalRevenue,
    required this.totalFuel,
    required this.totalOtherExpense,
    required this.totalProfit,
    required this.totalKm,
    required this.totalDuties,
  });

  factory DutySummary.empty() {
    return const DutySummary(
      totalRevenue: 0,
      totalFuel: 0,
      totalOtherExpense: 0,
      totalProfit: 0,
      totalKm: 0,
      totalDuties: 0,
    );
  }
}
