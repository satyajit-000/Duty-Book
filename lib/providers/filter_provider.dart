import 'package:flutter_riverpod/legacy.dart';

import '../core/enumerations/record_filter_type.dart';

class FilterState {
  final RecordFilterType type;

  const FilterState({required this.type});

  FilterState copyWith({RecordFilterType? type}) {
    return FilterState(type: type ?? this.type);
  }
}

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(const FilterState(type: RecordFilterType.monthly));

  void updateFilter(RecordFilterType type) {
    state = state.copyWith(type: type);
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>(
  (ref) => FilterNotifier(),
);
