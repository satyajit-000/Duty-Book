import 'package:flutter/material.dart';

class AppDateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const AppDateField({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: onTap,
        decoration: const InputDecoration(
          labelText: 'Date',
          prefixIcon: Icon(Icons.calendar_month_rounded),
        ),
      ),
    );
  }
}
