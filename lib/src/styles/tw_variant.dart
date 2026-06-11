/// Variants control which version of a [TwStyle] is applied based on runtime
/// conditions such as colour-scheme (light / dark).
///
/// You declare variant-specific overrides inside [TwStyle.variants]:
/// ```dart
/// const cardStyle = TwStyle(
///   backgroundColor: Color(0xFFFFFFFF),
///   variants: {
///     TwVariant.dark: TwStyle(
///       backgroundColor: Color(0xFF1E293B),
///     ),
///   },
/// );
/// ```
///
/// Then resolve at build time with [TwStyle.resolve]:
/// ```dart
/// cardStyle.resolve(context).apply(child: myWidget)
/// ```
///
/// ### Roadmap
/// Future versions will extend this enum with interactive variants:
/// `hover`, `focus`, `disabled`, `pressed`, `selected`.
enum TwVariant {
  /// The default light-mode style — applied when [Brightness.light] is active.
  light,

  /// Dark-mode overrides — applied when [Brightness.dark] is active.
  ///
  /// Equivalent to Tailwind's `dark:` modifier:
  /// ```css
  /// /* Tailwind */
  /// bg-white dark:bg-slate-800
  /// ```
  ///
  /// ```dart
  /// // tailwind_ui_flutter
  /// const TwStyle(
  ///   backgroundColor: Color(0xFFFFFFFF),        // bg-white
  ///   variants: {
  ///     TwVariant.dark: TwStyle(
  ///       backgroundColor: Color(0xFF1E293B),     // dark:bg-slate-800
  ///     ),
  ///   },
  /// )
  /// ```
  dark,
}
