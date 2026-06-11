import 'package:flutter/material.dart';
import 'tw_variant.dart';

/// A reusable, composable style object — the Flutter equivalent of a CSS class.
///
/// Instead of repeating the same chain of `.p().bg().rounded().shadow()` across
/// your codebase, define a `TwStyle` once and [apply] it anywhere:
///
/// ```dart
/// // Define once (at the top of a file or in a theme constants file)
/// const cardStyle = TwStyle(
///   padding:         EdgeInsets.all(16),       // p-4
///   backgroundColor: Color(0xFFFFFFFF),         // bg-white
///   borderRadius:    BorderRadius.all(Radius.circular(8)), // rounded-lg
///   shadows:         TwShadows.md,
/// );
///
/// // Apply anywhere
/// cardStyle.apply(child: Text('Hello'))
/// ```
///
/// ### Merging
/// Combine two styles with [merge] — the right-hand style wins for every
/// non-null property:
///
/// ```dart
/// final featuredCard = cardStyle.merge(TwStyle(
///   backgroundColor: TwColors.blue.shade50,
///   shadows:         TwShadows.lg,
/// ));
/// ```
///
/// ### Dark mode
/// Declare dark-mode overrides inside [variants] and resolve at build-time:
///
/// ```dart
/// const themedCard = TwStyle(
///   backgroundColor: Color(0xFFFFFFFF),
///   variants: {
///     TwVariant.dark: TwStyle(backgroundColor: Color(0xFF1E293B)),
///   },
/// );
///
/// // In build()
/// themedCard.resolve(context).apply(child: myWidget)
/// ```
///
/// ### Performance note
/// [apply] tries to combine `backgroundColor`, `borderRadius`, `shadows`, and
/// `border` into a **single** [DecoratedBox], reducing widget-tree depth
/// compared to chaining individual extensions.
class TwStyle {
  // ─── Layout ───────────────────────────────────────────────────────────────
  /// Padding applied inside the widget — Tailwind `p-*`.
  final EdgeInsetsGeometry? padding;

  /// Margin applied outside the widget — Tailwind `m-*`.
  final EdgeInsetsGeometry? margin;

  // ─── Background ───────────────────────────────────────────────────────────
  /// Solid fill colour — Tailwind `bg-{color}`.
  final Color? backgroundColor;

  /// Gradient fill — Tailwind `bg-gradient-to-*`.
  /// Takes precedence over [backgroundColor] when set.
  final Gradient? backgroundGradient;

  // ─── Shape ────────────────────────────────────────────────────────────────
  /// Corner rounding — Tailwind `rounded-*`.
  final BorderRadiusGeometry? borderRadius;

  // ─── Elevation ────────────────────────────────────────────────────────────
  /// Box shadows — Tailwind `shadow-*`.
  final List<BoxShadow>? shadows;

  // ─── Border ───────────────────────────────────────────────────────────────
  /// Full [BoxBorder] — use [Border.all] or asymmetric borders.
  final BoxBorder? border;

  // ─── Opacity ──────────────────────────────────────────────────────────────
  /// Widget-level opacity in [0.0, 1.0] — Tailwind `opacity-*`.
  final double? opacity;

  // ─── Sizing ───────────────────────────────────────────────────────────────
  /// Fixed width in logical pixels — Tailwind `w-*`.
  final double? width;

  /// Fixed height in logical pixels — Tailwind `h-*`.
  final double? height;

  // ─── Typography ───────────────────────────────────────────────────────────
  /// Text style applied when [child] is a [Text] widget.
  final TextStyle? textStyle;

  // ─── Responsive / Variant overrides ──────────────────────────────────────
  /// Per-variant style overrides merged with [resolve].
  ///
  /// ```dart
  /// variants: {
  ///   TwVariant.dark: TwStyle(backgroundColor: Color(0xFF1E293B)),
  /// }
  /// ```
  final Map<TwVariant, TwStyle>? variants;

