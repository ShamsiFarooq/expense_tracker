import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_motion.dart';

/// Coordinated page transitions using motion tokens.
/// Exports: CustomPageTransitionsBuilder for AppShellTransition behavior.

/// Custom page transition builder that provides coordinated screen transitions.
/// Uses SharedAxisTransition-like behavior with motion tokens.
class AppShellPageTransitionsBuilder extends PageTransitionsBuilder {
  const AppShellPageTransitionsBuilder();

  @override
  Widget buildTransitions<T extends Object?>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Respect OS animation preference
    if (AppMotion.shouldAnimate(context)) {
      // Fade + slide transition using motion.base duration
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: AppMotion.curveEase),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: AppMotion.curveEase),
          ),
          child: child,
        ),
      );
    }
    return child;
  }
}
