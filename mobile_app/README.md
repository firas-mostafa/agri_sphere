# Mobile App (Flutter)

This folder contains the Flutter mobile application for Agri Sphere. The app targets Android and iOS.

## Prerequisites
- Flutter SDK (stable channel)
- Android Studio / Xcode for device emulators and builds
- Set up Android SDK and platform tools, and configure PATH as per Flutter docs

## Setup
1. Install dependencies: `flutter pub get`\2. Run on an emulator or device: `flutter run`

## Build
- Android APK: `flutter build apk --release`
- iOS: `flutter build ios` (requires a macOS machine with Xcode)

## Environment / API
- If the app uses environment constants, configure them in a secure way (e.g., use build-time dart-define or a config file ignored by Git).

## Notes
- Keep keys out of source control. For testing API endpoints use the local backend URL or a tunneling service (like ngrok) when running on a physical device.
