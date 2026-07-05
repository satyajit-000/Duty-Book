import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/extensions/duty_list_extension.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/duties_provider.dart';
import '../../shared/widgets/records_filter_header.dart';
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
          const RecordsFilterHeader(),
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

                final groupedDuties = duties.groupByDate();

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
