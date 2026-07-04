import 'package:flutter/material.dart';

import '../features/analysis/analysis_screen.dart';
import '../features/records/records_screen.dart';
import '../features/reports/reports_screen.dart';
import '../features/settings/settings_screen.dart';
import 'app_bottom_navigation_bar.dart';
import 'app_drawer.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final titles = const [
    'Records',
    'Analysis',
    'Reports',
    'Settings',
  ];

  final pages = const [
    RecordsScreen(),
    AnalysisScreen(),
    ReportsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),

      body: pages[currentIndex],

      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}