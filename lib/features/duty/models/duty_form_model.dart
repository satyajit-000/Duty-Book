import '../../../core/enumerations/ac_type.dart';
import 'custom_expense.dart';

class DutyFormModel {
  DateTime date;
  String place;

  int startKm;
  int endKm;
  int totalKm;

  AcType acType;

  int rent;
  int fuelCost;

  int parking;
  int toll;
  int service;
  int tyre;
  int insurance;
  int engineOil;

  List<CustomExpense> customExpenses;

  DutyFormModel({
    required this.date,
    required this.place,
    required this.startKm,
    required this.endKm,
    required this.totalKm,
    required this.acType,
    required this.rent,
    required this.fuelCost,
    required this.parking,
    required this.toll,
    required this.service,
    required this.tyre,
    required this.insurance,
    required this.engineOil,
    required this.customExpenses,
  });

  int get totalOtherExpense =>
      parking +
      toll +
      service +
      tyre +
      insurance +
      engineOil +
      customExpenses.fold(0, (sum, item) => sum + item.amount);

  int get totalExpense => fuelCost + totalOtherExpense;

  int get profit => rent - totalExpense;
}
