import 'package:flutter/material.dart';
import 'tw_theme_data.dart';
import '../tokens/tw_colors.dart';
import '../tokens/tw_spacing.dart';
import '../tokens/tw_radii.dart';
import '../tokens/tw_shadows.dart';

/// A [ThemeExtension] that exposes tailwind_flutter tokens directly inside
/// Flutter's native [ThemeData].
///
/// This allows you to use `Theme.of(context).extension<TwColorExtension>()`
/// in codebases that are already tightly coupled to Flutter's own theme system,
/// giving you a bridge between the two worlds.
///
/// ### Registration
/// ```dart
/// MaterialApp(
///   theme: ThemeData(
///     extensions: [
///       TwColorExtension.fromTokens(TwColorTokens()),
///       TwSpacingExtension.fromTokens(TwSpacingTokens()),
///       TwRadiiExtension.fromTokens(TwRadiiTokens()),
///       TwShadowExtension.fromTokens(TwShadowTokens()),
///     ],
///   ),
/// )
/// ```
///
/// ### Reading
/// ```dart
/// final colors  = Theme.of(context).extension<TwColorExtension>()!;
/// final primary = colors.primary.shade500;
/// ```

// ─────────────────────────────────────────────────────────────────────────────
// 1. Color extension
// ─────────────────────────────────────────────────────────────────────────────

/// Exposes the full Tailwind colour palette via [ThemeData.extensions].
class TwColorExtension extends ThemeExtension<TwColorExtension> {
  final TwColor slate;
  final TwColor gray;
  final TwColor blue;
  final TwColor indigo;
  final TwColor violet;
  final TwColor green;
  final TwColor red;
  final TwColor amber;
  final TwColor pink;
  final TwColor teal;
  final Color white;
  final Color black;
  final Color surface;
  final Color background;
  final TwColor primary;
  final TwColor error;
  final TwColor success;
  final TwColor warning;

  const TwColorExtension({
    required this.slate,
    required this.gray,
    required this.blue,
    required this.indigo,
    required this.violet,
    required this.green,
    required this.red,
    required this.amber,
    required this.pink,
    required this.teal,
    required this.white,
    required this.black,
    required this.surface,
    required this.background,
    required this.primary,
    required this.error,
    required this.success,
    required this.warning,
  });

  factory TwColorExtension.fromTokens(TwColorTokens tokens) => TwColorExtension(
        slate: tokens.slate,
        gray: tokens.gray,
        blue: tokens.blue,
        indigo: tokens.indigo,
        violet: tokens.violet,
        green: tokens.green,
        red: tokens.red,
        amber: tokens.amber,
        pink: tokens.pink,
        teal: tokens.teal,
        white: tokens.white,
        black: tokens.black,
        surface: tokens.surface,
        background: tokens.background,
        primary: tokens.primary,
        error: tokens.error,
        success: tokens.success,
        warning: tokens.warning,
      );

  /// Light-mode preset.
  factory TwColorExtension.light() =>
      TwColorExtension.fromTokens(const TwColorTokens());

  /// Dark-mode preset.
  factory TwColorExtension.dark() =>
      TwColorExtension.fromTokens(const TwColorTokens.dark());

  @override
  TwColorExtension copyWith({
    TwColor? slate,
    TwColor? gray,
    TwColor? blue,
    TwColor? indigo,
    TwColor? violet,
    TwColor? green,
    TwColor? red,
    TwColor? amber,
    TwColor? pink,
    TwColor? teal,
    Color? white,
    Color? black,
    Color? surface,
    Color? background,
    TwColor? primary,
    TwColor? error,
    TwColor? success,
    TwColor? warning,
  }) =>
      TwColorExtension(
        slate: slate ?? this.slate,
        gray: gray ?? this.gray,
        blue: blue ?? this.blue,
        indigo: indigo ?? this.indigo,
        violet: violet ?? this.violet,
        green: green ?? this.green,
        red: red ?? this.red,
        amber: amber ?? this.amber,
        pink: pink ?? this.pink,
        teal: teal ?? this.teal,
        white: white ?? this.white,
        black: black ?? this.black,
        surface: surface ?? this.surface,
        background: background ?? this.background,
        primary: primary ?? this.primary,
        error: error ?? this.error,
        success: success ?? this.success,
        warning: warning ?? this.warning,
      );

