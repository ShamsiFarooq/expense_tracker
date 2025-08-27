import 'package:flutter/material.dart';

/// Foxus Brand Tokens (Light + Dark)
class AppColors {
  // -------- LIGHT THEME --------
  static const Color primaryLight = Color(0xFF1E3457); // Navy
  static const Color onPrimaryLight = Color(0xFFFFFFFF);

  static const Color secondaryLight = Color(0xFF06B6D4); // Cyan
  static const Color secondaryVariantLight = Color(0xFF22C55E); // Mint

  static const Color backgroundLight = Color(0xFFF9FAFB); // Gray 50
  static const Color onBackgroundLight = Color(0xFF111827); // Gray 900

  static const Color surfaceLight = Color(0xFFFFFFFF); // Cards/Sheets
  static const Color onSurfaceLight = Color(0xFF111827); // Text on cards

  static const Color errorLight = Color(0xFFDC2626); // Red 600
  static const Color successLight = Color(0xFF16A34A); // Green 600
  static const Color warningLight = Color(0xFFF59E0B); // Amber 500

  static const Color borderLight = Color(0xFFE5E7EB); // Gray 200
  static const Color mutedLight = Color(0xFF6B7280);   // Gray 500

  // -------- DARK THEME --------
  static const Color primaryDark = Color(0xFF06B6D4); // Cyan becomes primary
  static const Color onPrimaryDark = Color(0xFF1E3457); // Navy on cyan

  static const Color secondaryDark = Color(0xFF22C55E); // Mint
  static const Color secondaryVariantDark = Color(0xFF818CF8); // Indigo 400 (optional)

  static const Color backgroundDark = Color(0xFF111827); // Gray 900
  static const Color onBackgroundDark = Color(0xFFF9FAFB); // Gray 50

  static const Color surfaceDark = Color(0xFF1F2937); // Gray 800
  static const Color onSurfaceDark = Color(0xFFF9FAFB);

  static const Color errorDark = Color(0xFFF87171);   // Red 400
  static const Color successDark = Color(0xFF4ADE80); // Green 400
  static const Color warningDark = Color(0xFFFBBF24); // Amber 400

  static const Color borderDark = Color(0xFF374151); // Gray 700
  static const Color mutedDark = Color(0xFF9CA3AF);  // Gray 400

  // -------- BRAND GRADIENT (Cyan → Mint) --------
  static const Gradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF06B6D4), Color(0xFF22C55E)],
  );
}
