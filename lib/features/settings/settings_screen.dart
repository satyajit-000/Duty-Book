import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/app_colors.dart';
import 'widgets/settings_card.dart';
import 'widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final mileageController = TextEditingController(text: '18');

  bool parking = true;
  bool toll = true;
  bool service = true;
  bool tyre = true;
  bool insurance = true;
  bool engineOil = true;

  bool isEditingMileage = false;
  int mileage = 18;
  final mileageFocusNode = FocusNode();

  @override
  void dispose() {
    mileageController.dispose();
    mileageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SettingsCard(
            title: 'Vehicle Information',
            child: isEditingMileage
                ? Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: mileageController,
                          focusNode: mileageFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Vehicle Mileage',
                            suffixText: 'KM/L',
                          ),
                        ),
                      ),
                      // const SizedBox(width: 10),
                      SizedBox(
                        height: 52,
                        child: IconButton(
                          onPressed: () {
                            final value = int.tryParse(
                              mileageController.text.trim(),
                            );

                            if (value == null || value <= 0) {
                              return;
                            }

                            setState(() {
                              mileage = value;
                              isEditingMileage = false;
                            });
                          },
                          icon: const Icon(
                            Icons.check_rounded,
                            fontWeight: FontWeight.bold,
                          ),
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vehicle Mileage',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '$mileage KM/L',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                mileageController.text = mileage.toString();
                                isEditingMileage = true;
                              });

                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                mileageFocusNode.requestFocus();

                                mileageController.selection =
                                    TextSelection.fromPosition(
                                      TextPosition(
                                        offset: mileageController.text.length,
                                      ),
                                    );
                              });
                            },
                            icon: const Icon(
                              Icons.edit_rounded,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),

          SettingsCard(
            title: 'Default Expenses',
            child: Column(
              children: [
                _ExpenseSwitch(
                  title: 'Parking',
                  value: parking,
                  onChanged: (v) => setState(() => parking = v),
                ),
                _ExpenseSwitch(
                  title: 'Toll',
                  value: toll,
                  onChanged: (v) => setState(() => toll = v),
                ),
                _ExpenseSwitch(
                  title: 'Service',
                  value: service,
                  onChanged: (v) => setState(() => service = v),
                ),
                _ExpenseSwitch(
                  title: 'Tyre',
                  value: tyre,
                  onChanged: (v) => setState(() => tyre = v),
                ),
                _ExpenseSwitch(
                  title: 'Insurance',
                  value: insurance,
                  onChanged: (v) => setState(() => insurance = v),
                ),
                _ExpenseSwitch(
                  title: 'Engine Oil',
                  value: engineOil,
                  onChanged: (v) => setState(() => engineOil = v),
                ),
              ],
            ),
          ),

          SettingsCard(
            title: 'Data',
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.backup_rounded,
                  title: 'Backup Data',
                  subtitle: 'Save app data locally',
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.restore_rounded,
                  title: 'Restore Data',
                  subtitle: 'Restore from backup file',
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.file_download_rounded,
                  title: 'Export CSV',
                  subtitle: 'Export records for Excel',
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SettingsCard(
            title: 'About',
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.directions_car_rounded,
                  title: 'Duty Book',
                  subtitle: 'Version 1.0.0',
                  trailing: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpenseSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ExpenseSwitch({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      value: value,
      activeThumbColor: AppColors.primary,
      onChanged: onChanged,
    );
  }
}