  // ─── Constructor ──────────────────────────────────────────────────────────
  const TwStyle({
    this.padding,
    this.margin,
    this.backgroundColor,
    this.backgroundGradient,
    this.borderRadius,
    this.shadows,
    this.border,
    this.opacity,
    this.width,
    this.height,
    this.textStyle,
    this.variants,
  });

  // ─── Merge ────────────────────────────────────────────────────────────────
  /// Returns a new [TwStyle] that is the result of merging [this] with
  /// [other]. Every non-null property in [other] overwrites the corresponding
  /// property in [this] — a CSS specificity-style "right wins" merge.
  ///
  /// ```dart
  /// final result = base.merge(override);
  /// ```
  TwStyle merge(TwStyle other) => TwStyle(
        padding: other.padding ?? padding,
        margin: other.margin ?? margin,
        backgroundColor: other.backgroundColor ?? backgroundColor,
        backgroundGradient: other.backgroundGradient ?? backgroundGradient,
        borderRadius: other.borderRadius ?? borderRadius,
        shadows: other.shadows ?? shadows,
        border: other.border ?? border,
        opacity: other.opacity ?? opacity,
        width: other.width ?? width,
        height: other.height ?? height,
        textStyle: other.textStyle != null
            ? (textStyle?.merge(other.textStyle!) ?? other.textStyle)
            : textStyle,
        variants: other.variants ?? variants,
      );

  // ─── Resolve ──────────────────────────────────────────────────────────────
  /// Resolves the active variant for [context] and returns a flattened style.
  ///
  /// Currently detects `Brightness.dark` via `Theme.of(context).brightness`
  /// and merges [TwVariant.dark] when applicable.
  ///
  /// ```dart
  /// cardStyle.resolve(context).apply(child: myWidget)
  /// ```
  TwStyle resolve(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (variants != null) {
      if (brightness == Brightness.dark) {
        final darkOverride = variants![TwVariant.dark];
        if (darkOverride != null) return merge(darkOverride);
      } else {
        final lightOverride = variants![TwVariant.light];
        if (lightOverride != null) return merge(lightOverride);
      }
    }
    return this;
  }

