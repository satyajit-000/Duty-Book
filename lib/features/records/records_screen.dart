import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../providers/duty_provider.dart';
import '../../providers/filter_provider.dart';
import '../../shared/widgets/display_options_dialog.dart';
import '../../shared/widgets/records_filter_header.dart';
import '../../shared/widgets/summary_item.dart';
import '../duty/add_edit_duty_screen.dart';
import 'widgets/date_header.dart';
import 'widgets/record_tile.dart';

class RecordsScreen extends ConsumerStatefulWidget {
  const RecordsScreen({super.key});

  @override
  ConsumerState<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends ConsumerState<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    final dutiesAsync = ref.watch(dutiesProvider);

    final selectedFilter = ref.watch(filterProvider).type;

    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditDutyScreen()),
          );
        },
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
            child: dutiesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),

              data: (duties) {
                if (duties.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'No duties found.\nTap + to add your first duty.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                }

                final groupedDuties = <DateTime, List<Duty>>{};

                for (final duty in duties) {
                  final dateKey = DateTime(
                    duty.date.year,
                    duty.date.month,
                    duty.date.day,
                  );

                  groupedDuties.putIfAbsent(dateKey, () => []);
                  groupedDuties[dateKey]!.add(duty);
                }

                final widgets = <Widget>[];

                groupedDuties.forEach((date, dutiesForDate) {
                  widgets.add(DateHeader(date: date));

                  for (final duty in dutiesForDate) {
                    widgets.add(
                      RecordTile(
                        place: duty.place,
                        km: duty.totalKm,
                        rent: duty.rent,
                        fuel: duty.fuelCost,
                        acType: duty.acType,
                      ),
                    );
                  }

                  widgets.add(const SizedBox(height: 24));
                });

                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  children: widgets,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
