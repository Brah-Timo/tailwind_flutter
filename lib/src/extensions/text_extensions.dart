import 'package:flutter/material.dart';
import '../tokens/tw_font_sizes.dart';
import '../tokens/tw_font_weights.dart';
// ignore: unused_import — imported for dartdoc cross-reference only
import 'widget_extensions.dart' show TwWidgetExtensions;

/// Utility-first extension methods on [Text], mirroring Tailwind's typography
/// utilities (`text-*`, `font-*`, `uppercase`, `underline`, etc.).
///
/// All methods return a **new** [Text] widget preserving every property from
/// the original (key, textAlign, overflow, maxLines…) — none are discarded.
///
/// ### Important: Order rule
/// Apply ALL [TwTextExtensions] **before** any [TwWidgetExtensions].
/// Once you call a widget-level extension (`.p()`, `.bg()`, etc.), the
/// expression type becomes `Widget` and text-specific methods are gone.
///
/// ```dart
/// // ✅ correct
/// Text('Hello')
///   .bold()
///   .fontSize(TwFontSizes.lg)
///   .textColor(TwColors.blue.shade600)
///   .p(TwSpacing.s4)              // pivot to Widget extensions
///   .bg(TwColors.blue.shade50)
///
/// // ❌ wrong
/// Text('Hello').p(TwSpacing.s4).bold()  // compile error
/// ```
extension TwTextExtensions on Text {
  // ══════════════════════════════════════════════════════════════════════════
  // FONT WEIGHT
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets `FontWeight.bold` — Tailwind `font-bold`.
  Text bold() => _copyWith(fontWeight: TwFontWeights.bold);

  /// Sets `FontWeight.w600` — Tailwind `font-semibold`.
  Text semibold() => _copyWith(fontWeight: TwFontWeights.semibold);

  /// Sets `FontWeight.w500` — Tailwind `font-medium`.
  Text medium() => _copyWith(fontWeight: TwFontWeights.medium);

  /// Sets `FontWeight.w300` — Tailwind `font-light`.
  Text light() => _copyWith(fontWeight: TwFontWeights.light);

  /// Sets `FontWeight.w100` — Tailwind `font-thin`.
  Text thin() => _copyWith(fontWeight: TwFontWeights.thin);

  /// Sets `FontWeight.w800` — Tailwind `font-extrabold`.
  Text extrabold() => _copyWith(fontWeight: TwFontWeights.extrabold);

  /// Sets `FontWeight.w900` — Tailwind `font-black`.
  Text black() => _copyWith(fontWeight: TwFontWeights.black);

  /// Sets an arbitrary [FontWeight] — Tailwind `font-{weight}`.
  ///
  /// ```dart
  /// Text('Hi').fontWeight(TwFontWeights.semibold)
  /// ```
  Text fontWeight(FontWeight weight) => _copyWith(fontWeight: weight);

  // ══════════════════════════════════════════════════════════════════════════
  // FONT SIZE
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets the font size **and** the correct paired line-height from a
  /// [TwFontSizeValue] token — Tailwind `text-{size}`.
  ///
  /// ```dart
  /// Text('Title').fontSize(TwFontSizes.xl3)   // 30 px / lh 36 px
  /// ```
  Text fontSize(TwFontSizeValue size) => _copyWith(
        fontSize: size.size,
        height: size.lineHeight / size.size,
      );

  /// Sets an arbitrary font size in logical pixels.
  ///
  /// Prefer [fontSize] with a [TwFontSizeValue] for Tailwind parity.
  Text textSize(double size) => _copyWith(fontSize: size);

  // ══════════════════════════════════════════════════════════════════════════
  // COLOR
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets the text colour — Tailwind `text-{color}-{shade}`.
  ///
  /// ```dart
  /// Text('Hello').textColor(TwColors.slate.shade700)
  /// Text('Link').textColor(TwColors.blue.shade600)
  /// ```
  Text textColor(Color color) => _copyWith(color: color);

  // ══════════════════════════════════════════════════════════════════════════
  // FONT FAMILY
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets the font family — Tailwind `font-{family}`.
  ///
  /// ```dart
  /// Text('Code').fontFamily('Courier New')
  /// Text('Body').fontFamily('Inter')
  /// ```
  Text fontFamily(String family) => _copyWith(fontFamily: family);

  // ══════════════════════════════════════════════════════════════════════════
  // FONT STYLE
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets italic style — Tailwind `italic`.
  Text italic() => _copyWith(fontStyle: FontStyle.italic);

  /// Removes italic style — Tailwind `not-italic`.
  Text notItalic() => _copyWith(fontStyle: FontStyle.normal);

  // ══════════════════════════════════════════════════════════════════════════
  // TEXT DECORATION
  // ══════════════════════════════════════════════════════════════════════════

  /// Adds an underline — Tailwind `underline`.
  Text underline() => _copyWith(decoration: TextDecoration.underline);

  /// Adds a line-through — Tailwind `line-through`.
  Text lineThrough() => _copyWith(decoration: TextDecoration.lineThrough);

  /// Adds an overline — Tailwind `overline`.
  Text overline() => _copyWith(decoration: TextDecoration.overline);

  /// Removes all text decoration — Tailwind `no-underline`.
  Text noDecoration() => _copyWith(decoration: TextDecoration.none);

  // ══════════════════════════════════════════════════════════════════════════
  // LETTER SPACING
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets the letter spacing in logical pixels — Tailwind `tracking-{size}`.
  ///
  /// Tailwind reference:
  /// - `tracking-tighter` → -0.05em ≈ -0.8 px at base size
  /// - `tracking-tight`   → -0.025em ≈ -0.4 px
  /// - `tracking-normal`  → 0
  /// - `tracking-wide`    → 0.025em ≈ 0.4 px
  /// - `tracking-wider`   → 0.05em ≈ 0.8 px
  /// - `tracking-widest`  → 0.1em ≈ 1.6 px
  Text letterSpacing(double spacing) => _copyWith(letterSpacing: spacing);

