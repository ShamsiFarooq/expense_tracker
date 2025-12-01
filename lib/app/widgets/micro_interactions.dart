import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_motion.dart';
import 'package:foxus/app/theme/app_shadows.dart';

/// Micro-interaction utilities: pressScale, ripple, focusGlow.
/// Motion token: motion.fast for micro-interactions.
/// Exports: Helper widgets and functions for micro-animations.

/// Wraps a widget with press scale animation.
/// Usage: PressScale(child: YourWidget(), onTap: () {})
class PressScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale;

  const PressScale({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 0.95,
  });

  @override
  State<PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<PressScale>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: AppMotion.fast, vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scale,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.curveEase));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (AppMotion.shouldAnimate(context)) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (AppMotion.shouldAnimate(context)) {
      _controller.reverse();
    }
    widget.onTap?.call();
  }

  void _handleTapCancel() {
    if (AppMotion.shouldAnimate(context)) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null ? _handleTapDown : null,
      onTapUp: widget.onTap != null ? _handleTapUp : null,
      onTapCancel: widget.onTap != null ? _handleTapCancel : null,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: widget.child,
      ),
    );
  }
}

/// Wraps a widget with Material ripple effect.
/// Usage: Ripple(child: YourWidget(), onTap: () {})
class Ripple extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const Ripple({super.key, required this.child, this.onTap, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: onTap, borderRadius: borderRadius, child: child),
    );
  }
}

/// Wraps a widget with focus glow effect for accessibility.
/// Usage: FocusGlow(child: YourWidget())
class FocusGlow extends StatelessWidget {
  final Widget child;
  final bool showFocus;

  const FocusGlow({super.key, required this.child, this.showFocus = false});

  @override
  Widget build(BuildContext context) {
    if (!showFocus) return child;

    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.focusRing(context),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
