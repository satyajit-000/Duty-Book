import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/services/duty_service.dart';
import 'repository_provider.dart';

final dutyServiceProvider = Provider<DutyService>((ref) {
  return DutyService(ref.read(dutyRepositoryProvider));
});
