# Kartak

Graduation project: a Flutter app for discovering places around you, with in-app payment and a personal barcode card. Backed by a custom REST API.

## Features

- Sign up and login, with a forgot-password flow over OTP
- Home feed of places with shimmer loading states
- Place details with ratings and comments
- Add your own place from the profile tab
- Payment flow for the app's card, with online payment confirmation
- Scan barcodes and show your own card as a barcode
- Transactions history
- Profile management: change password and update profile picture
- Arabic and English UI

## Tech Stack

- **Flutter / Dart**
- **State management:** flutter_bloc (Cubit) + dartz
- **Dependency injection:** get_it + injectable
- **Networking:** http against `kartak-demo-od0f.onrender.com`
- **Barcode:** flutter_barcode_scanner + barcode_widget
- **UI:** cached_network_image, shimmer, flutter_rating_bar, font_awesome_flutter, floating_bottom_navigation_bar
- **Storage:** shared_preferences, path_provider, image_picker

## Architecture

Layered structure under `lib/`: `data/` (models, repo implementations, online data sources), `domain/` (contracts, use cases, DI) and `ui/` (screens and view models for auth, home, places and profile).

## Getting Started

```bash
flutter pub get
dart run build_runner build
flutter run
```
