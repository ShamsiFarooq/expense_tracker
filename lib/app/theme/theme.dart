import 'package:flutter/material.dart';

import 'package:foxus/app/theme/app_colors.dart';
import 'package:foxus/app/theme/app_typography.dart';
import 'package:foxus/app/theme/app_spacing.dart';
import 'package:foxus/app/theme/app_radius.dart';


/// -------- LIGHT THEME --------
ThemeData foxusLightTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryLight,
    onPrimary: AppColors.onPrimaryLight,
    secondary: AppColors.secondaryLight,
    onSecondary: Colors.white,
    error: AppColors.errorLight,
    onError: Colors.white,
    surface: AppColors.surfaceLight, // replaced background
    onSurface: AppColors.onSurfaceLight,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    dividerColor: AppColors.borderLight,

    // Typography
    textTheme: const TextTheme(
      displayLarge: AppTypography.displayLarge,
      headlineMedium: AppTypography.headlineMedium,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      labelSmall: AppTypography.labelSmall,
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      foregroundColor: AppColors.primaryLight,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTypography.headlineMedium,
    ),

    // Cards
    cardTheme: CardTheme(
      color: AppColors.surfaceLight,
      elevation: 0,
      margin: AppSpacing.card,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
      shadowColor: Colors.black.withValues(alpha: 0.05),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        textStyle: AppTypography.bodyLarge,
      ),
    ),

    // Inputs
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.mdBorder,
        borderSide: BorderSide(color: AppColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.mdBorder,
        borderSide: BorderSide(color: AppColors.primaryLight, width: 2),
      ),
      hintStyle: TextStyle(color: AppColors.mutedLight),
    ),

    // Chips
    chipTheme: ChipThemeData(
      side: const BorderSide(color: AppColors.borderLight),
      labelStyle: AppTypography.labelSmall,
      backgroundColor: AppColors.surfaceLight,
      selectedColor: AppColors.secondaryLight.withValues(alpha: 0.2),
    ),

    // Icons
    iconTheme: const IconThemeData(color: AppColors.mutedLight),

    // Animations
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}

/// -------- DARK THEME --------
ThemeData foxusDarkTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    onPrimary: AppColors.onPrimaryDark,
    secondary: AppColors.secondaryDark,
    onSecondary: Colors.black,
    error: AppColors.errorDark,
    onError: Colors.black,
    surface: AppColors.surfaceDark, // replaced background
    onSurface: AppColors.onSurfaceDark,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    dividerColor: AppColors.borderDark,

    // Typography
    textTheme: const TextTheme(
      displayLarge: AppTypography.displayLarge,
      headlineMedium: AppTypography.headlineMedium,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      labelSmall: AppTypography.labelSmall,
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.onSurfaceDark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTypography.headlineMedium,
    ),

    // Cards
    cardTheme: CardTheme(
      color: AppColors.surfaceDark,
      elevation: 0,
      margin: AppSpacing.card,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
      shadowColor: Colors.black.withValues(alpha: 0.2),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        textStyle: AppTypography.bodyLarge,
      ),
    ),

    // Inputs
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.mdBorder,
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.mdBorder,
        borderSide: BorderSide(color: AppColors.secondaryDark, width: 2),
      ),
      hintStyle: TextStyle(color: AppColors.mutedDark),
    ),

    // Chips
    chipTheme: ChipThemeData(
      side: const BorderSide(color: AppColors.borderDark),
      labelStyle: AppTypography.labelSmall,
      backgroundColor: AppColors.surfaceDark,
      selectedColor: AppColors.secondaryDark.withValues(alpha: 0.2),
    ),

    // Icons
    iconTheme: const IconThemeData(color: AppColors.mutedDark),

    // Animations
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