  // ══════════════════════════════════════════════════════════════════════════
  // LINE HEIGHT
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets the line-height multiplier — Tailwind `leading-{size}`.
  ///
  /// In Flutter, [TextStyle.height] is a multiplier relative to the font size.
  /// For example `height: 1.5` with a 16 px font gives 24 px line height.
  Text lineHeight(double height) => _copyWith(height: height);

  // ══════════════════════════════════════════════════════════════════════════
  // TEXT TRANSFORM
  // ══════════════════════════════════════════════════════════════════════════

  /// Transforms all characters to uppercase — Tailwind `uppercase`.
  Text uppercase() => _rebuild(data!.toUpperCase());

  /// Transforms all characters to lowercase — Tailwind `lowercase`.
  Text lowercase() => _rebuild(data!.toLowerCase());

  /// Capitalises the first letter of each word — Tailwind `capitalize`.
  Text capitalize() => _rebuild(
        data!.split(' ').map((w) {
          if (w.isEmpty) return '';
          return '${w[0].toUpperCase()}${w.substring(1)}';
        }).join(' '),
      );

  /// Converts the text to title case (alias for [capitalize]).
  Text titleCase() => capitalize();

  // ══════════════════════════════════════════════════════════════════════════
  // TEXT ALIGNMENT
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets the [TextAlign] — Tailwind `text-{alignment}`.
  Text withTextAlign(TextAlign alignment) => _rebuildAlign(alignment);

  /// Centers the text — Tailwind `text-center`.
  Text textCenter() => _rebuildAlign(TextAlign.center);

  /// Left-aligns the text — Tailwind `text-left`.
  Text textLeft() => _rebuildAlign(TextAlign.left);

  /// Right-aligns the text — Tailwind `text-right`.
  Text textRight() => _rebuildAlign(TextAlign.right);

  /// Aligns the text to the start (respects RTL) — Tailwind `text-left` in LTR.
  Text start() => _rebuildAlign(TextAlign.start);

  /// Aligns the text to the end (respects RTL) — Tailwind `text-right` in LTR.
  Text end() => _rebuildAlign(TextAlign.end);

  /// Justifies the text — Tailwind `text-justify`.
  Text justify() => _rebuildAlign(TextAlign.justify);

  // ══════════════════════════════════════════════════════════════════════════
  // OVERFLOW & MAX LINES
  // ══════════════════════════════════════════════════════════════════════════

  /// Truncates overflowing text with an ellipsis and limits to 1 line by
  /// default — Tailwind `truncate`.
  ///
  /// ```dart
  /// Text('A very long string').ellipsis()          // 1 line
  /// Text('A very long string').ellipsis(maxLines: 3) // up to 3 lines
  /// ```
  Text ellipsis({int maxLines = 1}) => Text(
        data ?? '',
        key: key,
        style: style,
        textAlign: this.textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );

  /// Clips overflowing text — Tailwind `overflow-hidden` on text.
  Text clip() => Text(
        data ?? '',
        key: key,
        style: style,
        textAlign: this.textAlign,
        overflow: TextOverflow.clip,
        maxLines: this.maxLines,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );

  /// Sets the maximum number of lines before truncation.
  Text withMaxLines(int lines) => Text(
        data ?? '',
        key: key,
        style: style,
        textAlign: this.textAlign,
        overflow: overflow,
        maxLines: lines,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );

  /// Disables text wrapping — Tailwind `whitespace-nowrap`.
  Text noWrap() => Text(
        data ?? '',
        key: key,
        style: style,
        textAlign: this.textAlign,
        overflow: overflow,
        maxLines: 1,
        softWrap: false,
        textDirection: textDirection,
        locale: locale,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );

  // ══════════════════════════════════════════════════════════════════════════
  // SHADOWS
  // ══════════════════════════════════════════════════════════════════════════

  /// Adds a [Shadow] to the text — Tailwind `drop-shadow-*`.
  ///
  /// ```dart
  /// Text('Title').textShadow(
  ///   Shadow(color: Colors.black45, blurRadius: 4, offset: Offset(1, 2)),
  /// )
  /// ```
  Text textShadow(Shadow shadow) => _copyWith(shadows: [shadow]);

  /// Adds multiple [Shadow]s to the text.
  Text textShadows(List<Shadow> shadows) => _copyWith(shadows: shadows);

  // ══════════════════════════════════════════════════════════════════════════
  // INTERNAL HELPERS
  // ══════════════════════════════════════════════════════════════════════════

  /// Creates a new [Text] with the given [TextStyle] properties merged on top
  /// of the current style. Preserves all non-style [Text] properties.
  Text _copyWith({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? letterSpacing,
    double? height,
    String? fontFamily,
    List<Shadow>? shadows,
  }) {
    final currentStyle = style ?? const TextStyle();
    return Text(
      data ?? '',
      key: key,
      style: currentStyle.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        letterSpacing: letterSpacing,
        height: height,
        fontFamily: fontFamily,
        shadows: shadows,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      textScaler: textScaler,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }

  /// Creates a new [Text] with replaced [data] but identical [TextStyle] and
  /// other properties. Used for text-transform operations.
  Text _rebuild(String newData) => Text(
        newData,
        key: key,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );

  /// Creates a new [Text] with a different [TextAlign].
  Text _rebuildAlign(TextAlign newAlign) => Text(
        data ?? '',
        key: key,
        style: style,
        textAlign: newAlign,
        overflow: overflow,
        maxLines: maxLines,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
}
