import 'package:flutter/widgets.dart';

/// A single spacing value that carries both its raw [px] amount and convenience
/// [EdgeInsets] getters for every direction.
///
/// All instances are `const` and allocated at compile-time.
class TwSpacingValue {
  /// The raw logical-pixel value.
  final double value;

  const TwSpacingValue(this.value);

  // ─── Raw access ───────────────────────────────────────────────────────────
  /// Alias for [value] — use wherever a plain `double` is needed.
  double get px => value;

  // ─── EdgeInsets getters ───────────────────────────────────────────────────
  /// Applies the spacing on all four sides.
  EdgeInsets get all => EdgeInsets.all(value);

  /// Applies the spacing horizontally (left + right).
  EdgeInsets get x => EdgeInsets.symmetric(horizontal: value);

  /// Applies the spacing vertically (top + bottom).
  EdgeInsets get y => EdgeInsets.symmetric(vertical: value);

  /// Applies the spacing to the top side only.
  EdgeInsets get top => EdgeInsets.only(top: value);

  /// Applies the spacing to the bottom side only.
  EdgeInsets get bottom => EdgeInsets.only(bottom: value);

  /// Applies the spacing to the left side only.
  EdgeInsets get left => EdgeInsets.only(left: value);

  /// Applies the spacing to the right side only.
  EdgeInsets get right => EdgeInsets.only(right: value);

  @override
  String toString() => 'TwSpacingValue(${value}px)';

  @override
  bool operator ==(Object other) =>
      other is TwSpacingValue && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

/// 35 spacing values matching Tailwind CSS v4's default spacing scale.
///
/// Each unit equals **4 logical pixels** (1 Tailwind spacing unit = 4 px).
///
/// ```
/// s0   →  0 px    (space-0)
/// s0_5 →  2 px    (space-0.5)
/// s1   →  4 px    (space-1)
/// s2   →  8 px    (space-2)
/// s4   → 16 px    (space-4)  ← most used
/// s6   → 24 px    (space-6)
/// s8   → 32 px    (space-8)
/// s96  → 384 px   (space-96)
/// ```
///
/// Usage:
/// ```dart
/// Text('Hello').p(TwSpacing.s4)   // padding: 16 px all sides
/// Text('Hello').px(TwSpacing.s6)  // padding: 24 px left/right
/// ```
class TwSpacing {
  TwSpacing._();

  static const TwSpacingValue s0 = TwSpacingValue(0.0); // space-0 → 0 px
  static const TwSpacingValue s0_5 = TwSpacingValue(2.0); // space-0.5 → 2 px
  static const TwSpacingValue s1 = TwSpacingValue(4.0); // space-1 → 4 px
  static const TwSpacingValue s1_5 = TwSpacingValue(6.0); // space-1.5 → 6 px
  static const TwSpacingValue s2 = TwSpacingValue(8.0); // space-2 → 8 px
  static const TwSpacingValue s2_5 = TwSpacingValue(10.0); // space-2.5 → 10 px
  static const TwSpacingValue s3 = TwSpacingValue(12.0); // space-3 → 12 px
  static const TwSpacingValue s3_5 = TwSpacingValue(14.0); // space-3.5 → 14 px
  static const TwSpacingValue s4 = TwSpacingValue(16.0); // space-4 → 16 px ⭐
  static const TwSpacingValue s5 = TwSpacingValue(20.0); // space-5 → 20 px
  static const TwSpacingValue s6 = TwSpacingValue(24.0); // space-6 → 24 px
  static const TwSpacingValue s7 = TwSpacingValue(28.0); // space-7 → 28 px
  static const TwSpacingValue s8 = TwSpacingValue(32.0); // space-8 → 32 px
  static const TwSpacingValue s9 = TwSpacingValue(36.0); // space-9 → 36 px
  static const TwSpacingValue s10 = TwSpacingValue(40.0); // space-10 → 40 px
  static const TwSpacingValue s11 = TwSpacingValue(44.0); // space-11 → 44 px
  static const TwSpacingValue s12 = TwSpacingValue(48.0); // space-12 → 48 px
  static const TwSpacingValue s14 = TwSpacingValue(56.0); // space-14 → 56 px
  static const TwSpacingValue s16 = TwSpacingValue(64.0); // space-16 → 64 px
  static const TwSpacingValue s20 = TwSpacingValue(80.0); // space-20 → 80 px
  static const TwSpacingValue s24 = TwSpacingValue(96.0); // space-24 → 96 px
  static const TwSpacingValue s28 = TwSpacingValue(112.0); // space-28 → 112 px
  static const TwSpacingValue s32 = TwSpacingValue(128.0); // space-32 → 128 px
  static const TwSpacingValue s36 = TwSpacingValue(144.0); // space-36 → 144 px
  static const TwSpacingValue s40 = TwSpacingValue(160.0); // space-40 → 160 px
  static const TwSpacingValue s44 = TwSpacingValue(176.0); // space-44 → 176 px
  static const TwSpacingValue s48 = TwSpacingValue(192.0); // space-48 → 192 px
  static const TwSpacingValue s52 = TwSpacingValue(208.0); // space-52 → 208 px
  static const TwSpacingValue s56 = TwSpacingValue(224.0); // space-56 → 224 px
  static const TwSpacingValue s60 = TwSpacingValue(240.0); // space-60 → 240 px
  static const TwSpacingValue s64 = TwSpacingValue(256.0); // space-64 → 256 px
  static const TwSpacingValue s72 = TwSpacingValue(288.0); // space-72 → 288 px
  static const TwSpacingValue s80 = TwSpacingValue(320.0); // space-80 → 320 px
  static const TwSpacingValue s96 = TwSpacingValue(384.0); // space-96 → 384 px

  /// All spacing values ordered from smallest to largest — useful for
  /// generating documentation or building spacing-scale visualisations.
  static const List<TwSpacingValue> all = [
    s0, s0_5, s1, s1_5, s2, s2_5, s3, s3_5, s4, s5,
    s6, s7, s8, s9, s10, s11, s12, s14, s16, s20,
    s24, s28, s32, s36, s40, s44, s48, s52, s56, s60,
    s64, s72, s80, s96,
  ];
}
