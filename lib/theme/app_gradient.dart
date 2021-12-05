import 'package:flutter/material.dart';

import 'app_theme_color_scheme.dart';

class AppGradient {
  final LinearGradient button;
  final LinearGradient light;

  const AppGradient({
    required this.button,
    required this.light,
  }) : super();

  factory AppGradient.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) =>
      AppGradient(
        button: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.buttonStart,
            colorScheme.buttonEnd,
          ],
        ),
        light: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.lightGrey,
            colorScheme.white,
          ],
        ),
      );
}
