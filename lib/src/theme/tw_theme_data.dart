import 'package:flutter/material.dart';
import '../tokens/tw_colors.dart';
import '../tokens/tw_spacing.dart';
import '../tokens/tw_font_sizes.dart';
import '../tokens/tw_font_weights.dart';
import '../tokens/tw_radii.dart';
import '../tokens/tw_shadows.dart';
import '../tokens/tw_opacity.dart';
import '../tokens/tw_breakpoints.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Token sub-classes
// ─────────────────────────────────────────────────────────────────────────────

/// Colour tokens exposed via the theme.
///
/// By default mirrors [TwColors] exactly. Override individual families to
/// implement a custom brand palette.
///
/// ```dart
/// TwThemeData.light(
///   colors: TwColorTokens(primary: TwColors.violet),
/// )
/// ```
class TwColorTokens {
  final TwColor slate;
  final TwColor gray;
  final TwColor zinc;
  final TwColor neutral;
  final TwColor stone;
  final TwColor red;
  final TwColor orange;
  final TwColor amber;
  final TwColor yellow;
  final TwColor lime;
  final TwColor green;
  final TwColor emerald;
  final TwColor teal;
  final TwColor cyan;
  final TwColor sky;
  final TwColor blue;
  final TwColor indigo;
  final TwColor violet;
  final TwColor purple;
  final TwColor fuchsia;
  final TwColor pink;
  final TwColor rose;
  final Color white;
  final Color black;
  final Color transparent;

  /// Surface colour — used as the default background for cards and panels.
  final Color surface;

  /// Background colour — used for the page / scaffold background.
  final Color background;

  /// Primary brand colour.
  final TwColor primary;

  /// Secondary brand colour.
  final TwColor secondary;

  /// Error colour.
  final TwColor error;

  /// Success colour.
  final TwColor success;

  /// Warning colour.
  final TwColor warning;

  const TwColorTokens({
    this.slate = TwColors.slate,
    this.gray = TwColors.gray,
    this.zinc = TwColors.zinc,
    this.neutral = TwColors.neutral,
    this.stone = TwColors.stone,
    this.red = TwColors.red,
    this.orange = TwColors.orange,
    this.amber = TwColors.amber,
    this.yellow = TwColors.yellow,
    this.lime = TwColors.lime,
    this.green = TwColors.green,
    this.emerald = TwColors.emerald,
    this.teal = TwColors.teal,
    this.cyan = TwColors.cyan,
    this.sky = TwColors.sky,
    this.blue = TwColors.blue,
    this.indigo = TwColors.indigo,
    this.violet = TwColors.violet,
    this.purple = TwColors.purple,
    this.fuchsia = TwColors.fuchsia,
    this.pink = TwColors.pink,
    this.rose = TwColors.rose,
    this.white = TwColors.white,
    this.black = TwColors.black,
    this.transparent = TwColors.transparent,
    this.surface = const Color(0xFFFFFFFF),
    this.background = const Color(0xFFF9FAFB), // gray-50
    this.primary = TwColors.blue,
    this.secondary = TwColors.indigo,
    this.error = TwColors.red,
    this.success = TwColors.green,
    this.warning = TwColors.amber,
  });

  /// Dark-mode defaults — surfaces use slate shades.
  const TwColorTokens.dark({
    this.slate = TwColors.slate,
    this.gray = TwColors.gray,
    this.zinc = TwColors.zinc,
    this.neutral = TwColors.neutral,
    this.stone = TwColors.stone,
    this.red = TwColors.red,
    this.orange = TwColors.orange,
    this.amber = TwColors.amber,
    this.yellow = TwColors.yellow,
    this.lime = TwColors.lime,
    this.green = TwColors.green,
    this.emerald = TwColors.emerald,
    this.teal = TwColors.teal,
    this.cyan = TwColors.cyan,
    this.sky = TwColors.sky,
    this.blue = TwColors.blue,
    this.indigo = TwColors.indigo,
    this.violet = TwColors.violet,
    this.purple = TwColors.purple,
    this.fuchsia = TwColors.fuchsia,
    this.pink = TwColors.pink,
    this.rose = TwColors.rose,
    this.white = TwColors.white,
    this.black = TwColors.black,
    this.transparent = TwColors.transparent,
    this.surface = const Color(0xFF1E293B), // slate-800
    this.background = const Color(0xFF0F172A), // slate-900
    this.primary = TwColors.blue,
    this.secondary = TwColors.indigo,
    this.error = TwColors.red,
    this.success = TwColors.green,
    this.warning = TwColors.amber,
  });
}

