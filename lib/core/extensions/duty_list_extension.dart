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

  int get totalExpense => totalFuel + totalOtherExpense;

  int get totalProfit => totalRevenue - totalExpense;

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
    return totalProfit / totalKm;
  }

  int get totalParking => fold(0, (sum, duty) => sum + duty.parking);

  int get totalToll => fold(0, (sum, duty) => sum + duty.toll);

  int get totalService => fold(0, (sum, duty) => sum + duty.service);

  int get totalTyre => fold(0, (sum, duty) => sum + duty.tyre);

  int get totalInsurance => fold(0, (sum, duty) => sum + duty.insurance);

  int get totalEngineOil => fold(0, (sum, duty) => sum + duty.engineOil);

  String? get mostFrequentPlace {
    if (isEmpty) return null;

    final grouped = groupByPlace();

    return grouped.entries
        .reduce((a, b) => a.value.length > b.value.length ? a : b)
        .key;
  }

  AcType? get bestAcType {
    final profits = {
      AcType.full: profitForAc(AcType.full),
      AcType.half: profitForAc(AcType.half),
      AcType.non: profitForAc(AcType.non),
    };

    return profits.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  Map<String, int> get expenseBreakdown => {
    'Fuel': totalFuel,
    'Parking': totalParking,
    'Toll': totalToll,
    'Service': totalService,
    'Tyre': totalTyre,
    'Insurance': totalInsurance,
    'Engine Oil': totalEngineOil,
  };

  String get highestExpenseCategory {
    return expenseBreakdown.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  String? get bestPerformingPlace {
    if (isEmpty) return null;

    final grouped = groupByPlace();

    return grouped.entries
        .reduce((a, b) => a.value.totalProfit > b.value.totalProfit ? a : b)
        .key;
  }

  // Map<String, int> get profitByPlace {
  //   final grouped = groupByPlace();
  //
  //   return grouped.map((place, duties) => MapEntry(place, duties.totalProfit));
  // }

  List<MapEntry<String, List<Duty>>> get placesByProfit {
    final places = groupByPlace().entries.toList();

    places.sort((a, b) => b.value.totalProfit.compareTo(a.value.totalProfit));

    return places;
  }
}
