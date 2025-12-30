import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Light (White-first)
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF5F5F5);
  static const lightPrimary = Color(0xFF000000);
  static const lightSecondary = Color(0xFF2E2E2E);
  static const lightHeadings = Color(0xFF000000);
  static const lightBodyText = Color(0xFF1F1F1F);
  static const lightDivider = Color(0xFFE0E0E0);
  static const lightAccent = Color(0xFFDC2626); // Red accent

  // Dark (Black-first)
  static const darkBackground = Color(0xFF000000);
  static const darkSurface = Color(0xFF121212);
  static const darkPrimary = Color(0xFFFFFFFF);
  static const darkSecondary = Color(0xFFBDBDBD);
  static const darkHeadings = Color(0xFFFFFFFF);
  static const darkBodyText = Color(0xFFE0E0E0);
  static const darkDivider = Color(0xFF2A2A2A);
  static const darkAccent = Color(0xFFDC2626); // Red accent
}

class AppTheme {
  static TextTheme _buildTextTheme(TextTheme base, Color headings, Color body) {
    return GoogleFonts.outfitTextTheme(base).copyWith(
      headlineLarge: GoogleFonts.outfit(
        color: headings,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.outfit(
        color: headings,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headlineSmall: GoogleFonts.outfit(
        color: headings,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      bodyLarge: GoogleFonts.outfit(
        color: body,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.outfit(
        color: body,
        fontSize: 14,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      cardColor: AppColors.lightSurface,
      dividerColor: AppColors.lightDivider,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightHeadings,
        outline: AppColors.lightDivider,
      ),
      textTheme: _buildTextTheme(
        ThemeData.light().textTheme,
        AppColors.lightHeadings,
        AppColors.lightBodyText,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardColor: AppColors.darkSurface,
      dividerTheme: const DividerThemeData(color: Color(0xFF30363D)),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkHeadings,
        outline: Color(0xFF30363D),
      ),
      textTheme: _buildTextTheme(
        ThemeData.dark().textTheme,
        AppColors.darkHeadings,
        AppColors.darkBodyText,
      ),
      useMaterial3: true,
    );
  }
}
