import 'package:flutter/material.dart';

import 'app_theme_color_scheme.dart';

class AppShadow {
  final BoxShadow card;

  const AppShadow({
    required this.card,
  }) : super();

  factory AppShadow.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) =>
      AppShadow(
        card: BoxShadow(
          color: colorScheme.shadow,
          offset: const Offset(0, 2),
          blurRadius: 10,
        ),
      );
}
