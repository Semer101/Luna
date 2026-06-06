import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF5B5FEF);
  static const secondary = Color(0xFFB8A8FF);
  static const accent = Color(0xFFFF8C8C);
  static const background = Color(0xFFF8F7FF);
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF1A1A2E);
  static const textSecondary = Color(0xFF6B6B8A);
  static const success = Color(0xFF4ECDC4);
  static const warning = Color(0xFFFFB347);

  static const gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  static const gradientAccent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, Color(0xFFFFB4B4)],
  );

  static const glassWhite = Color(0xCCFFFFFF);
}
