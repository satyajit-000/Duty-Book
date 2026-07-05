import 'package:duty_book/core/enumerations/ac_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_colors.dart';
import 'models/custom_expense.dart';
import 'widgets/add_custom_expense_dialog.dart';
import 'widgets/app_date_field.dart';
import 'widgets/app_dropdown_field.dart';
import 'widgets/app_number_field.dart';
import 'widgets/expense_card.dart';
import 'widgets/expense_chip.dart';
import 'widgets/summary_row.dart';

class AddEditDutyScreen extends StatefulWidget {
  const AddEditDutyScreen({super.key});

  @override
  State<AddEditDutyScreen> createState() => _AddEditDutyScreenState();
}

class _AddEditDutyScreenState extends State<AddEditDutyScreen> {
  final dateController = TextEditingController(
    text: DateFormat('dd MMM yyyy').format(DateTime.now()),
  );

  final placeController = TextEditingController();

  final startKmController = TextEditingController();
  final endKmController = TextEditingController();
  final totalKmController = TextEditingController();

  final rentController = TextEditingController();
  final fuelController = TextEditingController();

  final parkingController = TextEditingController();
  final tollController = TextEditingController();
  final serviceController = TextEditingController();
  final tyreController = TextEditingController();
  final insuranceController = TextEditingController();
  final engineOilController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  AcType acType = AcType.full;

  bool _updatingKm = false;

  final List<CustomExpense> customExpenses = [];

  @override
  void dispose() {
    dateController.dispose();
    placeController.dispose();

    startKmController.dispose();
    endKmController.dispose();
    totalKmController.dispose();

    rentController.dispose();
    fuelController.dispose();

    parkingController.dispose();
    tollController.dispose();
    serviceController.dispose();
    tyreController.dispose();
    insuranceController.dispose();
    engineOilController.dispose();

    super.dispose();
  }

  int _number(TextEditingController controller) {
    return int.tryParse(controller.text.trim()) ?? 0;
  }

  void _calculateTotalKm() {
    if (_updatingKm) return;

    final start = _number(startKmController);
    final end = _number(endKmController);

    if (start > 0 && end > start) {
      _updatingKm = true;
      totalKmController.text = (end - start).toString();
      _updatingKm = false;
    }

    setState(() {});
  }

  void _calculateEndKm() {
    if (_updatingKm) return;

    final start = _number(startKmController);
    final total = _number(totalKmController);

    if (start > 0 && total > 0) {
      _updatingKm = true;
      endKmController.text = (start + total).toString();
      _updatingKm = false;
    }

    setState(() {});
  }

  int get customExpenseTotal {
    return customExpenses.fold(0, (sum, item) => sum + item.amount);
  }

  int get totalOtherExpense {
    return _number(parkingController) +
        _number(tollController) +
        _number(serviceController) +
        _number(tyreController) +
        _number(insuranceController) +
        _number(engineOilController) +
        customExpenseTotal;
  }

  int get totalExpense {
    return _number(fuelController) + totalOtherExpense;
  }

  int get profit {
    return _number(rentController) - totalExpense;
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    setState(() {
      selectedDate = pickedDate;
      dateController.text = DateFormat('dd MMM yyyy').format(pickedDate);
    });
  }

  Future<void> _addCustomExpense() async {
    final result = await showDialog<CustomExpense>(
      context: context,
      builder: (_) => const AddCustomExpenseDialog(),
    );

    if (!mounted || result == null) return;

    setState(() {
      customExpenses.add(result);
    });
  }

  void _saveDuty() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Duty saved in memory later')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Add Duty')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ExpenseCard(
            title: 'Duty Details',
            child: Column(
              children: [
                AppDateField(controller: dateController, onTap: _pickDate),
                _PlaceField(controller: placeController),
                AppNumberField(
                  controller: startKmController,
                  label: 'Starting KM',
                  icon: Icons.flag_rounded,
                  onChanged: (_) {
                    _calculateTotalKm();
                    _calculateEndKm();
                  },
                ),
                AppNumberField(
                  controller: endKmController,
                  label: 'Ending KM',
                  icon: Icons.assistant_photo_rounded,
                  onChanged: (_) => _calculateTotalKm(),
                ),
                AppNumberField(
                  controller: totalKmController,
                  label: 'Total KM',
                  icon: Icons.straighten_rounded,
                  onChanged: (_) => _calculateEndKm(),
                ),
                AppDropdownField(
                  value: acType,
                  onChanged: (value) {
                    setState(() {
                      acType = value;
                    });
                  },
                ),
              ],
            ),
          ),

          ExpenseCard(
            title: 'Money',
            child: Column(
              children: [
                AppNumberField(
                  controller: rentController,
                  label: 'Rent',
                  icon: Icons.currency_rupee_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                AppNumberField(
                  controller: fuelController,
                  label: 'Fuel Cost',
                  icon: Icons.local_gas_station_rounded,
                  onChanged: (_) => setState(() {}),
                ),
              ],
            ),
          ),

          ExpenseCard(
            title: 'Other Expenses',
            child: Column(
              children: [
                AppNumberField(
                  controller: parkingController,
                  label: 'Parking',
                  icon: Icons.local_parking_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                AppNumberField(
                  controller: tollController,
                  label: 'Toll',
                  icon: Icons.toll_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                AppNumberField(
                  controller: serviceController,
                  label: 'Service',
                  icon: Icons.build_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                AppNumberField(
                  controller: tyreController,
                  label: 'Tyre',
                  icon: Icons.tire_repair_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                AppNumberField(
                  controller: insuranceController,
                  label: 'Insurance',
                  icon: Icons.verified_user_rounded,
                  onChanged: (_) => setState(() {}),
                ),
                AppNumberField(
                  controller: engineOilController,
                  label: 'Engine Oil',
                  icon: Icons.oil_barrel_rounded,
                  onChanged: (_) => setState(() {}),
                ),

                if (customExpenses.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  ...customExpenses.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    return ExpenseChip(
                      label: item.name,
                      amount: item.amount,
                      onDelete: () {
                        setState(() {
                          customExpenses.removeAt(index);
                        });
                      },
                    );
                  }),
                ],

                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _addCustomExpense,
                    icon: const Icon(Icons.add_rounded),
                    label: const Text('Add Custom Expense'),
                  ),
                ),
              ],
            ),
          ),

          ExpenseCard(
            title: 'Live Summary',
            child: Column(
              children: [
                SummaryRow(
                  label: 'Revenue',
                  value: '₹${_number(rentController)}',
                ),
                SummaryRow(label: 'Fuel', value: '₹${_number(fuelController)}'),
                SummaryRow(
                  label: 'Other Expenses',
                  value: '₹$totalOtherExpense',
                ),
                const Divider(),
                SummaryRow(
                  label: 'Profit',
                  value: '₹$profit',
                  valueColor: profit >= 0
                      ? AppColors.success
                      : AppColors.expense,
                  isBold: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _saveDuty,
              icon: const Icon(Icons.save_rounded),
              label: const Text('Save Duty'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaceField extends StatelessWidget {
  final TextEditingController controller;

  const _PlaceField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Place',
          prefixIcon: Icon(Icons.location_on_rounded),
        ),
      ),
    );
  }
}
