import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../repositories/custom_expense_repository.dart';
import '../repositories/duty_repository.dart';

class DutyService {
  final AppDatabase db;
  final DutyRepository dutyRepository;
  final CustomExpenseRepository customExpenseRepository;

  const DutyService(this.db, this.dutyRepository, this.customExpenseRepository);

  // CREATE

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

  // READ

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

  // UPDATE

  Future<bool> updateDuty(Duty duty) {
    _validateExistingDuty(duty);
    return dutyRepository.updateDuty(duty);
  }

  // DELETE

  Future<int> deleteDuty(int id) {
    return dutyRepository.deleteDutyById(id);
  }

  Future<int> deleteDuties(List<int> ids) {
    return dutyRepository.deleteDutiesByIds(ids);
  }

  Future<int> deleteAllDuties() {
    return dutyRepository.deleteAllDuties();
  }

  // VALIDATIONS

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
}
