# multitool

A new Flutter project.

## Getting Started

fvm install 3.32.0


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

cd android
./gradlew clean
cd ..
flutter clean

flutter pub get
flutter run
cd android
./gradlew build
cd ..



