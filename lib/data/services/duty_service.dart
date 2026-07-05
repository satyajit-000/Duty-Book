import 'package:drift/drift.dart';

import '../../core/enumerations/ac_type.dart';
import '../database/app_database.dart';
import '../repositories/custom_expense_repository.dart';
import '../repositories/duty_repository.dart';

class DutyService {
  final AppDatabase db;
  final DutyRepository dutyRepository;
  final CustomExpenseRepository customExpenseRepository;

  const DutyService(this.db, this.dutyRepository, this.customExpenseRepository);

  // ==========================================================================
  // CREATE
  // ==========================================================================

  Future<int> addDuty({
    required DutiesCompanion duty,
    List<CustomExpensesCompanion> customExpenses = const [],
  }) async {
    _validateDuty(duty);

    return db.transaction(() async {
      final dutyId = await dutyRepository.addDuty(duty);

      if (customExpenses.isNotEmpty) {
        final expenses = customExpenses
            .map((expense) => expense.copyWith(dutyId: Value(dutyId)))
            .toList();

        await customExpenseRepository.addCustomExpenses(expenses);
      }

      return dutyId;
    });
  }

  Future<void> addDuties(List<DutiesCompanion> duties) async {
    for (final duty in duties) {
      _validateDuty(duty);
    }

    await dutyRepository.addDuties(duties);
  }

  // ==========================================================================
  // READ
  // ==========================================================================

  Future<List<Duty>> getAllDuties() {
    return dutyRepository.getAllDuties();
  }

  Future<Duty?> getDutyById(int id) {
    return dutyRepository.getDutyById(id);
  }

  Future<List<Duty>> getDutiesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return dutyRepository.getDutiesByDateRange(
      startDate: startDate,
      endDate: endDate,
    );
  }

  // ==========================================================================
  // UPDATE
  // ==========================================================================

  Future<bool> updateDuty(Duty duty) {
    _validateExistingDuty(duty);
    return dutyRepository.updateDuty(duty);
  }

  // ==========================================================================
  // DELETE
  // ==========================================================================

  Future<int> deleteDuty(int id) {
    return dutyRepository.deleteDutyById(id);
  }

  Future<int> deleteDuties(List<int> ids) {
    return dutyRepository.deleteDutiesByIds(ids);
  }

  Future<int> deleteAllDuties() {
    return dutyRepository.deleteAllDuties();
  }

  // ==========================================================================
  // VALIDATIONS
  // ==========================================================================

  void _validateDuty(DutiesCompanion duty) {
    if (!duty.place.present || duty.place.value.trim().isEmpty) {
      throw Exception('Place is required');
    }

    if (!duty.totalKm.present || duty.totalKm.value <= 0) {
      throw Exception('Total KM should be greater than zero');
    }

    if (!duty.rent.present || duty.rent.value < 0) {
      throw Exception('Invalid rent');
    }
  }

  void _validateExistingDuty(Duty duty) {
    if (duty.place.trim().isEmpty) {
      throw Exception('Place is required');
    }

    if (duty.totalKm <= 0) {
      throw Exception('Invalid KM');
    }
  }

  // ==========================================================================
  // WATCH
  // ==========================================================================

  Stream<List<Duty>> watchAllDuties() {
    return dutyRepository.watchAllDuties();
  }

  Stream<Duty?> watchDutyById(int id) {
    return dutyRepository.watchDutyById(id);
  }

  Stream<List<Duty>> watchDutiesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return dutyRepository.watchDutiesByDateRange(
      startDate: startDate,
      endDate: endDate,
    );
  }

  // ==========================================================================
  // SEED
  // ==========================================================================

  Future<void> seedSampleDuties() async {
    final duties = [
      // Jul 06
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 6),
        place: 'Bhubaneswar',
        startKm: 50000,
        endKm: 50072,
        totalKm: 72,
        acType: AcType.half,
        rent: 1300,
        fuelCost: 550,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 6),
        place: 'Cuttack',
        startKm: 50072,
        endKm: 50190,
        totalKm: 118,
        acType: AcType.full,
        rent: 2800,
        fuelCost: 950,
      ),

      // Jul 05
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 5),
        place: 'Puri',
        startKm: 50190,
        endKm: 50360,
        totalKm: 170,
        acType: AcType.full,
        rent: 3500,
        fuelCost: 1450,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 5),
        place: 'Jagatsinghpur',
        startKm: 50360,
        endKm: 50425,
        totalKm: 65,
        acType: AcType.non,
        rent: 900,
        fuelCost: 350,
      ),

      // Jul 04
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 4),
        place: 'Paradeep',
        startKm: 50425,
        endKm: 50565,
        totalKm: 140,
        acType: AcType.full,
        rent: 3100,
        fuelCost: 1200,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 4),
        place: 'Bhubaneswar',
        startKm: 50565,
        endKm: 50625,
        totalKm: 60,
        acType: AcType.half,
        rent: 1200,
        fuelCost: 450,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 4),
        place: 'Kendrapara',
        startKm: 50625,
        endKm: 50735,
        totalKm: 110,
        acType: AcType.non,
        rent: 1600,
        fuelCost: 650,
      ),

      // Jul 03
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 3),
        place: 'Bhubaneswar',
        startKm: 50735,
        endKm: 50807,
        totalKm: 72,
        acType: AcType.half,
        rent: 1300,
        fuelCost: 600,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 3),
        place: 'Puri',
        startKm: 50807,
        endKm: 50987,
        totalKm: 180,
        acType: AcType.full,
        rent: 3200,
        fuelCost: 1400,
      ),

      // Jul 02
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 2),
        place: 'Cuttack',
        startKm: 50987,
        endKm: 51097,
        totalKm: 110,
        acType: AcType.non,
        rent: 1800,
        fuelCost: 700,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 2),
        place: 'Paradeep',
        startKm: 51097,
        endKm: 51257,
        totalKm: 160,
        acType: AcType.full,
        rent: 3400,
        fuelCost: 1350,
      ),

      // Jul 01
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 1),
        place: 'Jagatsinghpur',
        startKm: 51257,
        endKm: 51337,
        totalKm: 80,
        acType: AcType.half,
        rent: 1500,
        fuelCost: 550,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 7, 1),
        place: 'Bhubaneswar',
        startKm: 51337,
        endKm: 51487,
        totalKm: 150,
        acType: AcType.full,
        rent: 3300,
        fuelCost: 1250,
      ),

      // Jun 30
      DutiesCompanion.insert(
        date: DateTime(2026, 6, 30),
        place: 'Puri',
        startKm: 51487,
        endKm: 51677,
        totalKm: 190,
        acType: AcType.full,
        rent: 3800,
        fuelCost: 1550,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 6, 30),
        place: 'Kendrapara',
        startKm: 51677,
        endKm: 51747,
        totalKm: 70,
        acType: AcType.non,
        rent: 1000,
        fuelCost: 400,
      ),

      // Jun 29
      DutiesCompanion.insert(
        date: DateTime(2026, 6, 29),
        place: 'Cuttack',
        startKm: 51747,
        endKm: 51887,
        totalKm: 140,
        acType: AcType.half,
        rent: 2400,
        fuelCost: 850,
      ),
      DutiesCompanion.insert(
        date: DateTime(2026, 6, 29),
        place: 'Paradeep',
        startKm: 51887,
        endKm: 52067,
        totalKm: 180,
        acType: AcType.full,
        rent: 3600,
        fuelCost: 1450,
      ),
    ];

    await addDuties(duties);
  }
}
