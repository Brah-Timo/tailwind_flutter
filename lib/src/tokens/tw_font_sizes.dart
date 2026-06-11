import 'package:flutter/widgets.dart';

/// A font-size token that bundles a size with its Tailwind-paired line-height.
///
/// Tailwind always couples a font size with a recommended line-height; this
/// class enforces that pairing so you never accidentally use the wrong
/// line-height with a given size.
///
/// The [textStyle] getter produces a ready-to-use [TextStyle] with the correct
/// `height` multiplier (`lineHeight / size`).
class TwFontSizeValue {
  /// The font size in logical pixels.
  final double size;

  /// The recommended line-height in logical pixels (matching Tailwind v4).
  final double lineHeight;

  const TwFontSizeValue(this.size, this.lineHeight);

  /// Returns a [TextStyle] with the correct [TextStyle.fontSize] and
  /// [TextStyle.height] (line-height multiplier) set.
  TextStyle get textStyle => TextStyle(
        fontSize: size,
        height: lineHeight / size,
      );

  @override
  String toString() => 'TwFontSizeValue(size: $size, lineHeight: $lineHeight)';

  @override
  bool operator ==(Object other) =>
      other is TwFontSizeValue &&
      other.size == size &&
      other.lineHeight == lineHeight;

  @override
  int get hashCode => Object.hash(size, lineHeight);
}

/// 13 font-size tokens matching Tailwind CSS v4's `text-*` utilities.
///
/// Every token bundles the font size **and** its recommended line-height,
/// matching Tailwind's exact values:
///
/// | Token  | CSS equivalent | size  | lineHeight |
/// |--------|----------------|-------|------------|
/// | xs     | text-xs        | 12 px | 16 px      |
/// | sm     | text-sm        | 14 px | 20 px      |
/// | base   | text-base      | 16 px | 24 px      |
/// | lg     | text-lg        | 18 px | 28 px      |
/// | xl     | text-xl        | 20 px | 28 px      |
/// | xl2    | text-2xl       | 24 px | 32 px      |
/// | xl3    | text-3xl       | 30 px | 36 px      |
/// | xl4    | text-4xl       | 36 px | 40 px      |
/// | xl5    | text-5xl       | 48 px | 48 px      |
/// | xl6    | text-6xl       | 60 px | 60 px      |
/// | xl7    | text-7xl       | 72 px | 72 px      |
/// | xl8    | text-8xl       | 96 px | 96 px      |
/// | xl9    | text-9xl       |128 px |128 px      |
///
/// Usage:
/// ```dart
/// Text('Hello').fontSize(TwFontSizes.lg)
/// Text('Title').fontSize(TwFontSizes.xl3)
/// ```
class TwFontSizes {
  TwFontSizes._();

  /// text-xs — 12 px / line-height 16 px
  static const TwFontSizeValue xs = TwFontSizeValue(12.0, 16.0);

  /// text-sm — 14 px / line-height 20 px
  static const TwFontSizeValue sm = TwFontSizeValue(14.0, 20.0);

  /// text-base — 16 px / line-height 24 px
  static const TwFontSizeValue base = TwFontSizeValue(16.0, 24.0);

  /// text-lg — 18 px / line-height 28 px ⭐ most used heading size
  static const TwFontSizeValue lg = TwFontSizeValue(18.0, 28.0);

  /// text-xl — 20 px / line-height 28 px
  static const TwFontSizeValue xl = TwFontSizeValue(20.0, 28.0);

  /// text-2xl — 24 px / line-height 32 px
  static const TwFontSizeValue xl2 = TwFontSizeValue(24.0, 32.0);

  /// text-3xl — 30 px / line-height 36 px
  static const TwFontSizeValue xl3 = TwFontSizeValue(30.0, 36.0);

  /// text-4xl — 36 px / line-height 40 px
  static const TwFontSizeValue xl4 = TwFontSizeValue(36.0, 40.0);

  /// text-5xl — 48 px / line-height 1 (tight)
  static const TwFontSizeValue xl5 = TwFontSizeValue(48.0, 48.0);

  /// text-6xl — 60 px / line-height 1
  static const TwFontSizeValue xl6 = TwFontSizeValue(60.0, 60.0);

  /// text-7xl — 72 px / line-height 1
  static const TwFontSizeValue xl7 = TwFontSizeValue(72.0, 72.0);

  /// text-8xl — 96 px / line-height 1
  static const TwFontSizeValue xl8 = TwFontSizeValue(96.0, 96.0);

  /// text-9xl — 128 px / line-height 1
  static const TwFontSizeValue xl9 = TwFontSizeValue(128.0, 128.0);

  /// All font-size tokens ordered from smallest to largest.
  static const List<TwFontSizeValue> all = [
    xs, sm, base, lg, xl, xl2, xl3, xl4, xl5, xl6, xl7, xl8, xl9,
  ];
}
