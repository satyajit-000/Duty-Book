import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'layout/main_layout.dart';

void main() {
  runApp(const ProviderScope(child: DutyBookApp()));
}

class DutyBookApp extends StatelessWidget {
  const DutyBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duty Book',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainLayout(),
    );
  }
}
