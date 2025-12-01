import 'package:flutter/material.dart';

/// Responsive layout utilities for adaptive UI.
/// Breakpoints: small < 600dp, medium 600-1024dp, large > 1024dp.
/// Exports: ResponsiveLayout widget and helper functions.

/// Breakpoint constants
class Breakpoints {
  static const double small = 600;
  static const double large = 1024;
}

/// Responsive layout data
class ResponsiveData {
  final bool isSmall;
  final bool isMedium;
  final bool isLarge;
  final double width;
  final double height;

  const ResponsiveData({
    required this.isSmall,
    required this.isMedium,
    required this.isLarge,
    required this.width,
    required this.height,
  });
}

/// Widget that provides responsive layout data to children.
/// Usage: ResponsiveLayout(builder: (data) => ...)
class ResponsiveLayout extends StatelessWidget {
  final Widget Function(ResponsiveData data) builder;

  const ResponsiveLayout({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    final isSmall = width < Breakpoints.small;
    final isLarge = width >= Breakpoints.large;
    final isMedium = !isSmall && !isLarge;

    final data = ResponsiveData(
      isSmall: isSmall,
      isMedium: isMedium,
      isLarge: isLarge,
      width: width,
      height: height,
    );

    return builder(data);
  }
}

/// Extension on BuildContext for quick responsive checks
extension ResponsiveExtension on BuildContext {
  bool get isSmallScreen {
    final width = MediaQuery.of(this).size.width;
    return width < Breakpoints.small;
  }

  bool get isMediumScreen {
    final width = MediaQuery.of(this).size.width;
    return width >= Breakpoints.small && width < Breakpoints.large;
  }

  bool get isLargeScreen {
    final width = MediaQuery.of(this).size.width;
    return width >= Breakpoints.large;
  }

  ResponsiveData get responsiveData {
    final mediaQuery = MediaQuery.of(this);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    final isSmall = width < Breakpoints.small;
    final isLarge = width >= Breakpoints.large;
    final isMedium = !isSmall && !isLarge;

    return ResponsiveData(
      isSmall: isSmall,
      isMedium: isMedium,
      isLarge: isLarge,
      width: width,
      height: height,
    );
  }
}