/// Spacing tokens — all 35 Tailwind spacing values.
class TwSpacingTokens {
  final TwSpacingValue s0;
  final TwSpacingValue s0_5;
  final TwSpacingValue s1;
  final TwSpacingValue s1_5;
  final TwSpacingValue s2;
  final TwSpacingValue s3;
  final TwSpacingValue s4;
  final TwSpacingValue s5;
  final TwSpacingValue s6;
  final TwSpacingValue s7;
  final TwSpacingValue s8;
  final TwSpacingValue s10;
  final TwSpacingValue s12;
  final TwSpacingValue s16;
  final TwSpacingValue s20;
  final TwSpacingValue s24;
  final TwSpacingValue s32;
  final TwSpacingValue s40;
  final TwSpacingValue s48;
  final TwSpacingValue s64;
  final TwSpacingValue s96;

  const TwSpacingTokens({
    this.s0 = TwSpacing.s0,
    this.s0_5 = TwSpacing.s0_5,
    this.s1 = TwSpacing.s1,
    this.s1_5 = TwSpacing.s1_5,
    this.s2 = TwSpacing.s2,
    this.s3 = TwSpacing.s3,
    this.s4 = TwSpacing.s4,
    this.s5 = TwSpacing.s5,
    this.s6 = TwSpacing.s6,
    this.s7 = TwSpacing.s7,
    this.s8 = TwSpacing.s8,
    this.s10 = TwSpacing.s10,
    this.s12 = TwSpacing.s12,
    this.s16 = TwSpacing.s16,
    this.s20 = TwSpacing.s20,
    this.s24 = TwSpacing.s24,
    this.s32 = TwSpacing.s32,
    this.s40 = TwSpacing.s40,
    this.s48 = TwSpacing.s48,
    this.s64 = TwSpacing.s64,
    this.s96 = TwSpacing.s96,
  });
}

/// Typography tokens — font sizes, weights.
class TwTypographyTokens {
  final TwFontSizeValue xs;
  final TwFontSizeValue sm;
  final TwFontSizeValue base;
  final TwFontSizeValue lg;
  final TwFontSizeValue xl;
  final TwFontSizeValue xl2;
  final TwFontSizeValue xl3;
  final TwFontSizeValue xl4;

  final FontWeight thin;
  final FontWeight light;
  final FontWeight normal;
  final FontWeight medium;
  final FontWeight semibold;
  final FontWeight bold;

  const TwTypographyTokens({
    this.xs = TwFontSizes.xs,
    this.sm = TwFontSizes.sm,
    this.base = TwFontSizes.base,
    this.lg = TwFontSizes.lg,
    this.xl = TwFontSizes.xl,
    this.xl2 = TwFontSizes.xl2,
    this.xl3 = TwFontSizes.xl3,
    this.xl4 = TwFontSizes.xl4,
    this.thin = TwFontWeights.thin,
    this.light = TwFontWeights.light,
    this.normal = TwFontWeights.normal,
    this.medium = TwFontWeights.medium,
    this.semibold = TwFontWeights.semibold,
    this.bold = TwFontWeights.bold,
  });
}

/// Shadow tokens.
class TwShadowTokens {
  final List<BoxShadow> none;
  final List<BoxShadow> sm;
  final List<BoxShadow> base;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;
  final List<BoxShadow> xl;
  final List<BoxShadow> xl2;

  const TwShadowTokens({
    this.none = TwShadows.none,
    this.sm = TwShadows.sm,
    this.base = TwShadows.base,
    this.md = TwShadows.md,
    this.lg = TwShadows.lg,
    this.xl = TwShadows.xl,
    this.xl2 = TwShadows.xl2,
  });

  /// In dark mode, reduce default shadows to avoid harsh contrast.
  const TwShadowTokens.dark({
    this.none = TwShadows.none,
    this.sm = TwShadows.none,
    this.base = TwShadows.sm,
    this.md = TwShadows.sm,
    this.lg = TwShadows.base,
    this.xl = TwShadows.md,
    this.xl2 = TwShadows.lg,
  });
}

