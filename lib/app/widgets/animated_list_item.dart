import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_motion.dart';
import 'package:foxus/app/theme/app_colors.dart';
import 'package:foxus/app/theme/app_radius.dart';

/// Animated: Slide & fade in with stagger; swipe-to-delete reveals delete action.
/// Motion token: motion.base for entry, motion.fast for swipe.
/// Exports: AnimatedListItem widget for list item animations.
class AnimatedListItem extends StatefulWidget {
  final Widget child;
  final VoidCallback? onDelete;
  final int index;
  final Duration? staggerDelay;

  const AnimatedListItem({
    super.key,
    required this.child,
    this.onDelete,
    this.index = 0,
    this.staggerDelay,
  });

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    final delay =
        widget.staggerDelay ??
        Duration(milliseconds: widget.index * 50); // Stagger by 50ms per item

    _controller = AnimationController(duration: AppMotion.base, vsync: this);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.curveEase));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.curveEase));

    // Start animation after delay
    Future.delayed(delay, () {
      if (mounted && AppMotion.shouldAnimate(context)) {
        _controller.forward();
      } else {
        _controller.value = 1.0; // Instant if animations disabled
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!AppMotion.shouldAnimate(context)) {
      return widget.child;
    }

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(opacity: _fadeAnimation, child: widget.child),
    );
  }
}

/// Swipeable list item with delete action reveal.
class SwipeableListItem extends StatefulWidget {
  final Widget child;
  final VoidCallback? onDelete;
  final int index;
  final Duration? staggerDelay;

  const SwipeableListItem({
    super.key,
    required this.child,
    this.onDelete,
    this.index = 0,
    this.staggerDelay,
  });

  @override
  State<SwipeableListItem> createState() => _SwipeableListItemState();
}

class _SwipeableListItemState extends State<SwipeableListItem> {
  final GlobalKey _dismissKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (widget.onDelete == null) {
      return AnimatedListItem(
        index: widget.index,
        staggerDelay: widget.staggerDelay,
        child: widget.child,
      );
    }

    return Dismissible(
      key: _dismissKey,
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColors.errorLight,
          borderRadius: AppRadius.card,
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
      ),
      onDismissed: (direction) {
        widget.onDelete?.call();
      },
      child: AnimatedListItem(
        index: widget.index,
        staggerDelay: widget.staggerDelay,
        child: widget.child,
      ),
    );
  }
}
