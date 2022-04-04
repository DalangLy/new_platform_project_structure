## Getting Started


## Info
- Minimum Android Version 4.4

# Development Info

## Cloning from git
### Generate Auto Route
- Remove "router.gr.dart" file in 'config/routes/auto_route' folder
- Run Command "flutter packages pub run build_runner build --delete-conflicting-outputs"

### Generate Splash Screen (*note* native splash screen & icon launcher package are conflict, u need to comment out one of theme to make command flutter pub get work)
- flutter pub run flutter_native_splash:create

### Generate Launcher App Icon (*note* native splash screen & icon launcher package are conflict, u need to comment out one of theme to make command flutter pub get work)
- flutter pub run flutter_launcher_icons:main

## Add or Update App Language
- change or add new text in ".arb" file in i10n folder
- run the app to generate localization
- copy all files from .dart_tool -> flutter_gen -> gen_i10n to lib/i10n
- apply language wherever u want in app

### To Build for different platforms
- flutter config --help
- flutter config --enable-windows-desktop
- flutter create .
- flutter run -d windows
- flutter build windows