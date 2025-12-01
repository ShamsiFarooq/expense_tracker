import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_motion.dart';
import 'package:foxus/app/theme/app_shadows.dart';
import 'package:foxus/app/theme/app_radius.dart';

/// Animated: Elevation + scale on press. Motion token: motion.fast.
/// Exports: AnimatedCard widget with press feedback using shadow tokens.
class AnimatedCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;

  const AnimatedCard({
    super.key,
    required this.child,
    this.onTap,
    this.margin,
    this.padding,
    this.color,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: AppMotion.fast, vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.curveEase));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
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
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: widget.onTap != null ? _handleTapDown : null,
      onTapUp: widget.onTap != null ? _handleTapUp : null,
      onTapCancel: widget.onTap != null ? _handleTapCancel : null,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              margin: widget.margin,
              padding: widget.padding,
              decoration: BoxDecoration(
                color: widget.color ?? theme.cardTheme.color,
                borderRadius: AppRadius.card,
                boxShadow:
                    _elevationAnimation.value > 0.5
                        ? AppShadows.level2
                        : AppShadows.level1,
              ),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
