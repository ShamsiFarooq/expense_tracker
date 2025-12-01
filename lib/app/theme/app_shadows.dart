import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_colors.dart';

/// Shadow tokens: level1 (subtle), level2 (elevated), focusRing (accessibility).
/// Exports: BoxShadow lists for consistent elevation hierarchy.
class AppShadows {
  // Level 1: Subtle elevation (cards at rest)
  static List<BoxShadow> level1 = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 8,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  // Level 2: Elevated (cards on press, modals)
  static List<BoxShadow> level2 = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  // Focus ring: Accessibility indicator (>= 4.5:1 contrast)
  // Using primary color with opacity for visible focus states
  static List<BoxShadow> focusRing(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? AppColors.secondaryDark : AppColors.primaryLight;
    return [
      BoxShadow(
        color: color.withValues(alpha: 0.4),
        blurRadius: 4,
        offset: const Offset(0, 0),
        spreadRadius: 2,
      ),
    ];
  }

  // Legacy aliases (for backward compatibility)
  static List<BoxShadow> get soft => level1;
  static List<BoxShadow> get medium => level2;
}
