# App Theme System

This document explains how to use the global theme system throughout the project.

## Overview

The theme system provides:
- **AppColors**: Static color constants for light and dark themes
- **AppTextStyles**: Predefined text styles using Google Fonts (Outfit)
- **AppThemeColors**: Theme-aware color access
- **AppThemeExtensions**: Easy access to colors via BuildContext extension

## Usage

### Accessing Colors

#### Method 1: Using Extension (Recommended)
```dart
Widget build(BuildContext context) {
  final colors = context.appColors;
  
  return Container(
    color: colors.background,
    child: Text(
      'Hello',
      style: TextStyle(color: colors.headings),
    ),
  );
}
```

#### Method 2: Direct Access
```dart
// For static colors (not theme-aware)
Container(
  color: AppColors.lightBackground,
)
```

### Accessing Text Styles

All text styles are static methods that require a `BuildContext`:

```dart
Widget build(BuildContext context) {
  return Column(
    children: [
      Text(
        'Large Heading',
        style: AppTextStyles.headlineLarge(context),
      ),
      Text(
        'Body Text',
        style: AppTextStyles.bodyLarge(context),
      ),
      Text(
        'Hero Name',
        style: AppTextStyles.heroName(context),
      ),
    ],
  );
}
```

### Available Text Styles

#### Display Styles
- `displayLarge(context)` - 57px, bold
- `displayMedium(context)` - 45px, bold
- `displaySmall(context)` - 36px, bold

#### Headline Styles
- `headlineLarge(context)` - 32px, bold
- `headlineMedium(context)` - 28px, bold
- `headlineSmall(context)` - 24px, w600

#### Title Styles
- `titleLarge(context)` - 22px, w600
- `titleMedium(context)` - 16px, w600
- `titleSmall(context)` - 14px, w600

#### Body Styles
- `bodyLarge(context)` - 16px, w400, height: 1.5
- `bodyMedium(context)` - 14px, w400, height: 1.5
- `bodySmall(context)` - 12px, w400, height: 1.4

#### Label Styles
- `labelLarge(context)` - 14px, w500
- `labelMedium(context)` - 12px, w500
- `labelSmall(context)` - 11px, w500

#### Custom Styles
- `heroName(context)` - 48px, bold, for hero section name
- `heroTitle(context)` - 22px, w600, accent color
- `heroGreeting(context)` - 22px, w300
- `sectionTitle(context)` - 36px, bold
- `cardTitle(context)` - 20px, w600
- `navItem(context, isActive: bool)` - 14px, for navigation items

### Available Colors

#### Via Extension (Theme-aware)
```dart
final colors = context.appColors;

colors.background  // Background color
colors.surface     // Surface/Card color
colors.primary     // Primary color
colors.secondary    // Secondary color
colors.headings     // Heading text color
colors.bodyText     // Body text color
colors.divider      // Divider color
colors.accent       // Accent color (red)
colors.grey         // Grey color
colors.border       // Border color
```

#### Direct Access (Static)
```dart
// Light theme
AppColors.lightBackground
AppColors.lightSurface
AppColors.lightPrimary
// ... etc

// Dark theme
AppColors.darkBackground
AppColors.darkSurface
AppColors.darkPrimary
// ... etc
```

### Checking Theme Mode

```dart
Widget build(BuildContext context) {
  final isDark = context.isDarkMode;
  
  return Container(
    color: isDark ? Colors.black : Colors.white,
  );
}
```

## Best Practices

1. **Always use the extension for colors** - `context.appColors` automatically adapts to light/dark theme
2. **Use predefined text styles** - Don't create custom GoogleFonts calls, use `AppTextStyles`
3. **Avoid hardcoded colors** - Use `context.appColors` instead of `Colors.white` or `Colors.black`
4. **Use theme-aware colors** - The extension automatically returns the correct colors based on current theme

## Migration Guide

### Before
```dart
Text(
  'Hello',
  style: GoogleFonts.outfit(
    fontSize: 16,
    color: Colors.black,
  ),
)
```

### After
```dart
Text(
  'Hello',
  style: AppTextStyles.bodyLarge(context),
)
```

### Before
```dart
Container(
  color: isDark ? Colors.black : Colors.white,
)
```

### After
```dart
Container(
  color: context.appColors.background,
)
```

