import 'package:intl/intl.dart';

import '../../providers/filter_provider.dart';
import '../enumerations/record_filter_type.dart';

extension FilterStateExtension on FilterState {
  DateTime get startDate {
    final date = DateTime(anchorDate.year, anchorDate.month, anchorDate.day);

    switch (type) {
      case RecordFilterType.daily:
        return date;

      case RecordFilterType.weekly:
        return date.subtract(Duration(days: date.weekday - 1));

      case RecordFilterType.monthly:
        return DateTime(anchorDate.year, anchorDate.month, 1);

      case RecordFilterType.threeMonths:
        return DateTime(anchorDate.year, anchorDate.month - 2, 1);

      case RecordFilterType.sixMonths:
        return DateTime(anchorDate.year, anchorDate.month - 5, 1);

      case RecordFilterType.yearly:
        return DateTime(anchorDate.year, 1, 1);

      case RecordFilterType.custom:
        return customStart ?? date;
    }
  }

  DateTime get endDate {
    switch (type) {
      case RecordFilterType.daily:
        return startDate.add(const Duration(days: 1));

      case RecordFilterType.weekly:
        return startDate.add(const Duration(days: 7));

      case RecordFilterType.monthly:
        return DateTime(anchorDate.year, anchorDate.month + 1, 1);

      case RecordFilterType.threeMonths:
        return DateTime(anchorDate.year, anchorDate.month + 1, 1);

      case RecordFilterType.sixMonths:
        return DateTime(anchorDate.year, anchorDate.month + 1, 1);

      case RecordFilterType.yearly:
        return DateTime(anchorDate.year + 1, 1, 1);

      case RecordFilterType.custom:
        final end = customEnd ?? startDate;
        return DateTime(
          end.year,
          end.month,
          end.day,
        ).add(const Duration(days: 1));
    }
  }

  String get periodTitle {
    switch (type) {
      case RecordFilterType.daily:
        return '${anchorDate.day.toString().padLeft(2, '0')}/${anchorDate.month.toString().padLeft(2, '0')}/${anchorDate.year}';

      case RecordFilterType.weekly:
        return '${startDate.day.toString().padLeft(2, '0')}/${startDate.month.toString().padLeft(2, '0')} - ${endDate.subtract(const Duration(days: 1)).day.toString().padLeft(2, '0')}/${endDate.subtract(const Duration(days: 1)).month.toString().padLeft(2, '0')}';

      case RecordFilterType.monthly:
        return '${anchorDate.month.toString().padLeft(2, '0')}/${anchorDate.year}';

      case RecordFilterType.threeMonths:
        return 'Last 3 Months';

      case RecordFilterType.sixMonths:
        return 'Last 6 Months';

      case RecordFilterType.yearly:
        return '${anchorDate.year}';

      case RecordFilterType.custom:
        return 'Custom Range';
    }
  }

  String get title {
    switch (type) {
      case RecordFilterType.daily:
        return DateFormat('dd MMM yyyy').format(anchorDate);

      case RecordFilterType.weekly:
        final end = endDate.subtract(const Duration(days: 1));

        return '${DateFormat('dd MMM').format(startDate)} - '
            '${DateFormat('dd MMM yyyy').format(end)}';

      case RecordFilterType.monthly:
        return DateFormat('MMMM yyyy').format(anchorDate);

      case RecordFilterType.threeMonths:
        return '${DateFormat('MMM yyyy').format(startDate)} - '
            '${DateFormat('MMM yyyy').format(anchorDate)}';

      case RecordFilterType.sixMonths:
        return '${DateFormat('MMM yyyy').format(startDate)} - '
            '${DateFormat('MMM yyyy').format(anchorDate)}';

      case RecordFilterType.yearly:
        return anchorDate.year.toString();

      case RecordFilterType.custom:
        return '${DateFormat('dd MMM').format(customStart!)} - '
            '${DateFormat('dd MMM yyyy').format(customEnd!)}';
    }
  }

  bool get canGoNext {
    return endDate.isBefore(DateTime.now());
  }
}
