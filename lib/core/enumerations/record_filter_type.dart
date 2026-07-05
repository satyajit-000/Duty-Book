enum RecordFilterType {
  daily,
  weekly,
  monthly,
  threeMonths,
  sixMonths,
  yearly,
  custom;

  String get displayName {
    switch (this) {
      case RecordFilterType.daily:
        return 'Daily';

      case RecordFilterType.weekly:
        return 'Weekly';

      case RecordFilterType.monthly:
        return 'Monthly';

      case RecordFilterType.threeMonths:
        return '3 Months';

      case RecordFilterType.sixMonths:
        return '6 Months';

      case RecordFilterType.yearly:
        return 'Yearly';

      case RecordFilterType.custom:
        return 'Custom';
    }
  }

  String get shortName {
    switch (this) {
      case RecordFilterType.daily:
        return 'D';

      case RecordFilterType.weekly:
        return 'W';

      case RecordFilterType.monthly:
        return 'M';

      case RecordFilterType.threeMonths:
        return '3M';

      case RecordFilterType.sixMonths:
        return '6M';

      case RecordFilterType.yearly:
        return 'Y';

      case RecordFilterType.custom:
        return 'C';
    }
  }

  bool get isCustom => this == RecordFilterType.custom;

  bool get hasNavigation => this != RecordFilterType.custom;
}
