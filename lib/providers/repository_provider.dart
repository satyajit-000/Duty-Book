import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/custom_expense_repository.dart';
import '../data/repositories/duty_repository.dart';
import 'database_provider.dart';

final dutyRepositoryProvider = Provider<DutyRepository>((ref) {
  return DutyRepository(ref.read(databaseProvider));
});

final customExpenseRepositoryProvider = Provider<CustomExpenseRepository>((
  ref,
) {
  return CustomExpenseRepository(ref.read(databaseProvider));
});
