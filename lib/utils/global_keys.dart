import 'package:flutter/material.dart';

class AppKeys {
  // Static keys untuk memudahkan akses dari mana saja
  static final Map<String, GlobalKey> keys = {
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'certificates': GlobalKey(),
    'leadership': GlobalKey(),
  };

  // Helper methods untuk akses yang lebih mudah
  static GlobalKey get experienceKey => keys['experience']!;
  static GlobalKey get projectsKey => keys['projects']!;
  static GlobalKey get certificatesKey => keys['certificates']!;
  static GlobalKey get leadershipKey => keys['leadership']!;

  // Method untuk scroll ke section
  static void scrollToSection(String section, BuildContext context) {
    final key = keys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}