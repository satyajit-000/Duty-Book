import '../database/app_database.dart';

class CustomExpenseRepository {
  final AppDatabase db;

  const CustomExpenseRepository(this.db);

  // ==========================================================================
  // CREATE
  // ==========================================================================

  /// Add a single custom expense.
  Future<int> addCustomExpense(CustomExpensesCompanion expense) {
    return db.into(db.customExpenses).insert(expense);
  }

  /// Add multiple custom expenses.
  Future<void> addCustomExpenses(List<CustomExpensesCompanion> expenses) async {
    if (expenses.isEmpty) return;

    await db.batch((batch) {
      batch.insertAll(db.customExpenses, expenses);
    });
  }

  // ==========================================================================
  // READ
  // ==========================================================================

  /// Fetch all custom expenses for a duty.
  Future<List<CustomExpense>> getByDutyId(int dutyId) {
    return (db.select(
      db.customExpenses,
    )..where((tbl) => tbl.dutyId.equals(dutyId))).get();
  }

  // ==========================================================================
  // UPDATE
  // ==========================================================================

  Future<bool> updateCustomExpense(CustomExpense expense) {
    return db.update(db.customExpenses).replace(expense);
  }

  // ==========================================================================
  // DELETE
  // ==========================================================================

  Future<int> deleteCustomExpense(int id) {
    return (db.delete(
      db.customExpenses,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteByDutyId(int dutyId) {
    return (db.delete(
      db.customExpenses,
    )..where((tbl) => tbl.dutyId.equals(dutyId))).go();
  }
}
