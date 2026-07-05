import 'package:flutter/material.dart';

import '../models/custom_expense.dart';
import 'app_number_field.dart';

class AddCustomExpenseDialog extends StatefulWidget {
  const AddCustomExpenseDialog({super.key});

  @override
  State<AddCustomExpenseDialog> createState() => _AddCustomExpenseDialogState();
}

class _AddCustomExpenseDialogState extends State<AddCustomExpenseDialog> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Custom Expense'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Expense Name',
              hintText: 'Example: Car Wash',
            ),
          ),
          const SizedBox(height: 12),
          AppNumberField(
            controller: amountController,
            label: 'Amount',
            icon: Icons.currency_rupee_rounded,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final name = nameController.text.trim();
            final amount = int.tryParse(amountController.text.trim()) ?? 0;

            if (name.isEmpty || amount <= 0) return;

            Navigator.pop(context, CustomExpense(name: name, amount: amount));
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
