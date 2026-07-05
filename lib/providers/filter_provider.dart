import 'package:flutter_riverpod/legacy.dart';

import '../core/enumerations/record_filter_type.dart';

class FilterState {
  final RecordFilterType type;

  /// Current point in time that the filter is viewing.
  final DateTime anchorDate;

  /// For custom range only.
  final DateTime? customStart;
  final DateTime? customEnd;

  const FilterState({
    required this.type,
    required this.anchorDate,
    this.customStart,
    this.customEnd,
  });

  FilterState copyWith({
    RecordFilterType? type,
    DateTime? anchorDate,
    DateTime? customStart,
    DateTime? customEnd,
  }) {
    return FilterState(
      type: type ?? this.type,
      anchorDate: anchorDate ?? this.anchorDate,
      customStart: customStart ?? this.customStart,
      customEnd: customEnd ?? this.customEnd,
    );
  }
}

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier()
    : super(
        FilterState(type: RecordFilterType.monthly, anchorDate: DateTime.now()),
      );

  void updateFilter(RecordFilterType type) {
    state = state.copyWith(type: type, anchorDate: DateTime.now());
  }

  void previousPeriod() {
    final current = state.anchorDate;

    switch (state.type) {
      case RecordFilterType.daily:
        state = state.copyWith(
          anchorDate: current.subtract(const Duration(days: 1)),
        );
        break;
      case RecordFilterType.weekly:
        state = state.copyWith(
          anchorDate: current.subtract(const Duration(days: 7)),
        );
        break;
      case RecordFilterType.monthly:
        state = state.copyWith(
          anchorDate: DateTime(current.year, current.month - 1, current.day),
        );
        break;
      case RecordFilterType.threeMonths:
        state = state.copyWith(
          anchorDate: DateTime(current.year, current.month - 3, current.day),
        );
        break;
      case RecordFilterType.sixMonths:
        state = state.copyWith(
          anchorDate: DateTime(current.year, current.month - 6, current.day),
        );
        break;
      case RecordFilterType.yearly:
        state = state.copyWith(
          anchorDate: DateTime(current.year - 1, current.month, current.day),
        );
        break;
      case RecordFilterType.custom:
        break;
    }
  }

  void nextPeriod() {
    final current = state.anchorDate;

    switch (state.type) {
      case RecordFilterType.daily:
        state = state.copyWith(
          anchorDate: current.add(const Duration(days: 1)),
        );
        break;
      case RecordFilterType.weekly:
        state = state.copyWith(
          anchorDate: current.add(const Duration(days: 7)),
        );
        break;
      case RecordFilterType.monthly:
        state = state.copyWith(
          anchorDate: DateTime(current.year, current.month + 1, current.day),
        );
        break;
      case RecordFilterType.threeMonths:
        state = state.copyWith(
          anchorDate: DateTime(current.year, current.month + 3, current.day),
        );
        break;
      case RecordFilterType.sixMonths:
        state = state.copyWith(
          anchorDate: DateTime(current.year, current.month + 6, current.day),
        );
        break;
      case RecordFilterType.yearly:
        state = state.copyWith(
          anchorDate: DateTime(current.year + 1, current.month, current.day),
        );
        break;
      case RecordFilterType.custom:
        break;
    }
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>(
  (ref) => FilterNotifier(),
);
