// lib/utils/scroll_helper.dart
import 'package:flutter/material.dart';

class ScrollHelper {
  static void scrollToSection(GlobalKey key, BuildContext context) {
    final RenderObject? renderObject = key.currentContext?.findRenderObject();
    if (renderObject != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}