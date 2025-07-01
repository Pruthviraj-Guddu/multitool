# MultiTool - All-in-One Utility App 🛠️

![MultiTool Banner](https://github.com/Pruthviraj-Guddu/multitool/blob/main/assets/banner.png?raw=true) <!-- Add a banner if available -->

A Flutter-based utility app featuring essential tools for productivity and daily use. Currently includes Pomodoro Timer and Digital Compass, with more tools coming soon!

<!-- [![GitHub stars](https://img.shields.io/github/stars/Pruthviraj-Guddu/multitool?style=social)](https://github.com/Pruthviraj-Guddu/multitool)
 -->

[![Play Store](https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.pruthviraj.multitool)

## Features ✨

- **Pomodoro Timer** 🍅
  - Customizable work/break intervals
  - Visual countdown display
  - Start/Pause/Reset functionality

- **Digital Compass** 🧭
  - Real-time direction tracking
  - Clean, intuitive interface
  - Location permission handling

## Coming Soon 🚧
- Unit Converter
- Flashlight
- Level Tool
- [Suggest a feature](https://github.com/Pruthviraj-Guddu/multitool/issues)

<!-- ## Screenshots 📱
| Pomodoro Timer | Digital Compass |
|----------------|-----------------|
| ![Pomodoro](https://github.com/Pruthviraj-Guddu/multitool/blob/main/screenshots/pomodoro.png?raw=true) | ![Compass](https://github.com/Pruthviraj-Guddu/multitool/blob/main/screenshots/compass.png?raw=true) | -->

## Development Setup 🛠️

### Prerequisites
- Flutter 3.32.0 (recommended to use FVM)
- Android Studio/Xcode (for platform-specific builds)

### Installation
```bash
# Install correct Flutter version
fvm install 3.32.0
fvm use 3.32.0

# Clean and setup
flutter clean
flutter pub get
```

### Building
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle
```

### Version Management
Update in `pubspec.yaml`:
```yaml
version: 1.0.0+1  # versionName.versionCode
```

## Clean Build (For Troubleshooting) 🧹
```bash
# Full clean
flutter clean
sudo rm -rf linux/flutter/*
sudo rm -rf macos/Flutter/*
sudo rm -rf windows/flutter/*

sudo rm -rf android/.gradle/
sudo rm -rf android/.idea/
sudo rm -rf android/build/
sudo rm -rf android/local.properties
sudo rm -rf android/.kotlin
sudo rm -rf android/app/.cxx/Debug/*
sudo rm -rf android/app/.cxx/*
sudo rm -rf android/app/.cxx/

# Android-specific clean
cd android && ./gradlew clean && cd ..
```

## Contributing 🤝
Contributions are welcome! Please open an issue first to discuss what you'd like to change.

## Download 📥
Get the app on [Google Play](https://play.google.com/store/apps/details?id=com.pruthviraj.multitool)

## License 📄
[MIT](https://github.com/Pruthviraj-Guddu/multitool/blob/main/LICENSE)
