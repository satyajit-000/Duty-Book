import 'package:flutter/material.dart';

import '../../../shared/widgets/app_dialog.dart';

enum RecordFilterType {
  daily,
  weekly,
  monthly,
  threeMonths,
  sixMonths,
  yearly,
  custom,
}

class DisplayOptionsDialog extends StatelessWidget {
  final RecordFilterType selectedFilter;
  final ValueChanged<RecordFilterType> onSelected;

  const DisplayOptionsDialog({
    super.key,
    required this.selectedFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'Display Options',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _OptionTile(
            title: 'Daily',
            value: RecordFilterType.daily,
            selectedFilter: selectedFilter,
            onSelected: onSelected,
          ),
          _OptionTile(
            title: 'Weekly',
            value: RecordFilterType.weekly,
            selectedFilter: selectedFilter,
            onSelected: onSelected,
          ),
          _OptionTile(
            title: 'Monthly',
            value: RecordFilterType.monthly,
            selectedFilter: selectedFilter,
            onSelected: onSelected,
          ),
          _OptionTile(
            title: '3 Months',
            value: RecordFilterType.threeMonths,
            selectedFilter: selectedFilter,
            onSelected: onSelected,
          ),
          _OptionTile(
            title: '6 Months',
            value: RecordFilterType.sixMonths,
            selectedFilter: selectedFilter,
            onSelected: onSelected,
          ),
          _OptionTile(
            title: 'Yearly',
            value: RecordFilterType.yearly,
            selectedFilter: selectedFilter,
            onSelected: onSelected,
          ),
          _OptionTile(
            title: 'Custom',
            value: RecordFilterType.custom,
            selectedFilter: selectedFilter,
            onSelected: onSelected,
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String title;
  final RecordFilterType value;
  final RecordFilterType selectedFilter;
  final ValueChanged<RecordFilterType> onSelected;

  const _OptionTile({
    required this.title,
    required this.value,
    required this.selectedFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedFilter == value;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        onSelected(value);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            if (isSelected) const Icon(Icons.check_rounded, size: 22),
          ],
        ),
      ),
    );
  }
}
