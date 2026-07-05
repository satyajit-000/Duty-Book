import '../../data/database/app_database.dart';
import '../enumerations/ac_type.dart';

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

  Map<AcType, List<Duty>> groupByAcType() {
    final grouped = <AcType, List<Duty>>{};

    for (final duty in this) {
      grouped.putIfAbsent(duty.acType, () => []);
      grouped[duty.acType]!.add(duty);
    }

    return grouped;
  }

  Map<String, List<Duty>> groupByPlace() {
    final grouped = <String, List<Duty>>{};

    for (final duty in this) {
      grouped.putIfAbsent(duty.place, () => []);
      grouped[duty.place]!.add(duty);
    }

    return grouped;
  }

  int profitForAc(AcType type) {
    final duties = where((e) => e.acType == type);

    int revenue = 0;
    int expense = 0;

    for (final duty in duties) {
      revenue += duty.rent;
      expense +=
          duty.fuelCost +
          duty.parking +
          duty.toll +
          duty.service +
          duty.tyre +
          duty.insurance +
          duty.engineOil;
    }

    return revenue - expense;
  }

  double get averageKm {
    if (isEmpty) return 0;
    return totalKm / length;
  }

  double get averageRevenue {
    if (isEmpty) return 0;
    return totalRevenue / length;
  }

  double get averageProfit {
    if (isEmpty) return 0;
    return totalProfit / length;
  }
}
