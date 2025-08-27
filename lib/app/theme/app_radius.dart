import 'package:flutter/material.dart';

/// Consistent border radius scale
class AppRadius {
  // Just the raw Radius values
  static const Radius sm = Radius.circular(4);
  static const Radius md = Radius.circular(8);
  static const Radius lg = Radius.circular(16);

  // Predefined BorderRadius values (commonly used)
  static const BorderRadius smBorder = BorderRadius.all(sm);
  static const BorderRadius mdBorder = BorderRadius.all(md);
  static const BorderRadius lgBorder = BorderRadius.all(lg);

  // Specific use cases
  static const BorderRadius card = BorderRadius.all(md);
  static const BorderRadius button = BorderRadius.all(lg);
}
