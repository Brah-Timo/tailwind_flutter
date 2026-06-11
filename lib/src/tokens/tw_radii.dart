import 'package:flutter/widgets.dart';

/// A border-radius token that carries a raw pixel value and convenience
/// [BorderRadius] getters for every corner combination.
class TwRadiiValue {
  /// The radius in logical pixels.
  final double value;

  const TwRadiiValue(this.value);

  // ─── BorderRadius convenience getters ─────────────────────────────────────
  /// Applies the radius to all four corners.
  BorderRadius get all => BorderRadius.circular(value);

  /// Applies the radius to the two top corners only.
  BorderRadius get top =>
      BorderRadius.vertical(top: Radius.circular(value));

  /// Applies the radius to the two bottom corners only.
  BorderRadius get bottom =>
      BorderRadius.vertical(bottom: Radius.circular(value));

  /// Applies the radius to the two left corners only.
  BorderRadius get left =>
      BorderRadius.horizontal(left: Radius.circular(value));

  /// Applies the radius to the two right corners only.
  BorderRadius get right =>
      BorderRadius.horizontal(right: Radius.circular(value));

  /// Top-left corner only.
  BorderRadius get topLeft =>
      BorderRadius.only(topLeft: Radius.circular(value));

  /// Top-right corner only.
  BorderRadius get topRight =>
      BorderRadius.only(topRight: Radius.circular(value));

  /// Bottom-left corner only.
  BorderRadius get bottomLeft =>
      BorderRadius.only(bottomLeft: Radius.circular(value));

  /// Bottom-right corner only.
  BorderRadius get bottomRight =>
      BorderRadius.only(bottomRight: Radius.circular(value));

  @override
  String toString() => 'TwRadiiValue(${value}px)';

  @override
  bool operator ==(Object other) =>
      other is TwRadiiValue && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

/// 10 border-radius tokens matching Tailwind CSS v4's `rounded-*` utilities.
///
/// | Token | CSS equivalent | Radius    |
/// |-------|----------------|-----------|
/// | none  | rounded-none   | 0 px      |
/// | sm    | rounded-sm     | 2 px      |
/// | base  | rounded        | 4 px      |
/// | md    | rounded-md     | 6 px      |
/// | lg    | rounded-lg     | 8 px  ⭐   |
/// | xl    | rounded-xl     | 12 px     |
/// | xl2   | rounded-2xl    | 16 px     |
/// | xl3   | rounded-3xl    | 24 px     |
/// | full  | rounded-full   | 9999 px   |
/// | inner | (inner element)| 2 px      |
///
/// Usage:
/// ```dart
/// widget.rounded(TwRadii.lg.value)          // all corners, 8 px
/// widget.rounded(TwRadii.xl2.value)         // all corners, 16 px
/// ClipRRect(borderRadius: TwRadii.xl.all)   // direct BorderRadius access
/// ```
class TwRadii {
  TwRadii._();

  /// rounded-none — 0 px (sharp corners)
  static const TwRadiiValue none = TwRadiiValue(0.0);

  /// rounded-sm — 2 px
  static const TwRadiiValue sm = TwRadiiValue(2.0);

  /// rounded — 4 px (Tailwind's default `rounded`)
  static const TwRadiiValue base = TwRadiiValue(4.0);

  /// rounded-md — 6 px
  static const TwRadiiValue md = TwRadiiValue(6.0);

  /// rounded-lg — 8 px ⭐ most used card radius
  static const TwRadiiValue lg = TwRadiiValue(8.0);

  /// rounded-xl — 12 px
  static const TwRadiiValue xl = TwRadiiValue(12.0);

  /// rounded-2xl — 16 px
  static const TwRadiiValue xl2 = TwRadiiValue(16.0);

  /// rounded-3xl — 24 px
  static const TwRadiiValue xl3 = TwRadiiValue(24.0);

  /// rounded-full — 9999 px (creates a perfect pill / circle)
  static const TwRadiiValue full = TwRadiiValue(9999.0);

  /// Inner radius (2 px) — useful for nested elements inside a rounded container
  /// to maintain visual consistency.
  static const TwRadiiValue inner = TwRadiiValue(2.0);

  /// All tokens ordered from sharpest to most rounded.
  static const List<TwRadiiValue> all = [
    none, sm, base, md, lg, xl, xl2, xl3, full,
  ];
}
