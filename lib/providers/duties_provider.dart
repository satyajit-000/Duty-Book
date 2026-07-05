import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/extensions/filter_state_extension.dart';
import '../data/database/app_database.dart';
import 'filter_provider.dart';
import 'service_provider.dart';

final dutiesProvider = StreamProvider.autoDispose<List<Duty>>((ref) {
  final filter = ref.watch(filterProvider);

  return ref
      .read(dutyServiceProvider)
      .watchDutiesByDateRange(
        startDate: filter.startDate,
        endDate: filter.endDate,
      );
});
