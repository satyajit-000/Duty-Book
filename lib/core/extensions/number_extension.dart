import 'package:intl/intl.dart';

extension IntExtension on int {
  String get inr {
    return NumberFormat('#,##,##0', 'en_IN').format(this);
  }
}

extension DoubleExtension on double {
  String get inr {
    return NumberFormat('#,##,##0.##', 'en_IN').format(this);
  }

  String get percent {
    return '${(this * 100).toStringAsFixed(0)}%';
  }

  String percentWith(int decimalPlaces) {
    return '${(this * 100).toStringAsFixed(decimalPlaces)}%';
  }
}
