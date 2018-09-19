# boxed_vertical_seekbar

A vertical SeekBar build with two [SizedBox](https://docs.flutter.io/flutter/widgets/SizedBox-class.html) with versatile appearance.

Inspired by the [BoxedVerticalSeekBar](https://github.com/alpbak/BoxedVerticalSeekBar) Android
library by [@alpbak](https://github.com/alpbak).

## Usage

Import into your project.

pubspec.yaml:
```
dependencies:
  ...
  boxed_vertical_seekbar: ^1.0.0
```

Use the widget in your project. Height and width parameters are required.

Example:
```dart
BoxedVerticalSeekbar(
  height: 400.0,
  width: 150.0,
  onValueChanged: (newValue) => print(newValue),
)
```

To learn more about the available parameters visit the
[docs](https://pub.dartlang.org/documentation/boxed_vertical_seekbar/latest/boxed_vertical_seekbar/BoxedVerticalSeekBar-class.html).

Default appearance of the SeekBar is a red active bar over a grey inactive bar.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).