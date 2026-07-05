import '../database/app_database.dart';
import '../repositories/duty_repository.dart';

class DutyService {
  final DutyRepository repository;

  const DutyService(this.repository);

  // ==========================================================================
  // CREATE
  // ==========================================================================

  Future<int> addDuty(DutiesCompanion duty) {
    _validateDuty(duty);

    return repository.addDuty(duty);
  }

  Future<void> addDuties(List<DutiesCompanion> duties) async {
    for (final duty in duties) {
      _validateDuty(duty);
    }

    await repository.addDuties(duties);
  }

  // ==========================================================================
  // READ
  // ==========================================================================

  Future<List<Duty>> getAllDuties() {
    return repository.getAllDuties();
  }

  Future<Duty?> getDutyById(int id) {
    return repository.getDutyById(id);
  }

  Future<List<Duty>> getDutiesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return repository.getDutiesByDateRange(
      startDate: startDate,
      endDate: endDate,
    );
  }

  // ==========================================================================
  // UPDATE
  // ==========================================================================

  Future<bool> updateDuty(Duty duty) {
    _validateExistingDuty(duty);

    return repository.updateDuty(duty);
  }

  // ==========================================================================
  // DELETE
  // ==========================================================================

  Future<int> deleteDuty(int id) {
    return repository.deleteDutyById(id);
  }

  Future<int> deleteDuties(List<int> ids) {
    return repository.deleteDutiesByIds(ids);
  }

  Future<int> deleteAllDuties() {
    return repository.deleteAllDuties();
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
}
