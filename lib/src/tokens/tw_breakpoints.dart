import 'package:flutter/widgets.dart';

/// 5 responsive breakpoints matching Tailwind CSS v4's default screen sizes.
///
/// | Token | CSS prefix | Width      |
/// |-------|------------|------------|
/// | sm    | sm:        | ≥ 640 px   |
/// | md    | md:        | ≥ 768 px   |
/// | lg    | lg:        | ≥ 1024 px  |
/// | xl    | xl:        | ≥ 1280 px  |
/// | xl2   | 2xl:       | ≥ 1536 px  |
///
/// ### Usage patterns
///
/// **Inline responsive layout:**
/// ```dart
/// LayoutBuilder(
///   builder: (context, constraints) {
///     final width = constraints.maxWidth;
///     return myWidget
///       .px(width >= TwBreakpoints.md ? TwSpacing.s8 : TwSpacing.s4);
///   },
/// )
/// ```
///
/// **MediaQuery-based check:**
/// ```dart
/// final isDesktop = MediaQuery.of(context).size.width >= TwBreakpoints.lg;
/// ```
///
/// **TwBreakpoints.of() helper:**
/// ```dart
/// final bp = TwBreakpoints.of(context);
/// if (bp == TwBreakpointLabel.lg) { /* desktop layout */ }
/// ```
class TwBreakpoints {
  TwBreakpoints._();

  /// sm: — small screens ≥ 640 px
  static const double sm = 640.0;

  /// md: — medium screens ≥ 768 px
  static const double md = 768.0;

  /// lg: — large screens ≥ 1024 px
  static const double lg = 1024.0;

  /// xl: — extra-large screens ≥ 1280 px
  static const double xl = 1280.0;

  /// 2xl: — 2× extra-large screens ≥ 1536 px
  static const double xl2 = 1536.0;

  /// Returns the [TwBreakpointLabel] for the given [width].
  ///
  /// Matches Tailwind's mobile-first approach: the label returned is the
  /// largest breakpoint whose threshold the width meets or exceeds.
  static TwBreakpointLabel labelForWidth(double width) {
    if (width >= xl2) return TwBreakpointLabel.xl2;
    if (width >= xl) return TwBreakpointLabel.xl;
    if (width >= lg) return TwBreakpointLabel.lg;
    if (width >= md) return TwBreakpointLabel.md;
    if (width >= sm) return TwBreakpointLabel.sm;
    return TwBreakpointLabel.xs;
  }

  /// Convenience helper — reads [MediaQuery] width from [context] and returns
  /// the current [TwBreakpointLabel].
  static TwBreakpointLabel of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return labelForWidth(width);
  }

  /// Returns `true` if the current screen width is at least [breakpoint].
  static bool isAtLeast(BuildContext context, double breakpoint) {
    return MediaQuery.of(context).size.width >= breakpoint;
  }

  /// Returns `true` if the current screen is considered "mobile" (below [sm]).
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < sm;

  /// Returns `true` if the current screen is at least tablet width (≥ [md]).
  static bool isTablet(BuildContext context) => isAtLeast(context, md);

  /// Returns `true` if the current screen is at least desktop width (≥ [lg]).
  static bool isDesktop(BuildContext context) => isAtLeast(context, lg);
}

/// Enum representing the current active Tailwind breakpoint label.
enum TwBreakpointLabel {
  /// Below sm threshold — mobile-first default.
  xs,

  /// sm: ≥ 640 px
  sm,

  /// md: ≥ 768 px
  md,

  /// lg: ≥ 1024 px
  lg,

  /// xl: ≥ 1280 px
  xl,

  /// 2xl: ≥ 1536 px
  xl2,
}
