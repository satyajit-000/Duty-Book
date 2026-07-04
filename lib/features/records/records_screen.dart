import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_colors.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                _DateHeader(date: DateTime(2026, 7, 3)),

                const _RecordTile(
                  place: 'Bhubaneswar',
                  km: 72,
                  rent: 1300,
                  fuel: 600,
                  acType: 'Half AC',
                ),

                const SizedBox(height: 24),

                _DateHeader(date: DateTime(2026, 7, 2)),

                const _RecordTile(
                  place: 'Puri',
                  km: 180,
                  rent: 3200,
                  fuel: 1400,
                  acType: 'Full AC',
                ),

                const _RecordTile(
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

  Widget _buildHeader() {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),

              Expanded(
                child: Center(
                  child: Text(
                    DateFormat('MMMM yyyy').format(DateTime(2026, 7)),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right, color: Colors.white),
              ),

              const SizedBox(width: 20),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _SummaryItem(
                title: 'REVENUE',
                value: '+₹26,000',
                color: AppColors.success,
              ),
              _SummaryItem(
                title: 'FUEL',
                value: '-₹9,500',
                color: AppColors.expense,
              ),
              _SummaryItem(
                title: 'PROFIT',
                value: '+₹16,500',
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _SummaryItem({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

class _RecordTile extends StatelessWidget {
  final String place;
  final int km;
  final int rent;
  final int fuel;
  final String acType;

  const _RecordTile({
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

        leading: CircleAvatar(
          backgroundColor: AppColors.primaryLight,
          child: const Icon(Icons.directions_car),
        ),

        title: Text(place, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text('$km KM • $acType\nFuel ₹$fuel'),

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
