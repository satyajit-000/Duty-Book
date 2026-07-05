import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/custom_expense_repository.dart';
import 'database_provider.dart';

final customExpenseRepositoryProvider = Provider<CustomExpenseRepository>((
  ref,
) {
  return CustomExpenseRepository(ref.read(databaseProvider));
});