  // ─── Apply ────────────────────────────────────────────────────────────────
  /// Wraps [child] in the widget layers required to apply this style.
  ///
  /// The implementation combines `backgroundColor`, `borderRadius`,
  /// `shadows`, and `border` into **a single [DecoratedBox]** for optimal
  /// performance — fewer widget layers than chaining individual extensions.
  ///
  /// Layer order (inside → outside):
  /// 1. Text style (merged onto [Text] directly, no extra widget)
  /// 2. `DecoratedBox` (bg, gradient, shadow, border)
  /// 3. `ClipRRect` (borderRadius clipping — only if borderRadius is set)
  /// 4. `Padding`
  /// 5. `Opacity`
  /// 6. `SizedBox` (width / height)
  /// 7. `Container` (margin)
  Widget apply({required Widget child}) {
    Widget result = child;

    // 1. Inject textStyle into Text widget directly (no extra layer).
    if (textStyle != null && result is Text) {
      final existingStyle = result.style;
      result = Text(
        result.data ?? '',
        key: result.key,
        style: existingStyle != null
            ? existingStyle.merge(textStyle!)
            : textStyle,
        textAlign: result.textAlign,
        overflow: result.overflow,
        maxLines: result.maxLines,
        textDirection: result.textDirection,
        locale: result.locale,
        softWrap: result.softWrap,
        textScaler: result.textScaler,
        semanticsLabel: result.semanticsLabel,
        textWidthBasis: result.textWidthBasis,
        textHeightBehavior: result.textHeightBehavior,
        selectionColor: result.selectionColor,
      );
    }

    // 2. Single DecoratedBox for bg + gradient + shadow + border.
    final bool hasDecoration = backgroundColor != null ||
        backgroundGradient != null ||
        (shadows != null && shadows!.isNotEmpty) ||
        border != null;

    if (hasDecoration) {
      result = DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundGradient == null ? backgroundColor : null,
          gradient: backgroundGradient,
          borderRadius: borderRadius is BorderRadius
              ? borderRadius as BorderRadius
              : null,
          boxShadow: shadows,
          border: border,
        ),
        child: result,
      );
    }

    // 3. ClipRRect for border-radius clipping.
    if (borderRadius != null) {
      result = ClipRRect(
        borderRadius: borderRadius!,
        child: result,
      );
    }

    // 4. Padding.
    if (padding != null) {
      result = Padding(padding: padding!, child: result);
    }

    // 5. Opacity.
    if (opacity != null) {
      result = Opacity(opacity: opacity!.clamp(0.0, 1.0), child: result);
    }

    // 6. Sized box.
    if (width != null || height != null) {
      result = SizedBox(width: width, height: height, child: result);
    }

    // 7. Margin (uses Container because SizedBox has no margin param).
    if (margin != null) {
      result = Container(margin: margin, child: result);
    }

    return result;
  }

  // ─── copyWith ─────────────────────────────────────────────────────────────
  /// Creates a copy of this style with the given fields replaced.
  TwStyle copyWith({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    Gradient? backgroundGradient,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? shadows,
    BoxBorder? border,
    double? opacity,
    double? width,
    double? height,
    TextStyle? textStyle,
    Map<TwVariant, TwStyle>? variants,
  }) =>
      TwStyle(
        padding: padding ?? this.padding,
        margin: margin ?? this.margin,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        backgroundGradient: backgroundGradient ?? this.backgroundGradient,
        borderRadius: borderRadius ?? this.borderRadius,
        shadows: shadows ?? this.shadows,
        border: border ?? this.border,
        opacity: opacity ?? this.opacity,
        width: width ?? this.width,
        height: height ?? this.height,
        textStyle: textStyle ?? this.textStyle,
        variants: variants ?? this.variants,
      );

  // ─── Factory constructors (common presets) ────────────────────────────────

  /// A clean white card with rounded-lg corners and a medium shadow.
  static const TwStyle card = TwStyle(
    padding: EdgeInsets.all(16),
    backgroundColor: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    shadows: [
      BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -1, offset: Offset(0, 4)),
      BoxShadow(color: Color(0x1A000000), blurRadius: 4, spreadRadius: -2, offset: Offset(0, 2)),
    ],
    border: Border.fromBorderSide(
      BorderSide(color: Color(0xFFE5E7EB), width: 1),
    ),
  );

  /// A minimal ghost-style card with only a border.
  static const TwStyle ghost = TwStyle(
    padding: EdgeInsets.all(16),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    border: Border.fromBorderSide(
      BorderSide(color: Color(0xFFE5E7EB), width: 1),
    ),
  );

  /// A flat badge — small, rounded-full, no shadow.
  static const TwStyle badge = TwStyle(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    borderRadius: BorderRadius.all(Radius.circular(9999)),
  );

  // ─── Equality ─────────────────────────────────────────────────────────────
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TwStyle &&
        other.padding == padding &&
        other.margin == margin &&
        other.backgroundColor == backgroundColor &&
        other.backgroundGradient == backgroundGradient &&
        other.borderRadius == borderRadius &&
        other.shadows == shadows &&
        other.border == border &&
        other.opacity == opacity &&
        other.width == width &&
        other.height == height &&
        other.textStyle == textStyle;
  }

  @override
  int get hashCode => Object.hash(
        padding, margin, backgroundColor, backgroundGradient,
        borderRadius, shadows, border, opacity, width, height, textStyle,
      );

  @override
  String toString() => 'TwStyle('
      'padding: $padding, '
      'backgroundColor: $backgroundColor, '
      'borderRadius: $borderRadius, '
      'shadows: ${shadows?.length ?? 0} shadows'
      ')';
}
