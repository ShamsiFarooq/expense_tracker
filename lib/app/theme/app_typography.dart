import 'package:flutter/material.dart';

/// Typography scale: displayLg 32, displayMd 28, headline 24, title20, subtitle16, body14, bodySm12.
/// Exports: TextStyle presets for consistent text hierarchy.
/// All styles support text scaling up to 1.3x without overflow.
class AppTypography {
  // Display styles (hero text)
  static const TextStyle displayLg = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle displayMd = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.2,
  );

  // Headline (section headers)
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    height: 1.3,
  );

  // Title (card headers, list item titles)
  static const TextStyle title20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.4,
  );

  // Subtitle (secondary text in cards)
  static const TextStyle subtitle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.5,
  );

  // Body (primary content)
  static const TextStyle body14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.5,
  );

  // Body small (captions, metadata)
  static const TextStyle bodySm12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  // Legacy aliases (for backward compatibility)
  static const TextStyle displayLarge = displayLg;
  static const TextStyle headlineMedium = title20;
  static const TextStyle bodyLarge = subtitle16;
  static const TextStyle bodyMedium = body14;
  static const TextStyle labelSmall = bodySm12;
}
