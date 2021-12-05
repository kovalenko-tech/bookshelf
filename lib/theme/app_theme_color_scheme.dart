import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class AppThemeColorScheme extends ColorScheme {
  static _LightColorScheme light = _LightColorScheme();
  static _DarkColorScheme dark = _DarkColorScheme();

  final Color tiffany;
  final Color red;
  final Color black;
  final Color grey;
  final Color tiffanyLight;
  final Color lightBlue;
  final Color green;
  final Color lightGreen;
  final Color darkBlue;
  final Color darkGrey;
  final Color blue;
  final Color pink;
  final Color orange;
  final Color yellow;
  final Color lightYellow;
  final Color beige;
  final Color lightGrey;
  final Color white;
  final Color shadow;
  final Color oshadGreenish;
  final Color oshadBrightRed;
  final Color oshadGreen;
  final Color silver;
  final Color border;
  final Color buttonStart;
  final Color buttonEnd;
  final Color disabled;
  final Color appBackground;

  final Brightness localBrightness;

  const AppThemeColorScheme({
    required this.localBrightness,
    required this.tiffany,
    required this.red,
    required this.black,
    required this.grey,
    required this.tiffanyLight,
    required this.lightBlue,
    required this.green,
    required this.lightGreen,
    required this.darkBlue,
    required this.darkGrey,
    required this.blue,
    required this.pink,
    required this.orange,
    required this.yellow,
    required this.lightYellow,
    required this.beige,
    required this.lightGrey,
    required this.white,
    required this.shadow,
    required this.oshadGreenish,
    required this.oshadBrightRed,
    required this.border,
    required this.buttonStart,
    required this.buttonEnd,
    required this.disabled,
    required this.oshadGreen,
    required this.silver,
    required this.appBackground,
  }) : super(
          brightness: localBrightness,
          primary: tiffany,
          primaryVariant: Colors.black,
          secondary: Colors.black,
          secondaryVariant: Colors.black,
          surface: Colors.black,
          background: Colors.black,
          error: Colors.black,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.black,
        );
}

class _DarkColorScheme extends AppThemeColorScheme {
  _DarkColorScheme()
      : super(
          localBrightness: Brightness.dark,
          tiffany: HexColor('#168B86'),
          red: HexColor('#DD3C3C'),
          black: HexColor('#111E29'),
          grey: HexColor('#70787F'),
          tiffanyLight: HexColor('#29E2DA'),
          lightBlue: HexColor('#D4F5F4'),
          green: HexColor('#38BC2D'),
          lightGreen: HexColor('#8CDF23'),
          darkBlue: HexColor('#346DFF'),
          darkGrey: HexColor('#252628'),
          blue: HexColor('#21D0F7'),
          pink: HexColor('#EC4796'),
          orange: HexColor('#FFBC7D'),
          yellow: HexColor('#FFD80A'),
          lightYellow: HexColor('#F7EE56'),
          beige: HexColor('#EDEFF5'),
          lightGrey: HexColor('#F5F4F5'),
          white: HexColor('#FFFFFF'),
          shadow: HexColor('#000000').withOpacity(0.05),
          oshadGreenish: HexColor('#6FC9C1'),
          oshadBrightRed: HexColor('#EF3743'),
          border: HexColor('#5C5C5C').withOpacity(0.07),
          buttonStart: HexColor('#008479'),
          buttonEnd: HexColor('#007167'),
          disabled: HexColor('#C0C2C6'),
          oshadGreen: HexColor('#004B45'),
          silver: HexColor('#C4C4C4').withOpacity(0.2),
          appBackground: HexColor('#F8F8F8'),
        );
}

class _LightColorScheme extends AppThemeColorScheme {
  _LightColorScheme()
      : super(
          localBrightness: Brightness.light,
          tiffany: HexColor('#168B86'),
          red: HexColor('#DD3C3C'),
          black: HexColor('#111E29'),
          grey: HexColor('#70787F'),
          tiffanyLight: HexColor('#29E2DA'),
          lightBlue: HexColor('#D4F5F4'),
          green: HexColor('#38BC2D'),
          lightGreen: HexColor('#8CDF23'),
          darkBlue: HexColor('#346DFF'),
          darkGrey: HexColor('#252628'),
          blue: HexColor('#21D0F7'),
          pink: HexColor('#EC4796'),
          orange: HexColor('#FFBC7D'),
          yellow: HexColor('#FFD80A'),
          lightYellow: HexColor('#F7EE56'),
          beige: HexColor('#EDEFF5'),
          lightGrey: HexColor('#F5F4F5'),
          white: HexColor('#FFFFFF'),
          shadow: HexColor('#000000').withOpacity(0.05),
          oshadGreenish: HexColor('#6FC9C1'),
          oshadBrightRed: HexColor('#EF3743'),
          border: HexColor('#5C5C5C').withOpacity(0.07),
          buttonStart: HexColor('#008479'),
          buttonEnd: HexColor('#007167'),
          disabled: HexColor('#C0C2C6'),
          oshadGreen: HexColor('#004B45'),
          silver: HexColor('#C4C4C4').withOpacity(0.2),
          appBackground: HexColor('#F8F8F8'),
        );
}
