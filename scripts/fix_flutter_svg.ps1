# Script to fix flutter_svg hashValues issue
# Run this script if you encounter hashValues errors after clearing pub cache

$flutterSvgPath = "$env:LOCALAPPDATA\Pub\Cache\hosted\pub.dev\flutter_svg-1.0.3\lib\src"

Write-Host "Fixing flutter_svg hashValues issue..." -ForegroundColor Yellow

# Fix picture_provider.dart
$pictureProviderPath = Join-Path $flutterSvgPath "picture_provider.dart"
if (Test-Path $pictureProviderPath) {
    $content = Get-Content $pictureProviderPath -Raw
    
    # Remove hashValues from import
    $content = $content -replace "show BlendMode, Color, ColorFilter, Locale, Rect, TextDirection, hashValues;", "show BlendMode, Color, ColorFilter, Locale, Rect, TextDirection;"
    
    # Replace all hashValues with Object.hash
    $content = $content -replace "hashValues\(", "Object.hash("
    
    Set-Content -Path $pictureProviderPath -Value $content -NoNewline
    Write-Host "✓ Fixed picture_provider.dart" -ForegroundColor Green
} else {
    Write-Host "✗ picture_provider.dart not found" -ForegroundColor Red
}

# Fix theme.dart
$themePath = Join-Path $flutterSvgPath "svg\theme.dart"
if (Test-Path $themePath) {
    $content = Get-Content $themePath -Raw
    $content = $content -replace "hashValues\(", "Object.hash("
    Set-Content -Path $themePath -Value $content -NoNewline
    Write-Host "✓ Fixed theme.dart" -ForegroundColor Green
} else {
    Write-Host "✗ theme.dart not found" -ForegroundColor Red
}

Write-Host "`nDone! You can now run 'flutter pub get' and compile your app." -ForegroundColor Green

