# COS_challenge 🚗

- This app was built as part of the CarOnSale Flutter coding challenge.

## 🔧 Features
- User ID input with SharedPreferences storage (auto-skip on relaunch)
- VIN input with validation and error feedback
- Server response handling 200 / 300 / 400
- Vehicle selection (300 response)
- Vin scan result display with feedback indicator
- Data caching using Hive and using it as a fallback
- Light/Dark mode support

## 📂 Tech Stack
- Flutter
- Riverpod
- Hive
- SharedPreferences

## 🗂 Git versioning
- This GitHub repo is used to showcase the usage of a clean commit history and Git Flow methodology to simulate realistic development progression.
Features were developed incrementally in feature branches, then merged into develop, and finally released to main.

## 🧱 Architecture
- Modular architecture inspired by Clean Architecture 
- MVVM principles
- Riverpod for state management and dependency injection

## 🚀 Running the App
- flutter pub get
- flutter run

## 🧪 Testing 
- flutter test

Tests cover different server response handling 
- Success (200)
- Redirect(300)
- Failure (400)

## 🙏 Thank You