import 'tw_style.dart';

/// Utility functions for merging and composing multiple [TwStyle] objects.
///
/// While [TwStyle.merge] handles pairwise merging, this class provides
/// helpers for working with lists of styles (inspired by how you chain
/// multiple Tailwind classes on a single element).
///
/// ```dart
/// // Merge a list of styles — later styles win
/// final result = TwStyleMerger.mergeAll([
///   TwStyle.card,
///   activeStyle,
///   if (isPrimary) primaryOverride,
/// ]);
/// ```
class TwStyleMerger {
  TwStyleMerger._();

  /// Merges a list of [styles] left-to-right: each subsequent style's
  /// non-null properties overwrite those from the previous ones.
  ///
  /// Returns [TwStyle.empty] when [styles] is empty.
  ///
  /// ```dart
  /// TwStyleMerger.mergeAll([base, hover, active])
  /// ```
  static TwStyle mergeAll(List<TwStyle> styles) {
    if (styles.isEmpty) return const TwStyle();
    var result = styles.first;
    for (var i = 1; i < styles.length; i++) {
      result = result.merge(styles[i]);
    }
    return result;
  }

  /// Conditionally applies [override] on top of [base] when [condition] is
  /// `true`. Returns [base] unchanged otherwise.
  ///
  /// ```dart
  /// final style = TwStyleMerger.when(
  ///   base: TwStyle.card,
  ///   condition: isSelected,
  ///   override: TwStyle(backgroundColor: TwColors.blue.shade50),
  /// );
  /// ```
  static TwStyle when({
    required TwStyle base,
    required bool condition,
    required TwStyle override,
  }) =>
      condition ? base.merge(override) : base;

  /// Applies the style at [index] from [styles] (clamped to valid range) on
  /// top of [base]. Useful for step-based styling (e.g. severity levels).
  ///
  /// ```dart
  /// final severities = [warnStyle, errorStyle, criticalStyle];
  /// final current = TwStyleMerger.atIndex(base, severities, level);
  /// ```
  static TwStyle atIndex(TwStyle base, List<TwStyle> styles, int index) {
    if (styles.isEmpty) return base;
    final i = index.clamp(0, styles.length - 1);
    return base.merge(styles[i]);
  }
}

/// Extension on `List<TwStyle>` for fluent merge operations.
extension TwStyleListExtension on List<TwStyle> {
  /// Merges all styles in this list into one — left-to-right, later wins.
  TwStyle merge() => TwStyleMerger.mergeAll(this);
}
