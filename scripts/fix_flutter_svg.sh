#!/bin/bash
# Script to fix flutter_svg hashValues issue
# Run this script if you encounter hashValues errors after clearing pub cache

FLUTTER_SVG_PATH="$HOME/.pub-cache/hosted/pub.dev/flutter_svg-1.0.3/lib/src"

echo "Fixing flutter_svg hashValues issue..."

# Fix picture_provider.dart
PICTURE_PROVIDER_PATH="$FLUTTER_SVG_PATH/picture_provider.dart"
if [ -f "$PICTURE_PROVIDER_PATH" ]; then
    # Remove hashValues from import
    sed -i.bak 's/show BlendMode, Color, ColorFilter, Locale, Rect, TextDirection, hashValues;/show BlendMode, Color, ColorFilter, Locale, Rect, TextDirection;/g' "$PICTURE_PROVIDER_PATH"
    
    # Replace all hashValues with Object.hash
    sed -i.bak 's/hashValues(/Object.hash(/g' "$PICTURE_PROVIDER_PATH"
    
    rm -f "$PICTURE_PROVIDER_PATH.bak"
    echo "✓ Fixed picture_provider.dart"
else
    echo "✗ picture_provider.dart not found"
fi

# Fix theme.dart
THEME_PATH="$FLUTTER_SVG_PATH/svg/theme.dart"
if [ -f "$THEME_PATH" ]; then
    sed -i.bak 's/hashValues(/Object.hash(/g' "$THEME_PATH"
    rm -f "$THEME_PATH.bak"
    echo "✓ Fixed theme.dart"
else
    echo "✗ theme.dart not found"
fi

echo ""
echo "Done! You can now run 'flutter pub get' and compile your app."

