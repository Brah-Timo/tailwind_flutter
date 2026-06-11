import 'package:flutter/widgets.dart';
import 'tw_theme.dart';
import 'tw_theme_data.dart';
import '../tokens/tw_breakpoints.dart';

/// Convenience extensions on [BuildContext] for accessing [TwTheme] tokens
/// without the verbosity of [TwTheme.of].
///
/// ```dart
/// // Without extension
/// final color = TwTheme.of(context).colors.blue.shade500;
///
/// // With extension
/// final color = context.tw.colors.blue.shade500;
/// ```
extension TwContextExtension on BuildContext {
  // ─── Theme accessor ───────────────────────────────────────────────────────

  /// Returns the nearest [TwThemeData] from the widget tree.
  ///
  /// Equivalent to [TwTheme.of].
  ///
  /// ```dart
  /// final primaryColor = context.tw.colors.primary.shade500;
  /// final gap          = context.tw.spacing.s4.px;
  /// final radius       = context.tw.radii.lg.all;
  /// ```
  TwThemeData get tw => TwTheme.of(this);

  /// Returns the nearest [TwThemeData] or `null` — safe for optional use.
  TwThemeData? get twOrNull => TwTheme.maybeOf(this);

  // ─── Responsive helpers ───────────────────────────────────────────────────

  /// Returns the active [TwBreakpointLabel] based on the current screen width.
  ///
  /// ```dart
  /// if (context.breakpoint >= TwBreakpointLabel.md) { ... }
  /// ```
  TwBreakpointLabel get breakpoint => TwBreakpoints.of(this);

  /// Returns `true` if the screen width is below the `sm` breakpoint (mobile).
  bool get isMobile => TwBreakpoints.isMobile(this);

  /// Returns `true` if the screen width is at least `md` (tablet or larger).
  bool get isTablet => TwBreakpoints.isTablet(this);

  /// Returns `true` if the screen width is at least `lg` (desktop or larger).
  bool get isDesktop => TwBreakpoints.isDesktop(this);

  // ─── Dark mode ────────────────────────────────────────────────────────────

  /// Returns `true` when the active theme brightness is [Brightness.dark].
  bool get isDarkMode => MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  /// Returns `true` when the active theme brightness is [Brightness.light].
  bool get isLightMode => !isDarkMode;
}