/// Border-radius tokens.
class TwRadiiTokens {
  final TwRadiiValue none;
  final TwRadiiValue sm;
  final TwRadiiValue base;
  final TwRadiiValue md;
  final TwRadiiValue lg;
  final TwRadiiValue xl;
  final TwRadiiValue xl2;
  final TwRadiiValue xl3;
  final TwRadiiValue full;

  const TwRadiiTokens({
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
}

/// Opacity tokens.
class TwOpacityTokens {
  final double o0;
  final double o25;
  final double o50;
  final double o75;
  final double o100;

  const TwOpacityTokens({
    this.o0 = TwOpacity.o0,
    this.o25 = TwOpacity.o25,
    this.o50 = TwOpacity.o50,
    this.o75 = TwOpacity.o75,
    this.o100 = TwOpacity.o100,
  });
}

/// Breakpoint tokens.
class TwBreakpointTokens {
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xl2;

  const TwBreakpointTokens({
    this.sm = TwBreakpoints.sm,
    this.md = TwBreakpoints.md,
    this.lg = TwBreakpoints.lg,
    this.xl = TwBreakpoints.xl,
    this.xl2 = TwBreakpoints.xl2,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// TwThemeData
// ─────────────────────────────────────────────────────────────────────────────

/// Aggregates all design-token groups into one object that is injected into
/// the widget tree via [TwTheme].
///
/// ### Usage
/// ```dart
/// TwTheme(
///   data: TwThemeData.light(),
///   child: MyApp(),
/// )
/// ```
///
/// ### Custom override
/// ```dart
/// TwThemeData.light(
///   colors: TwColorTokens(primary: TwColors.violet),
/// )
/// ```
class TwThemeData {
  final TwColorTokens colors;
  final TwSpacingTokens spacing;
  final TwTypographyTokens typography;
  final TwShadowTokens shadows;
  final TwRadiiTokens radii;
  final TwOpacityTokens opacity;
  final TwBreakpointTokens breakpoints;

  const TwThemeData({
    required this.colors,
    required this.spacing,
    required this.typography,
    required this.shadows,
    required this.radii,
    required this.opacity,
    required this.breakpoints,
  });

  // ─── Presets ──────────────────────────────────────────────────────────────

  /// Creates a default light-mode theme using Tailwind v4 tokens.
  ///
  /// Pass custom token groups to override specific families:
  /// ```dart
  /// TwThemeData.light(colors: TwColorTokens(primary: TwColors.violet))
  /// ```
  factory TwThemeData.light({
    TwColorTokens? colors,
    TwSpacingTokens? spacing,
    TwTypographyTokens? typography,
    TwShadowTokens? shadows,
    TwRadiiTokens? radii,
    TwOpacityTokens? opacity,
    TwBreakpointTokens? breakpoints,
  }) =>
      TwThemeData(
        colors: colors ?? const TwColorTokens(),
        spacing: spacing ?? const TwSpacingTokens(),
        typography: typography ?? const TwTypographyTokens(),
        shadows: shadows ?? const TwShadowTokens(),
        radii: radii ?? const TwRadiiTokens(),
        opacity: opacity ?? const TwOpacityTokens(),
        breakpoints: breakpoints ?? const TwBreakpointTokens(),
      );

  /// Creates a default dark-mode theme with adjusted surface colours and
  /// softer shadows.
  factory TwThemeData.dark({
    TwColorTokens? colors,
    TwSpacingTokens? spacing,
    TwTypographyTokens? typography,
    TwShadowTokens? shadows,
    TwRadiiTokens? radii,
    TwOpacityTokens? opacity,
    TwBreakpointTokens? breakpoints,
  }) =>
      TwThemeData(
        colors: colors ?? const TwColorTokens.dark(),
        spacing: spacing ?? const TwSpacingTokens(),
        typography: typography ?? const TwTypographyTokens(),
        shadows: shadows ?? const TwShadowTokens.dark(),
        radii: radii ?? const TwRadiiTokens(),
        opacity: opacity ?? const TwOpacityTokens(),
        breakpoints: breakpoints ?? const TwBreakpointTokens(),
      );

  /// Resolves the appropriate preset based on the platform brightness.
  factory TwThemeData.fromBrightness(Brightness brightness) =>
      brightness == Brightness.dark
          ? TwThemeData.dark()
          : TwThemeData.light();

  @override
  String toString() =>
      'TwThemeData(surface: ${colors.surface}, background: ${colors.background})';
}
