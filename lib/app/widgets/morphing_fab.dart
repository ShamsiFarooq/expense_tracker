import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_motion.dart';
import 'package:foxus/app/theme/app_colors.dart';
import 'package:foxus/app/theme/app_radius.dart';
import 'package:foxus/app/theme/app_spacing.dart';

/// Animated: Transform from circular FAB to bottom sheet form with smooth size/shape animation.
/// Motion token: motion.base for morphing transition.
/// Exports: MorphingFAB widget for FAB-to-form transitions.
class MorphingFAB extends StatefulWidget {
  final Widget fabChild;
  final Widget expandedChild;
  final VoidCallback? onClose;
  final bool isExpanded;

  const MorphingFAB({
    super.key,
    required this.fabChild,
    required this.expandedChild,
    this.onClose,
    this.isExpanded = false,
  });

  @override
  State<MorphingFAB> createState() => _MorphingFABState();
}

class _MorphingFABState extends State<MorphingFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: AppMotion.base, vsync: this);

    _radiusAnimation = Tween<double>(
      begin: 28.0, // FAB radius
      end: 24.0, // Sheet radius
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.curveEase));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.curveEase));

    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(MorphingFAB oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxHeight = screenSize.height * 0.7;

    if (!AppMotion.shouldAnimate(context)) {
      if (widget.isExpanded) {
        return _buildExpandedSheet(context, maxHeight);
      }
      return _buildFAB(context);
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        if (_controller.value < 0.5) {
          // Show FAB
          final scale = 1.0 - (_controller.value * 2);
          return Transform.scale(
            scale: scale,
            child: Opacity(
              opacity: 1.0 - _controller.value,
              child: _buildFAB(context),
            ),
          );
        } else {
          // Show expanded sheet
          final progress = (_controller.value - 0.5) * 2;
          return _buildExpandedSheet(context, maxHeight, progress: progress);
        }
      },
    );
  }

  Widget _buildFAB(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: AppColors.brandGradient,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryLight.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _controller.forward();
            });
          },
          borderRadius: BorderRadius.circular(28),
          child: Center(child: widget.fabChild),
        ),
      ),
    );
  }

  Widget _buildExpandedSheet(
    BuildContext context,
    double maxHeight, {
    double progress = 1.0,
  }) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: widget.onClose,
        child: Container(
          height: maxHeight * progress,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_radiusAnimation.value),
              topRight: Radius.circular(_radiusAnimation.value),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Padding(
              padding: AppSpacing.page,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag handle
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius: AppRadius.pillBorder,
                    ),
                  ),
                  Expanded(child: widget.expandedChild),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
