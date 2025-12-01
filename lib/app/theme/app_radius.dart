import 'package:flutter/material.dart';

/// Border radius tokens: sm=8, md=12, lg=16, xl=24, pill=999.
/// Exports: Radius values and BorderRadius presets.
class AppRadius {
  // Raw Radius values (must match spec)
  static const Radius sm = Radius.circular(8);
  static const Radius md = Radius.circular(12);
  static const Radius lg = Radius.circular(16);
  static const Radius xl = Radius.circular(24);
  static const Radius pill = Radius.circular(999);

  // Predefined BorderRadius values
  static const BorderRadius smBorder = BorderRadius.all(sm);
  static const BorderRadius mdBorder = BorderRadius.all(md);
  static const BorderRadius lgBorder = BorderRadius.all(lg);
  static const BorderRadius xlBorder = BorderRadius.all(xl);
  static const BorderRadius pillBorder = BorderRadius.all(pill);

  // Specific use cases
  static const BorderRadius card = mdBorder;
  static const BorderRadius button = pillBorder;
  static const BorderRadius sheet = BorderRadius.only(
    topLeft: xl,
    topRight: xl,
  );
}
