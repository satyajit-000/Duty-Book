import 'package:drift/drift.dart';

class Settings extends Table {
  IntColumn get id => integer()();

  IntColumn get vehicleMileage => integer().withDefault(const Constant(18))();

  BoolColumn get parkingEnabled =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get tollEnabled => boolean().withDefault(const Constant(true))();

  BoolColumn get serviceEnabled =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get tyreEnabled => boolean().withDefault(const Constant(true))();

  BoolColumn get insuranceEnabled =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get engineOilEnabled =>
      boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
