import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../core/enumerations/ac_type.dart';
import 'tables/custom_expenses_table.dart';
import 'tables/duties_table.dart';
import 'tables/monthly_fuel_prices_table.dart';
import 'tables/settings_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Duties, CustomExpenses, Settings, MonthlyFuelPrices])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'duty_book.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
