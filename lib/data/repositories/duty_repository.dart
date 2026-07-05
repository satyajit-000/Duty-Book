import 'package:drift/drift.dart';

import '../database/app_database.dart';

class DutyRepository {
  final AppDatabase db;

  const DutyRepository(this.db);

  // ==========================================================================
  // CREATE
  // ==========================================================================

  /// Add a new duty record.
  Future<int> addDuty(DutiesCompanion duty) {
    return db.into(db.duties).insert(duty);
  }

  /// Add multiple duty records at once.
  /// Useful for import, backup restore, or future OCR/OpenCV bulk entry.
  Future<void> addDuties(List<DutiesCompanion> duties) async {
    if (duties.isEmpty) return;

    await db.batch((batch) {
      batch.insertAll(db.duties, duties);
    });
  }

  // ==========================================================================
  // READ
  // ==========================================================================

  /// Fetch all duties.
  Future<List<Duty>> getAllDuties() {
    return db.select(db.duties).get();
  }

  /// Fetch a single duty by its id.
  Future<Duty?> getDutyById(int id) {
    return (db.select(
      db.duties,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Fetch duties within a date range.
  Future<List<Duty>> getDutiesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return (db.select(db.duties)
          ..where((tbl) => tbl.date.isBetweenValues(startDate, endDate))
          ..orderBy([
            (tbl) =>
                OrderingTerm(expression: tbl.date, mode: OrderingMode.desc),
          ]))
        .get();
  }

  // ==========================================================================
  // UPDATE
  // ==========================================================================

  /// Update an existing duty.
  Future<bool> updateDuty(Duty duty) {
    return db.update(db.duties).replace(duty);
  }

  // ==========================================================================
  // DELETE
  // ==========================================================================

  /// Delete a single duty by id.
  Future<int> deleteDutyById(int id) {
    return (db.delete(db.duties)..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Delete multiple duties by ids.
  Future<int> deleteDutiesByIds(List<int> ids) {
    if (ids.isEmpty) return Future.value(0);

    return (db.delete(db.duties)..where((tbl) => tbl.id.isIn(ids))).go();
  }

  /// Delete all duties.
  Future<int> deleteAllDuties() {
    return db.delete(db.duties).go();
  }
}
