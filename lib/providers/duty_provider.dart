import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database/app_database.dart';
import 'service_provider.dart';

final dutiesProvider = StreamProvider.autoDispose<List<Duty>>((ref) {
  return ref.read(dutyServiceProvider).watchAllDuties();
});
