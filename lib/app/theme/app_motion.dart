import 'package:flutter/material.dart';

/// Motion tokens for coordinated animations across the app.
/// Follows motion hierarchy: micro (fast), UI transitions (base), context changes (slow).
class AppMotion {
  // Durations (must match spec)
  static const Duration fast = Duration(
    milliseconds: 150,
  ); // Micro-interactions
  static const Duration base = Duration(milliseconds: 250); // UI transitions
  static const Duration slow = Duration(milliseconds: 350); // Context changes

  // Curves (must match spec)
  static const Curve curveEase = Curves.easeInOut; // Standard easing
  static const Curve curveDecel = Curves.decelerate; // Deceleration curve

  // Platform-specific curves
  static Curve curveIOS(BuildContext context) {
    // iOS: subtle springy feel for interactive components
    return Curves.easeOutBack;
  }

  // Respect OS animation preference
  static bool shouldAnimate(BuildContext context) {
    return !MediaQuery.of(context).disableAnimations;
  }
}
