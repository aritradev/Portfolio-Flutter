import 'package:flutter/material.dart';

/// Minimal, professional color system.
/// One accent color, neutral grays, works for both light & dark (system-adaptive).
class AppColors {
  static const accent = Color(0xFFC05800);
  static const accentSoft = Color(0xFF713600);
  static const accentWarm = Color(0xFF9A4D00);

  // Light theme neutrals
  static const lightBg = Color(0xFFFDFBD4);
  static const lightSurface = Color(0xFFFFF7DB);
  static const lightSurfaceAlt = Color(0xFFF5E8B8);
  static const lightBorder = Color(0xFF38240D);
  static const lightTextPrimary = Color(0xFF38240D);
  static const lightTextSecondary = Color(0xFF713600);

  // Dark theme neutrals
  static const darkBg = Color(0xFF140D08);
  static const darkSurface = Color(0xFF1E130C);
  static const darkSurfaceAlt = Color(0xFF2A1A10);
  static const darkBorder = Color(0xFF5A3A1D);
  static const darkTextPrimary = Color(0xFFF8F1E6);
  static const darkTextSecondary = Color(0xFFC9B59C);
}

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBg,
        colorScheme: const ColorScheme.light(
          primary: AppColors.accent,
          secondary: AppColors.accentWarm,
          surface: AppColors.lightSurface,
          surfaceContainerHighest: AppColors.lightSurfaceAlt,
          surfaceTint: AppColors.accentSoft,
          outline: AppColors.lightBorder,
        ),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
          headlineSmall: TextStyle(
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
          titleLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            height: 1.5,
          ),
          bodyMedium: TextStyle(
            color: AppColors.lightTextSecondary,
            height: 1.5,
          ),
        ),
        dividerColor: AppColors.lightBorder,
        cardTheme: CardThemeData(
          color: AppColors.lightSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: AppColors.lightBorder),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: AppColors.lightTextPrimary,
          centerTitle: false,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.lightBorder,
          thickness: 1,
          space: 1,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.lightSurfaceAlt,
          selectedColor: AppColors.accent,
          side: const BorderSide(color: AppColors.lightBorder),
          labelStyle: const TextStyle(
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.accentWarm,
          surface: AppColors.darkSurface,
          surfaceContainerHighest: AppColors.darkSurfaceAlt,
          surfaceTint: AppColors.accentSoft,
          outline: AppColors.darkBorder,
        ),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
          headlineSmall: TextStyle(
            color: AppColors.darkTextPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
          titleLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            height: 1.5,
          ),
          bodyMedium: TextStyle(
            color: AppColors.darkTextSecondary,
            height: 1.5,
          ),
        ),
        dividerColor: AppColors.darkBorder,
        cardTheme: CardThemeData(
          color: AppColors.darkSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: AppColors.darkBorder),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: AppColors.darkTextPrimary,
          centerTitle: false,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.darkBorder,
          thickness: 1,
          space: 1,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.darkSurfaceAlt,
          selectedColor: AppColors.accent,
          side: const BorderSide(color: AppColors.darkBorder),
          labelStyle: const TextStyle(
            color: AppColors.darkTextPrimary,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        ),
      );
}
