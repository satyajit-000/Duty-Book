import 'package:drift/drift.dart';

import '../../../core/enumerations/ac_type.dart';

class Duties extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  TextColumn get place => text()();

  IntColumn get startKm => integer()();

  IntColumn get endKm => integer()();

  IntColumn get totalKm => integer()();

  TextColumn get acType => textEnum<AcType>()();

  IntColumn get rent => integer()();

  IntColumn get fuelCost => integer()();

  IntColumn get parking => integer().withDefault(const Constant(0))();

  IntColumn get toll => integer().withDefault(const Constant(0))();

  IntColumn get service => integer().withDefault(const Constant(0))();

  IntColumn get tyre => integer().withDefault(const Constant(0))();

  IntColumn get insurance => integer().withDefault(const Constant(0))();

  IntColumn get engineOil => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
