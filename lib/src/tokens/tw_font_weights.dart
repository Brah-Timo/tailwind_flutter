import 'package:flutter/widgets.dart';

/// 9 font-weight tokens matching Tailwind CSS v4's `font-*` utilities.
///
/// | Token      | CSS equivalent  | Value          |
/// |------------|-----------------|----------------|
/// | thin       | font-thin       | FontWeight.w100 |
/// | extralight | font-extralight | FontWeight.w200 |
/// | light      | font-light      | FontWeight.w300 |
/// | normal     | font-normal     | FontWeight.w400 |
/// | medium     | font-medium     | FontWeight.w500 |
/// | semibold   | font-semibold   | FontWeight.w600 |
/// | bold       | font-bold       | FontWeight.w700 |
/// | extrabold  | font-extrabold  | FontWeight.w800 |
/// | black      | font-black      | FontWeight.w900 |
///
/// Usage:
/// ```dart
/// Text('Hi').fontWeight(TwFontWeights.semibold)
/// Text('Bold').fontWeight(TwFontWeights.bold)
/// ```
class TwFontWeights {
  TwFontWeights._();

  /// font-thin — 100
  static const FontWeight thin = FontWeight.w100;

  /// font-extralight — 200
  static const FontWeight extralight = FontWeight.w200;

  /// font-light — 300
  static const FontWeight light = FontWeight.w300;

  /// font-normal — 400 (default)
  static const FontWeight normal = FontWeight.w400;

  /// font-medium — 500
  static const FontWeight medium = FontWeight.w500;

  /// font-semibold — 600
  static const FontWeight semibold = FontWeight.w600;

  /// font-bold — 700
  static const FontWeight bold = FontWeight.w700;

  /// font-extrabold — 800
  static const FontWeight extrabold = FontWeight.w800;

  /// font-black — 900 (heaviest)
  static const FontWeight black = FontWeight.w900;

  /// All weight tokens ordered from lightest to heaviest.
  static const List<FontWeight> all = [
    thin, extralight, light, normal, medium, semibold, bold, extrabold, black,
  ];
}
