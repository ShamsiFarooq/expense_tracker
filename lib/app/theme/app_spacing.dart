import 'package:flutter/material.dart';

/// Spacing tokens following 4dp grid system.
/// Exports: xs=4, sm=8, md=12, lg=16, xl=24, xxl=32, screenPadding=20.
class AppSpacing {
  // Base scale (4dp grid)
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;

  // Screen-level padding
  static const double screenPadding = 20.0;

  // Quick helpers for EdgeInsets
  static const EdgeInsets page = EdgeInsets.all(screenPadding);
  static const EdgeInsets card = EdgeInsets.all(sm);
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
}
