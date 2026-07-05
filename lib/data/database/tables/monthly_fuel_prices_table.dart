import 'package:drift/drift.dart';

class MonthlyFuelPrices extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get year => integer()();

  IntColumn get month => integer()();

  IntColumn get fuelPrice => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {year, month},
  ];
}
