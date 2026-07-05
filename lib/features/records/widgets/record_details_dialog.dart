import 'package:duty_book/core/enumerations/ac_type.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../duty/add_edit_duty_screen.dart';
import '../../duty/models/duty_form_model.dart';

class RecordDetailsDialog extends StatelessWidget {
  final String place;
  final int km;
  final int rent;
  final int fuel;
  final AcType acType;

  const RecordDetailsDialog({
    super.key,
    required this.place,
    required this.km,
    required this.rent,
    required this.fuel,
    required this.acType,
  });

  @override
  Widget build(BuildContext context) {
    final profit = rent - fuel;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        final shouldDelete = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Delete Duty'),
                            content: const Text(
                              'Are you sure you want to delete this duty?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );

                        if (shouldDelete == true) {
                          // repository.deleteDuty(id)
                        }
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddEditDutyScreen(
                              initialForm: DutyFormModel(
                                date: DateTime(2026, 7, 3),
                                place: place,
                                startKm: 39851,
                                endKm: 39923,
                                totalKm: km,
                                acType: acType,
                                rent: rent,
                                fuelCost: fuel,
                                parking: 0,
                                toll: 0,
                                service: 0,
                                tyre: 0,
                                insurance: 0,
                                engineOil: 0,
                                customExpenses: [],
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('DUTY', style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
                Text(
                  '₹$rent',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                _DetailRow(label: 'Place', value: place),
                _DetailRow(label: 'Total KM', value: '$km KM'),
                _DetailRow(label: 'AC Type', value: acType.displayName),
                _DetailRow(label: 'Fuel Cost', value: '₹$fuel'),
                _DetailRow(
                  label: 'Profit',
                  value: '₹$profit',
                  valueColor: profit >= 0
                      ? AppColors.success
                      : AppColors.expense,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? AppColors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
