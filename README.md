# films

A new Flutter project.

## Open Deeplinks

adb shell 'am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "filmsdb://youfirlms/film?id=13"'

/usr/bin/xcrun simctl openurl booted "filmsdb://youfirlms/film?id=13"

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
