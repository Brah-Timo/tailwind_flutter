import 'package:flutter/widgets.dart';
import 'tw_theme_data.dart';

/// An [InheritedWidget] that injects a [TwThemeData] into the widget tree.
///
/// Wrap your app (or a subtree) with [TwTheme] to make design tokens
/// accessible anywhere via [TwTheme.of] or the `context.tw` extension:
///
/// ```dart
/// // In MaterialApp / CupertinoApp
/// MaterialApp(
///   home: TwTheme(
///     data: TwThemeData.light(),
///     child: MyHomePage(),
///   ),
/// )
/// ```
///
/// ### Adaptive (follows system brightness)
/// ```dart
/// Builder(
///   builder: (context) {
///     final brightness = MediaQuery.platformBrightnessOf(context);
///     return TwTheme(
///       data: TwThemeData.fromBrightness(brightness),
///       child: MyApp(),
///     );
///   },
/// )
/// ```
///
/// ### Reading values
/// ```dart
/// final tw  = TwTheme.of(context);
/// // or (with TwContextExtension imported):
/// final tw  = context.tw;
///
/// final primaryColor = tw.colors.primary.shade500;
/// final gap          = tw.spacing.s6;
/// final radius       = tw.radii.lg.all;
/// ```
class TwTheme extends InheritedWidget {
  /// The theme data injected into the subtree.
  final TwThemeData data;

  const TwTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Returns the nearest [TwThemeData] from the widget tree.
  ///
  /// Throws an [AssertionError] in debug mode if no [TwTheme] ancestor is
  /// found. In release mode it returns [TwThemeData.light()] as a safe default.
  static TwThemeData of(BuildContext context) {
    final tw = context.dependOnInheritedWidgetOfExactType<TwTheme>();
    assert(
      tw != null,
      'No TwTheme found in the widget tree.\n'
      'Wrap your app or a subtree with a TwTheme widget:\n\n'
      '  TwTheme(\n'
      '    data: TwThemeData.light(),\n'
      '    child: MyApp(),\n'
      '  )',
    );
    return tw?.data ?? TwThemeData.light();
  }

  /// Returns the nearest [TwThemeData] or `null` if no [TwTheme] is found.
  ///
  /// Prefer [of] — use this only in code that explicitly handles the
  /// no-theme case.
  static TwThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TwTheme>()?.data;

  @override
  bool updateShouldNotify(TwTheme oldWidget) => data != oldWidget.data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) =>
      'TwTheme(data: $data)';
}
