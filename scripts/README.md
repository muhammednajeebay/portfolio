# Scripts Directory

This directory contains utility scripts for maintaining the project.

## Fix Flutter SVG HashValues Issue

The `flutter_svg` package version 1.0.3 has a compatibility issue with newer Flutter versions where it uses the deprecated `hashValues` function. This has been patched in the package cache.

### If you encounter hashValues errors:

**Windows (PowerShell):**
```powershell
.\scripts\fix_flutter_svg.ps1
```

**Linux/Mac (Bash):**
```bash
chmod +x scripts/fix_flutter_svg.sh
./scripts/fix_flutter_svg.sh
```

### What the script does:

1. Removes `hashValues` from the import statement in `picture_provider.dart`
2. Replaces all `hashValues(...)` calls with `Object.hash(...)` in:
   - `picture_provider.dart` (4 instances)
   - `svg/theme.dart` (1 instance)

### When to run:

- After running `flutter clean`
- After clearing the pub cache
- If you see `hashValues` compilation errors
- After reinstalling dependencies

### Note:

This is a temporary workaround until `flutter_svg` is updated or you migrate to a newer version. The patch is applied directly to the package in your pub cache, so it will persist until you clear the cache or reinstall the package.