  @override
  TwColorExtension lerp(TwColorExtension? other, double t) {
    if (other == null) return this;
    return TwColorExtension(
      slate: t < 0.5 ? slate : other.slate,
      gray: t < 0.5 ? gray : other.gray,
      blue: t < 0.5 ? blue : other.blue,
      indigo: t < 0.5 ? indigo : other.indigo,
      violet: t < 0.5 ? violet : other.violet,
      green: t < 0.5 ? green : other.green,
      red: t < 0.5 ? red : other.red,
      amber: t < 0.5 ? amber : other.amber,
      pink: t < 0.5 ? pink : other.pink,
      teal: t < 0.5 ? teal : other.teal,
      white: Color.lerp(white, other.white, t) ?? white,
      black: Color.lerp(black, other.black, t) ?? black,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      background: Color.lerp(background, other.background, t) ?? background,
      primary: t < 0.5 ? primary : other.primary,
      error: t < 0.5 ? error : other.error,
      success: t < 0.5 ? success : other.success,
      warning: t < 0.5 ? warning : other.warning,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 2. Spacing extension
// ─────────────────────────────────────────────────────────────────────────────

/// Exposes Tailwind spacing tokens via [ThemeData.extensions].
class TwSpacingExtension extends ThemeExtension<TwSpacingExtension> {
  final TwSpacingValue s1;
  final TwSpacingValue s2;
  final TwSpacingValue s3;
  final TwSpacingValue s4;
  final TwSpacingValue s5;
  final TwSpacingValue s6;
  final TwSpacingValue s8;
  final TwSpacingValue s10;
  final TwSpacingValue s12;
  final TwSpacingValue s16;
  final TwSpacingValue s20;
  final TwSpacingValue s24;

  const TwSpacingExtension({
    this.s1 = TwSpacing.s1,
    this.s2 = TwSpacing.s2,
    this.s3 = TwSpacing.s3,
    this.s4 = TwSpacing.s4,
    this.s5 = TwSpacing.s5,
    this.s6 = TwSpacing.s6,
    this.s8 = TwSpacing.s8,
    this.s10 = TwSpacing.s10,
    this.s12 = TwSpacing.s12,
    this.s16 = TwSpacing.s16,
    this.s20 = TwSpacing.s20,
    this.s24 = TwSpacing.s24,
  });

  factory TwSpacingExtension.fromTokens(TwSpacingTokens tokens) =>
      TwSpacingExtension(
        s1: tokens.s1,
        s2: tokens.s2,
        s3: tokens.s3,
        s4: tokens.s4,
        s5: tokens.s5,
        s6: tokens.s6,
        s8: tokens.s8,
        s10: tokens.s10,
        s12: tokens.s12,
        s16: tokens.s16,
        s20: tokens.s20,
        s24: tokens.s24,
      );

  @override
  TwSpacingExtension copyWith({
    TwSpacingValue? s1, TwSpacingValue? s2, TwSpacingValue? s3,
    TwSpacingValue? s4, TwSpacingValue? s5, TwSpacingValue? s6,
    TwSpacingValue? s8, TwSpacingValue? s10, TwSpacingValue? s12,
    TwSpacingValue? s16, TwSpacingValue? s20, TwSpacingValue? s24,
  }) =>
      TwSpacingExtension(
        s1: s1 ?? this.s1, s2: s2 ?? this.s2, s3: s3 ?? this.s3,
        s4: s4 ?? this.s4, s5: s5 ?? this.s5, s6: s6 ?? this.s6,
        s8: s8 ?? this.s8, s10: s10 ?? this.s10, s12: s12 ?? this.s12,
        s16: s16 ?? this.s16, s20: s20 ?? this.s20, s24: s24 ?? this.s24,
      );

  @override
  TwSpacingExtension lerp(TwSpacingExtension? other, double t) => this;
}

// ─────────────────────────────────────────────────────────────────────────────
// 3. Radii extension
// ─────────────────────────────────────────────────────────────────────────────

/// Exposes Tailwind border-radius tokens via [ThemeData.extensions].
class TwRadiiExtension extends ThemeExtension<TwRadiiExtension> {
  final TwRadiiValue none;
  final TwRadiiValue sm;
  final TwRadiiValue base;
  final TwRadiiValue md;
  final TwRadiiValue lg;
  final TwRadiiValue xl;
  final TwRadiiValue xl2;
  final TwRadiiValue xl3;
  final TwRadiiValue full;

  const TwRadiiExtension({
    this.none = TwRadii.none,
    this.sm = TwRadii.sm,
    this.base = TwRadii.base,
    this.md = TwRadii.md,
    this.lg = TwRadii.lg,
    this.xl = TwRadii.xl,
    this.xl2 = TwRadii.xl2,
    this.xl3 = TwRadii.xl3,
    this.full = TwRadii.full,
  });

  factory TwRadiiExtension.fromTokens(TwRadiiTokens tokens) => TwRadiiExtension(
        none: tokens.none,
        sm: tokens.sm,
        base: tokens.base,
        md: tokens.md,
        lg: tokens.lg,
        xl: tokens.xl,
        xl2: tokens.xl2,
        xl3: tokens.xl3,
        full: tokens.full,
      );

  @override
  TwRadiiExtension copyWith({
    TwRadiiValue? none, TwRadiiValue? sm, TwRadiiValue? base,
    TwRadiiValue? md, TwRadiiValue? lg, TwRadiiValue? xl,
    TwRadiiValue? xl2, TwRadiiValue? xl3, TwRadiiValue? full,
  }) =>
      TwRadiiExtension(
        none: none ?? this.none, sm: sm ?? this.sm, base: base ?? this.base,
        md: md ?? this.md, lg: lg ?? this.lg, xl: xl ?? this.xl,
        xl2: xl2 ?? this.xl2, xl3: xl3 ?? this.xl3, full: full ?? this.full,
      );

  @override
  TwRadiiExtension lerp(TwRadiiExtension? other, double t) => this;
}

// ─────────────────────────────────────────────────────────────────────────────
// 4. Shadow extension
// ─────────────────────────────────────────────────────────────────────────────

/// Exposes Tailwind shadow tokens via [ThemeData.extensions].
class TwShadowExtension extends ThemeExtension<TwShadowExtension> {
  final List<BoxShadow> none;
  final List<BoxShadow> sm;
  final List<BoxShadow> base;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;
  final List<BoxShadow> xl;
  final List<BoxShadow> xl2;

  const TwShadowExtension({
    this.none = TwShadows.none,
    this.sm = TwShadows.sm,
    this.base = TwShadows.base,
    this.md = TwShadows.md,
    this.lg = TwShadows.lg,
    this.xl = TwShadows.xl,
    this.xl2 = TwShadows.xl2,
  });

  factory TwShadowExtension.fromTokens(TwShadowTokens tokens) =>
      TwShadowExtension(
        none: tokens.none,
        sm: tokens.sm,
        base: tokens.base,
        md: tokens.md,
        lg: tokens.lg,
        xl: tokens.xl,
        xl2: tokens.xl2,
      );

  @override
  TwShadowExtension copyWith({
    List<BoxShadow>? none, List<BoxShadow>? sm, List<BoxShadow>? base,
    List<BoxShadow>? md, List<BoxShadow>? lg, List<BoxShadow>? xl,
    List<BoxShadow>? xl2,
  }) =>
      TwShadowExtension(
        none: none ?? this.none, sm: sm ?? this.sm, base: base ?? this.base,
        md: md ?? this.md, lg: lg ?? this.lg, xl: xl ?? this.xl,
        xl2: xl2 ?? this.xl2,
      );

  @override
  TwShadowExtension lerp(TwShadowExtension? other, double t) => this;
}

// ─────────────────────────────────────────────────────────────────────────────
// Convenience helper
// ─────────────────────────────────────────────────────────────────────────────

/// A convenience method that returns all four Tailwind ThemeExtensions ready
/// to register in [ThemeData.extensions].
///
/// ```dart
/// ThemeData(extensions: TwThemeExtensions.all())
/// ThemeData(extensions: TwThemeExtensions.all(data: TwThemeData.dark()))
/// ```
class TwThemeExtensions {
  TwThemeExtensions._();

  /// Returns the full set of ThemeExtension instances for [data].
  static List<ThemeExtension<dynamic>> all({TwThemeData? data}) {
    final d = data ?? TwThemeData.light();
    return [
      TwColorExtension.fromTokens(d.colors),
      TwSpacingExtension.fromTokens(d.spacing),
      TwRadiiExtension.fromTokens(d.radii),
      TwShadowExtension.fromTokens(d.shadows),
    ];
  }
}
