import 'package:flutter/material.dart';

import '../../../core/enumerations/ac_type.dart';

class AppDropdownField extends StatelessWidget {
  final AcType value;
  final ValueChanged<AcType> onChanged;

  const AppDropdownField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AcType>(
      value: value,
      items: AcType.values
          .map(
            (type) =>
                DropdownMenuItem(value: type, child: Text(type.displayName)),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
