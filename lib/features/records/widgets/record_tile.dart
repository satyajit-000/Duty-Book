import 'package:duty_book/core/enumerations/ac_type.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import 'record_details_dialog.dart';

class RecordTile extends StatelessWidget {
  final String place;
  final int km;
  final int rent;
  final int fuel;
  final AcType acType;

  const RecordTile({
    super.key,
    required this.place,
    required this.km,
    required this.rent,
    required this.fuel,
    required this.acType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => RecordDetailsDialog(
              place: place,
              km: km,
              rent: rent,
              fuel: fuel,
              acType: acType,
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryLight,
          child: const Icon(Icons.directions_car),
        ),

        title: Text(place, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text('$km KM • ${acType.displayName}\nFuel ₹$fuel'),

        trailing: Text(
          '+₹$rent',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.success,
          ),
        ),
      ),
    );
  }
}
