import 'package:drift/drift.dart';

import 'duties_table.dart';

class CustomExpenses extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get dutyId =>
      integer().references(Duties, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text()();

  IntColumn get amount => integer()();
}
