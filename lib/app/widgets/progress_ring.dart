import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_motion.dart';
import 'package:foxus/app/theme/app_colors.dart';

/// Animated: Progress ring with animated values for dashboard.
/// Motion token: motion.base for value transitions.
/// Exports: ProgressRing widget using TweenAnimationBuilder.
class ProgressRing extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final Widget? child;

  const ProgressRing({
    super.key,
    required this.progress,
    this.size = 120,
    this.strokeWidth = 8,
    this.color,
    this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final progressColor =
        color ?? (isDark ? AppColors.secondaryDark : AppColors.secondaryLight);
    final bgColor =
        backgroundColor ??
        (isDark
            ? AppColors.surfaceDark
            : AppColors.surfaceLight.withValues(alpha: 0.3));

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(bgColor),
            ),
          ),
          // Animated progress
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: progress),
            duration: AppMotion.base,
            curve: AppMotion.curveDecel,
            builder: (context, value, child) {
              return SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: strokeWidth,
                  strokeCap: StrokeCap.round,
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
              );
            },
          ),
          // Child content (e.g., percentage text)
          if (child != null) child!,
        ],
      ),
    );
  }
}
