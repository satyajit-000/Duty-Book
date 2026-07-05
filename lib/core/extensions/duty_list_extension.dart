import '../../data/database/app_database.dart';

extension DutyListExtension on List<Duty> {
  int get totalRevenue => fold(0, (sum, duty) => sum + duty.rent);

  int get totalFuel => fold(0, (sum, duty) => sum + duty.fuelCost);

  int get totalOtherExpense => fold(
    0,
    (sum, duty) =>
        sum +
        duty.parking +
        duty.toll +
        duty.service +
        duty.tyre +
        duty.insurance +
        duty.engineOil,
  );

  int get totalProfit => totalRevenue - totalFuel - totalOtherExpense;

  int get totalKm => fold(0, (sum, duty) => sum + duty.totalKm);

  Map<DateTime, List<Duty>> groupByDate() {
    final grouped = <DateTime, List<Duty>>{};

    for (final duty in this) {
      final key = DateTime(duty.date.year, duty.date.month, duty.date.day);

      grouped.putIfAbsent(key, () => []);
      grouped[key]!.add(duty);
    }

    return grouped;
  }
}
