/// 21 opacity steps matching Tailwind CSS v4's `opacity-*` utilities.
///
/// All values are compile-time `const double` in the range [0.0, 1.0].
///
/// | Token | CSS equivalent | Value |
/// |-------|----------------|-------|
/// | o0    | opacity-0      | 0.00  |
/// | o5    | opacity-5      | 0.05  |
/// | o10   | opacity-10     | 0.10  |
/// | o15   | opacity-15     | 0.15  |
/// | o20   | opacity-20     | 0.20  |
/// | o25   | opacity-25     | 0.25  |
/// | o30   | opacity-30     | 0.30  |
/// | o35   | opacity-35     | 0.35  |
/// | o40   | opacity-40     | 0.40  |
/// | o45   | opacity-45     | 0.45  |
/// | o50   | opacity-50     | 0.50  |
/// | o55   | opacity-55     | 0.55  |
/// | o60   | opacity-60     | 0.60  |
/// | o65   | opacity-65     | 0.65  |
/// | o70   | opacity-70     | 0.70  |
/// | o75   | opacity-75     | 0.75  |
/// | o80   | opacity-80     | 0.80  |
/// | o85   | opacity-85     | 0.85  |
/// | o90   | opacity-90     | 0.90  |
/// | o95   | opacity-95     | 0.95  |
/// | o100  | opacity-100    | 1.00  |
///
/// Usage:
/// ```dart
/// myWidget.opacity(TwOpacity.o50)  // 50 % transparent
/// myWidget.opacity(TwOpacity.o75)  // 75 % opaque
/// ```
class TwOpacity {
  TwOpacity._();

  /// opacity-0 — fully transparent.
  static const double o0 = 0.00;

  /// opacity-5
  static const double o5 = 0.05;

  /// opacity-10
  static const double o10 = 0.10;

  /// opacity-15
  static const double o15 = 0.15;

  /// opacity-20
  static const double o20 = 0.20;

  /// opacity-25
  static const double o25 = 0.25;

  /// opacity-30
  static const double o30 = 0.30;

  /// opacity-35
  static const double o35 = 0.35;

  /// opacity-40
  static const double o40 = 0.40;

  /// opacity-45
  static const double o45 = 0.45;

  /// opacity-50 — half transparent.
  static const double o50 = 0.50;

  /// opacity-55
  static const double o55 = 0.55;

  /// opacity-60
  static const double o60 = 0.60;

  /// opacity-65
  static const double o65 = 0.65;

  /// opacity-70
  static const double o70 = 0.70;

  /// opacity-75
  static const double o75 = 0.75;

  /// opacity-80
  static const double o80 = 0.80;

  /// opacity-85
  static const double o85 = 0.85;

  /// opacity-90
  static const double o90 = 0.90;

  /// opacity-95
  static const double o95 = 0.95;

  /// opacity-100 — fully opaque (default).
  static const double o100 = 1.00;

  /// All opacity values ordered from transparent to opaque.
  static const List<double> all = [
    o0, o5, o10, o15, o20, o25, o30, o35, o40, o45,
    o50, o55, o60, o65, o70, o75, o80, o85, o90, o95, o100,
  ];
}
