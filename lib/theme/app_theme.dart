import 'package:flutter/material.dart';

import 'app_gradient.dart';
import 'app_shadow.dart';
import 'app_text_theme.dart';
import 'app_theme_color_scheme.dart';
import 'elevation.dart';

class AppTheme {
  static Iterable<AppTheme> themes = [lightTheme, darkTheme];

  static AppTheme darkTheme = _initializeTheme(
    colorScheme: AppThemeColorScheme.dark,
    baseThemeData: ThemeData.dark(),
  );

  static AppTheme lightTheme = _initializeTheme(
    colorScheme: AppThemeColorScheme.light,
    baseThemeData: ThemeData.light(),
  );

  final ThemeData themeData;

  final AppTextTheme textTheme;

  final AppThemeColorScheme colors;

  final AppShadow shadow;

  final AppGradient gradient;

  AppTheme({
    required this.themeData,
    required this.textTheme,
    required this.colors,
    required this.shadow,
    required this.gradient,
  });

  bool get isDark => this == darkTheme;

  static AppTheme of(BuildContext context) {
    final brightness = MediaQueryData.fromWindow(
      WidgetsBinding.instance!.window,
    ).platformBrightness;
    return brightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  static ThemeData _createBaseThemeData(
    AppThemeColorScheme colorScheme,
    AppTextTheme textTheme,
    ThemeData baseThemeData,
  ) =>
      baseThemeData.copyWith(
        primaryColor: colorScheme.primary,
        backgroundColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.white,
        cardColor: colorScheme.background,
        errorColor: colorScheme.error,
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        appBarTheme: baseThemeData.appBarTheme.copyWith(
          elevation: Elevation.$0dp.value,
          color: colorScheme.surface,
          centerTitle: false,
          iconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.lightGrey,
          ),
          actionsIconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.lightGrey,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        bottomNavigationBarTheme: baseThemeData.bottomNavigationBarTheme.copyWith(
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.lightGrey,
          elevation: Elevation.$24dp.value,
          backgroundColor: colorScheme.surface,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.lightGrey,
          ),
          unselectedIconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.lightGrey,
          ),
        ),
        buttonTheme: baseThemeData.buttonTheme.copyWith(
          minWidth: 0,
          padding: EdgeInsets.zero,
          buttonColor: colorScheme.lightGrey,
          colorScheme: baseThemeData.colorScheme.copyWith(
            secondary: colorScheme.secondary,
          ),
        ),
        primaryIconTheme: baseThemeData.iconTheme.copyWith(
          color: colorScheme.lightGrey,
        ),
        inputDecorationTheme: baseThemeData.inputDecorationTheme.copyWith(
          labelStyle: textTheme.book14.copyWith(
            color: colorScheme.lightGrey,
          ),
          alignLabelWithHint: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.lightGrey,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.lightGrey,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.error,
            ),
          ),
          errorMaxLines: 2,
        ),
        bottomSheetTheme: baseThemeData.bottomSheetTheme.copyWith(
          backgroundColor: Colors.transparent,
        ),
        colorScheme: colorScheme.copyWith(secondary: colorScheme.lightGrey),
      );

  static AppTheme _initializeTheme({
    required AppThemeColorScheme colorScheme,
    required ThemeData baseThemeData,
  }) {
    final textTheme = AppTextTheme.byColorScheme(colorScheme);
    final shadowTheme = AppShadow.byColorScheme(colorScheme);
    final gradient = AppGradient.byColorScheme(colorScheme);
    return AppTheme(
      colors: colorScheme,
      themeData: _createBaseThemeData(
        colorScheme,
        textTheme,
        baseThemeData,
      ),
      textTheme: textTheme,
      shadow: shadowTheme,
      gradient: gradient,
    );
  }
}

class AppThemeProvider extends StatefulWidget {
  final Widget child;
  final AppTheme initialTheme;

  const AppThemeProvider({
    Key? key,
    required this.initialTheme,
    required this.child,
  }) : super(key: key);

  @override
  _AppThemeProviderState createState() => _AppThemeProviderState();
}

class _AppThemeBindingScope extends InheritedWidget {
  final _AppThemeProviderState applicationThemeProviderState;

  const _AppThemeBindingScope({
    Key? key,
    required this.applicationThemeProviderState,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppThemeBindingScope oldWidget) => true;
}

class _AppThemeProviderState extends State<AppThemeProvider> {
  late AppTheme currentTheme;

  @override
  Widget build(BuildContext context) {
    return _AppThemeBindingScope(
      applicationThemeProviderState: this,
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    currentTheme = widget.initialTheme;
  }

  void updateTheme(AppTheme newTheme) {
    if (newTheme != currentTheme) {
      setState(() {
        currentTheme = newTheme;
      });
    }
  }
}

extension AppThemeTextStyleExtensions on AppThemeTextStyle {
  TextStyle get lightGrey => copyWith(
        color: colorScheme.lightGrey,
      );

  TextStyle get grey => copyWith(
        color: colorScheme.grey,
      );

  TextStyle get white => copyWith(
        color: colorScheme.white,
      );

  TextStyle get red => copyWith(
        color: colorScheme.red,
      );

  TextStyle get tiffany => copyWith(
        color: colorScheme.tiffany,
      );

  TextStyle get orange => copyWith(
        color: colorScheme.orange,
      );
}
