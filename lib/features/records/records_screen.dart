import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_colors.dart';
import '../../providers/filter_provider.dart';
import '../../shared/widgets/display_options_dialog.dart';
import '../../shared/widgets/records_filter_header.dart';
import '../../shared/widgets/summary_item.dart';
import 'widgets/record_tile.dart';

class RecordsScreen extends ConsumerStatefulWidget {
  const RecordsScreen({super.key});

  @override
  ConsumerState<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends ConsumerState<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedFilter = ref.watch(filterProvider).type;
    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, fontWeight: FontWeight.bold),
      ),

      body: Column(
        children: [
          RecordsFilterHeader(
            selectedDate: DateTime(2026, 7),
            onPrevious: () {},
            onNext: () {},
            onFilterTap: () {
              showDialog(
                context: context,
                builder: (_) => DisplayOptionsDialog(
                  selectedFilter: selectedFilter,
                  onSelected: (filter) {
                    ref.read(filterProvider.notifier).updateFilter(filter);
                  },
                ),
              );
            },
            summaryItems: const [
              SummaryItem(
                title: 'REVENUE',
                value: '+₹26,000',
                color: AppColors.success,
              ),
              SummaryItem(
                title: 'FUEL',
                value: '-₹9,500',
                color: AppColors.expense,
              ),
              SummaryItem(
                title: 'PROFIT',
                value: '+₹16,500',
                color: Colors.white,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                _DateHeader(date: DateTime(2026, 7, 3)),

                const RecordTile(
                  place: 'Bhubaneswar',
                  km: 72,
                  rent: 1300,
                  fuel: 600,
                  acType: 'Half AC',
                ),

                const SizedBox(height: 24),

                _DateHeader(date: DateTime(2026, 7, 2)),

                const RecordTile(
                  place: 'Puri',
                  km: 180,
                  rent: 3200,
                  fuel: 1400,
                  acType: 'Full AC',
                ),

                const RecordTile(
                  place: 'Cuttack',
                  km: 110,
                  rent: 1800,
                  fuel: 700,
                  acType: 'Non AC',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  final DateTime date;

  const _DateHeader({required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('dd MMM, EEEE').format(date),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
      ],
    );
  }
}
