import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BrightnessProvider {
  Brightness value() {
    final brightness = MediaQueryData.fromWindow(
      WidgetsBinding.instance!.window,
    ).platformBrightness;
    return brightness;
  }

  SystemUiOverlayStyle overlayStyle() =>
      value() == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
}
