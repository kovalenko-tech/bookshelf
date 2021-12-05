import 'dart:ui' as ui show Shadow, FontFeature;

import 'package:bookshelf/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme_color_scheme.dart';

class AppTextTheme extends TextTheme {
  final AppThemeTextStyle demi52;
  final AppThemeTextStyle demi40;
  final AppThemeTextStyle demi28;
  final AppThemeTextStyle demi24;
  final AppThemeTextStyle demi20;
  final AppThemeTextStyle book20;
  final AppThemeTextStyle bookCard20;
  final AppThemeTextStyle demi18;
  final AppThemeTextStyle medium18;
  final AppThemeTextStyle book18;
  final AppThemeTextStyle book16;
  final AppThemeTextStyle medium14;
  final AppThemeTextStyle book14;
  final AppThemeTextStyle medium12;
  final AppThemeTextStyle book12;

  const AppTextTheme({
    required this.demi52,
    required this.demi40,
    required this.demi28,
    required this.demi24,
    required this.demi20,
    required this.book20,
    required this.bookCard20,
    required this.demi18,
    required this.medium18,
    required this.book18,
    required this.book16,
    required this.medium14,
    required this.book14,
    required this.medium12,
    required this.book12,
  }) : super();

  factory AppTextTheme.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) =>
      AppTextTheme(
        demi52: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 52.sp,
          ),
        ),
        demi40: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 40.sp,
          ),
        ),
        demi28: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 28.sp,
          ),
        ),
        demi24: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 24.sp,
          ),
        ),
        demi20: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 20.sp,
          ),
        ),
        book20: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20.sp,
          ),
        ),
        bookCard20: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 2,
            fontSize: 20.sp,
          ),
        ),
        demi18: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 18.sp,
          ),
        ),
        medium18: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 18.sp,
          ),
        ),
        book18: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 18.sp,
          ),
        ),
        book16: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16.sp,
          ),
        ),
        medium14: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp,
          ),
        ),
        book14: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp,
          ),
        ),
        medium12: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 12.sp,
          ),
        ),
        book12: AppThemeTextStyle(colorScheme).merge(
          TextStyle(
            fontFamily: FontFamily.futuraPT,
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 12.sp,
          ),
        ),
      );
}

class AppThemeTextStyle extends TextStyle {
  final AppThemeColorScheme colorScheme;

  const AppThemeTextStyle(
    this.colorScheme, {
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
  }) : super(
          inherit: inherit,
          color: color,
          backgroundColor: backgroundColor,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          shadows: shadows,
          fontFeatures: fontFeatures,
        );

  @override
  AppThemeTextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    TextOverflow? overflow,
  }) {
    return AppThemeTextStyle(
      colorScheme,
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null ? color ?? this.color : null,
      backgroundColor: this.background == null && background == null ? backgroundColor ?? this.backgroundColor : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }

  @override
  AppThemeTextStyle merge(TextStyle? other) {
    final merged = super.merge(other);

    return copyWith(
      inherit: merged.inherit,
      color: merged.color,
      backgroundColor: merged.backgroundColor,
      fontFamily: merged.fontFamily,
      fontFamilyFallback: merged.fontFamilyFallback,
      fontSize: merged.fontSize,
      fontWeight: merged.fontWeight,
      fontStyle: merged.fontStyle,
      letterSpacing: merged.letterSpacing,
      wordSpacing: merged.wordSpacing,
      textBaseline: merged.textBaseline,
      height: merged.height,
      locale: merged.locale,
      foreground: merged.foreground,
      background: merged.background,
      shadows: merged.shadows,
      fontFeatures: merged.fontFeatures,
      decoration: merged.decoration,
      decorationColor: merged.decorationColor,
      decorationStyle: merged.decorationStyle,
      decorationThickness: merged.decorationThickness,
      debugLabel: merged.debugLabel,
    );
  }
}
