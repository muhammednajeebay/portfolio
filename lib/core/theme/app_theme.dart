import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App Color Scheme
/// Provides static color constants for light and dark themes
class AppColors {
  // Light Theme Colors
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF5F5F5);
  static const lightPrimary = Color(0xFF000000);
  static const lightSecondary = Color(0xFF2E2E2E);
  static const lightHeadings = Color(0xFF000000);
  static const lightBodyText = Color(0xFF1F1F1F);
  static const lightDivider = Color(0xFFE0E0E0);
  static const lightAccent = Color(0xFFDC2626); // Red accent
  static const lightGrey = Color(0xFF444444);
  static const lightBorder = Color(0xFFE5E5E5);

  // Dark Theme Colors
  static const darkBackground = Color(0xFF000000);
  static const darkSurface = Color(0xFF121212);
  static const darkPrimary = Color(0xFFFFFFFF);
  static const darkSecondary = Color(0xFFBDBDBD);
  static const darkHeadings = Color(0xFFFFFFFF);
  static const darkBodyText = Color(0xFFE0E0E0);
  static const darkDivider = Color(0xFF2A2A2A);
  static const darkAccent = Color(0xFFDC2626); // Red accent
  static const darkGrey = Color(0xFFC9D1D9);
  static const darkBorder = Color(0xFF30363D);
}

/// App Text Styles
/// Provides predefined text styles using Google Fonts (roboto)
class AppTextStyles {
  // Display Styles
  static TextStyle displayLarge(BuildContext context) => GoogleFonts.roboto(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.25,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle displayMedium(BuildContext context) => GoogleFonts.roboto(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle displaySmall(BuildContext context) => GoogleFonts.roboto(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // Hero Name Styles
  static TextStyle splashTitle(BuildContext context) => GoogleFonts.bebasNeue(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // Headline Styles
  static TextStyle headlineLarge(BuildContext context) => GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle headlineMedium(BuildContext context) => GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle headlineSmall(BuildContext context) => GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // Title Styles
  static TextStyle titleLarge(BuildContext context) => GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle titleMedium(BuildContext context) => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle titleSmall(BuildContext context) => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // Body Styles
  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.5,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.5,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle bodySmall(BuildContext context) => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.4,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // Label Styles
  static TextStyle labelLarge(BuildContext context) => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle labelMedium(BuildContext context) => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle labelSmall(BuildContext context) => GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // Custom Styles
  static TextStyle heroName(BuildContext context) => GoogleFonts.roboto(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: -1,
        height: 1.2,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle heroTitle(BuildContext context) {
    final colors = context.appColors;
    return GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.4,
      color: colors.accent,
    );
  }

  static TextStyle heroGreeting(BuildContext context) => GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle sectionTitle(BuildContext context) => GoogleFonts.roboto(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle cardTitle(BuildContext context) => GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle navItem(BuildContext context, {bool isActive = false}) =>
      GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
        letterSpacing: 1.5,
        color: Theme.of(context).colorScheme.onSurface,
      );
}

/// Theme Extensions for easy access to app-specific colors and styles
extension AppThemeExtensions on BuildContext {
  /// Get app-specific colors based on current theme
  AppThemeColors get appColors {
    final isDark = Theme.of(this).brightness == Brightness.dark;
    return isDark ? AppThemeColors.dark() : AppThemeColors.light();
  }

  /// Check if current theme is dark
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

/// App Theme Colors
/// Provides theme-aware color access
class AppThemeColors {
  final Color background;
  final Color surface;
  final Color primary;
  final Color secondary;
  final Color headings;
  final Color bodyText;
  final Color divider;
  final Color accent;
  final Color grey;
  final Color border;

  const AppThemeColors({
    required this.background,
    required this.surface,
    required this.primary,
    required this.secondary,
    required this.headings,
    required this.bodyText,
    required this.divider,
    required this.accent,
    required this.grey,
    required this.border,
  });

  factory AppThemeColors.light() => const AppThemeColors(
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
        headings: AppColors.lightHeadings,
        bodyText: AppColors.lightBodyText,
        divider: AppColors.lightDivider,
        accent: AppColors.lightAccent,
        grey: AppColors.lightGrey,
        border: AppColors.lightBorder,
      );

  factory AppThemeColors.dark() => const AppThemeColors(
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        headings: AppColors.darkHeadings,
        bodyText: AppColors.darkBodyText,
        divider: AppColors.darkDivider,
        accent: AppColors.darkAccent,
        grey: AppColors.darkGrey,
        border: AppColors.darkBorder,
      );
}

/// Main App Theme Configuration
class AppTheme {
  static TextTheme _buildTextTheme(TextTheme base, Color headings, Color body) {
    return GoogleFonts.robotoTextTheme(base).copyWith(
      // Display
      displayLarge: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.bold,
        fontSize: 57,
        letterSpacing: -0.25,
      ),
      displayMedium: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.bold,
        fontSize: 45,
        letterSpacing: 0,
      ),
      displaySmall: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.bold,
        fontSize: 36,
        letterSpacing: 0,
      ),
      // Headline
      headlineLarge: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.bold,
        fontSize: 32,
        letterSpacing: 0,
      ),
      headlineMedium: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        letterSpacing: 0,
      ),
      headlineSmall: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        letterSpacing: 0,
      ),
      // Title
      titleLarge: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.w600,
        fontSize: 22,
        letterSpacing: 0,
      ),
      titleMedium: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.roboto(
        color: headings,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        letterSpacing: 0.1,
      ),
      // Body
      bodyLarge: GoogleFonts.roboto(
        color: body,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: body,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.5,
      ),
      bodySmall: GoogleFonts.roboto(
        color: body,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.4,
      ),
      // Label
      labelLarge: GoogleFonts.roboto(
        color: body,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.roboto(
        color: body,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.roboto(
        color: body,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
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
        onPrimary: AppColors.lightBackground,
        outline: AppColors.lightDivider,
        error: AppColors.lightAccent,
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
      dividerTheme: const DividerThemeData(color: AppColors.darkDivider),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkHeadings,
        onPrimary: AppColors.darkBackground,
        outline: AppColors.darkDivider,
        error: AppColors.darkAccent,
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
