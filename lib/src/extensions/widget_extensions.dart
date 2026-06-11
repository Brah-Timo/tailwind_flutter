import 'package:flutter/material.dart';
import '../tokens/tw_spacing.dart';
import '../tokens/tw_radii.dart';
import '../tokens/tw_shadows.dart';

/// Utility-first extension methods on [Widget], mirroring Tailwind CSS classes.
///
/// Chain these methods on **any** Flutter widget instead of nesting multiple
/// layout widgets manually.
///
/// ### Order rule
/// Always apply [TwTextExtensions] (on [Text]) **before** these widget
/// extensions. Once you call any widget extension, the type becomes [Widget]
/// and text-specific extensions are no longer available.
///
/// ```dart
/// // ✅ correct — text extensions first, then widget extensions
/// Text('Hello')
///     .bold()                              // TwTextExtensions
///     .fontSize(TwFontSizes.xl)            // TwTextExtensions
///     .textColor(TwColors.blue.shade600)   // TwTextExtensions
///     .p(TwSpacing.s4)                     // TwWidgetExtensions ← pivot
///     .bg(TwColors.white)                  // TwWidgetExtensions
///     .rounded(TwRadii.lg.value)           // TwWidgetExtensions
///
/// // ❌ wrong — widget extension called before text extensions
/// Text('Hello').p(TwSpacing.s4).bold()    // compile error: no .bold() on Widget
/// ```
extension TwWidgetExtensions on Widget {
  // ══════════════════════════════════════════════════════════════════════════
  // PADDING
  // ══════════════════════════════════════════════════════════════════════════

  /// Applies equal padding on all four sides — Tailwind `p-{n}`.
  ///
  /// ```dart
  /// myWidget.p(TwSpacing.s4)   // padding: EdgeInsets.all(16)
  /// ```
  Widget p(TwSpacingValue value) =>
      Padding(padding: value.all, child: this);

  /// Applies horizontal (left + right) padding — Tailwind `px-{n}`.
  Widget px(TwSpacingValue value) =>
      Padding(padding: value.x, child: this);

  /// Applies vertical (top + bottom) padding — Tailwind `py-{n}`.
  Widget py(TwSpacingValue value) =>
      Padding(padding: value.y, child: this);

  /// Applies top padding only — Tailwind `pt-{n}`.
  Widget pt(TwSpacingValue value) =>
      Padding(padding: value.top, child: this);

  /// Applies bottom padding only — Tailwind `pb-{n}`.
  Widget pb(TwSpacingValue value) =>
      Padding(padding: value.bottom, child: this);

  /// Applies left padding only — Tailwind `pl-{n}`.
  Widget pl(TwSpacingValue value) =>
      Padding(padding: value.left, child: this);

  /// Applies right padding only — Tailwind `pr-{n}`.
  Widget pr(TwSpacingValue value) =>
      Padding(padding: value.right, child: this);

  /// Applies a fully custom [EdgeInsets] as padding.
  ///
  /// Use this when no single-direction token fits:
  /// ```dart
  /// myWidget.padding(const EdgeInsets.fromLTRB(8, 4, 8, 12))
  /// ```
  Widget padding(EdgeInsetsGeometry insets) =>
      Padding(padding: insets, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // MARGIN
  // ══════════════════════════════════════════════════════════════════════════

  /// Applies equal margin on all four sides — Tailwind `m-{n}`.
  Widget m(TwSpacingValue value) =>
      Container(margin: value.all, child: this);

  /// Applies horizontal margin — Tailwind `mx-{n}`.
  Widget mx(TwSpacingValue value) =>
      Container(margin: value.x, child: this);

  /// Applies vertical margin — Tailwind `my-{n}`.
  Widget my(TwSpacingValue value) =>
      Container(margin: value.y, child: this);

  /// Applies top margin only — Tailwind `mt-{n}`.
  Widget mt(TwSpacingValue value) =>
      Container(margin: value.top, child: this);

  /// Applies bottom margin only — Tailwind `mb-{n}`.
  Widget mb(TwSpacingValue value) =>
      Container(margin: value.bottom, child: this);

  /// Applies left margin only — Tailwind `ml-{n}`.
  Widget ml(TwSpacingValue value) =>
      Container(margin: value.left, child: this);

  /// Applies right margin only — Tailwind `mr-{n}`.
  Widget mr(TwSpacingValue value) =>
      Container(margin: value.right, child: this);

  /// Applies a fully custom [EdgeInsets] as margin.
  Widget margin(EdgeInsetsGeometry insets) =>
      Container(margin: insets, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // BACKGROUND
  // ══════════════════════════════════════════════════════════════════════════

  /// Applies a solid background colour — Tailwind `bg-{color}-{shade}`.
  ///
  /// ```dart
  /// myWidget.bg(TwColors.blue.shade500)
  /// myWidget.bg(TwColors.white)
  /// ```
  Widget bg(Color color) => ColoredBox(color: color, child: this);

  /// Applies a gradient background — Tailwind `bg-gradient-to-*`.
  ///
  /// ```dart
  /// myWidget.gradient(
  ///   LinearGradient(colors: [TwColors.blue.shade400, TwColors.indigo.shade600]),
  /// )
  /// ```
  Widget gradient(Gradient grad) => DecoratedBox(
        decoration: BoxDecoration(gradient: grad),
        child: this,
      );

  // ══════════════════════════════════════════════════════════════════════════
  // BORDER RADIUS / CLIP
  // ══════════════════════════════════════════════════════════════════════════

  /// Clips all corners to [radius] — Tailwind `rounded-{size}`.
  ///
  /// Defaults to [TwRadii.base] (4 px) when called with no argument.
  ///
  /// ```dart
  /// myWidget.rounded()                    // 4 px
  /// myWidget.rounded(TwRadii.lg.value)    // 8 px
  /// myWidget.rounded(TwRadii.full.value)  // pill shape
  /// ```
  Widget rounded([double? radius]) => ClipRRect(
        borderRadius: radius != null
            ? BorderRadius.circular(radius)
            : TwRadii.base.all,
        child: this,
      );

  /// Clips to a [BorderRadius] instance — for asymmetric rounding.
  ///
  /// ```dart
  /// myWidget.roundedWith(TwRadii.xl.top)   // only top corners rounded
  /// ```
  Widget roundedWith(BorderRadius borderRadius) =>
      ClipRRect(borderRadius: borderRadius, child: this);

  /// Clips the widget to an oval shape — Tailwind `rounded-full` on square.
  Widget clipOval() => ClipOval(child: this);

  /// Clips the widget to its bounding rectangle (useful for overflowing content).
  Widget clipRect() => ClipRect(child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // SHADOWS
  // ══════════════════════════════════════════════════════════════════════════

  /// Applies a list of [BoxShadow]s — Tailwind `shadow-{level}`.
  ///
  /// Defaults to [TwShadows.base] when called with no argument.
  ///
  /// ```dart
  /// myWidget.shadow()               // default shadow
  /// myWidget.shadow(TwShadows.lg)   // large shadow
  /// myWidget.shadow(TwShadows.none) // removes shadow
  /// ```
  Widget shadow([List<BoxShadow>? shadows]) => DecoratedBox(
        decoration: BoxDecoration(boxShadow: shadows ?? TwShadows.base),
        child: this,
      );

  // ══════════════════════════════════════════════════════════════════════════
  // BORDERS
  // ══════════════════════════════════════════════════════════════════════════

  /// Applies a border on all sides — Tailwind `border`.
  ///
  /// ```dart
  /// myWidget.border()
  /// myWidget.border(color: TwColors.blue.shade500, width: 2)
  /// ```
  Widget border({
    Color color = const Color(0xFFE5E7EB), // gray-200
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width, style: style),
        ),
        child: this,
      );

  /// Applies a border only on the top side — Tailwind `border-t`.
  Widget borderTop({
    Color color = const Color(0xFFE5E7EB),
    double width = 1.0,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  /// Applies a border only on the bottom side — Tailwind `border-b`.
  Widget borderBottom({
    Color color = const Color(0xFFE5E7EB),
    double width = 1.0,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  /// Applies a border only on the left side — Tailwind `border-l`.
  Widget borderLeft({
    Color color = const Color(0xFFE5E7EB),
    double width = 1.0,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  /// Applies a border only on the right side — Tailwind `border-r`.
  Widget borderRight({
    Color color = const Color(0xFFE5E7EB),
    double width = 1.0,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  /// Applies borders on the left and right sides — Tailwind `border-x`.
  Widget borderX({
    Color color = const Color(0xFFE5E7EB),
    double width = 1.0,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(color: color, width: width),
          ),
        ),
        child: this,
      );

  /// Applies borders on the top and bottom sides — Tailwind `border-y`.
  Widget borderY({
    Color color = const Color(0xFFE5E7EB),
    double width = 1.0,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: color, width: width),
          ),
        ),
        child: this,
      );

  // ══════════════════════════════════════════════════════════════════════════
  // OPACITY
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets the widget's opacity — Tailwind `opacity-{n}`.
  ///
  /// The [value] is automatically clamped to [0.0, 1.0].
  ///
  /// ```dart
  /// myWidget.opacity(TwOpacity.o50)   // 50%
  /// myWidget.opacity(TwOpacity.o0)    // invisible (but keeps space)
  /// ```
  Widget opacity(double value) =>
      Opacity(opacity: value.clamp(0.0, 1.0), child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // SIZING
  // ══════════════════════════════════════════════════════════════════════════

  /// Sets a fixed width — Tailwind `w-{n}`.
  ///
  /// ```dart
  /// myWidget.width(TwSpacing.s64.value)  // 256 px
  /// myWidget.width(48)                   // 48 px
  /// ```
  Widget width(double w) => SizedBox(width: w, child: this);

  /// Sets a fixed height — Tailwind `h-{n}`.
  Widget height(double h) => SizedBox(height: h, child: this);

  /// Expands the widget to the maximum available width — Tailwind `w-full`.
  Widget fullWidth() => SizedBox(width: double.infinity, child: this);

  /// Expands the widget to the maximum available height — Tailwind `h-full`.
  Widget fullHeight() => SizedBox(height: double.infinity, child: this);

  /// Sets both width and height — Tailwind `w-{n} h-{n}`.
  Widget size(double w, double h) => SizedBox(width: w, height: h, child: this);

  /// Sets a square size (width == height) — useful for icons, avatars.
  Widget square(double side) => SizedBox(width: side, height: side, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // VISIBILITY
  // ══════════════════════════════════════════════════════════════════════════

  /// Conditionally shows or hides the widget — Tailwind `visible` / `invisible`.
  ///
  /// When [isVisible] is `false` the widget is hidden but **keeps its space**,
  /// just like CSS `visibility: hidden`.
  Widget visible({required bool isVisible}) =>
      Visibility(visible: isVisible, child: this);

  /// Hides the widget but **preserves its layout space** — Tailwind `invisible`.
  Widget invisible() => Visibility(visible: false, child: this);

  /// Removes the widget from the layout entirely when [show] is `false`
  /// — Tailwind `hidden` (CSS `display: none`).
  Widget hidden({required bool show}) =>
      Visibility(visible: show, maintainSize: false, maintainState: false,
          maintainAnimation: false, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // ASPECT RATIO
  // ══════════════════════════════════════════════════════════════════════════

  /// Enforces a fixed aspect ratio — Tailwind `aspect-{ratio}`.
  ///
  /// ```dart
  /// myWidget.aspectRatio(16 / 9)   // aspect-video
  /// myWidget.aspectRatio(1 / 1)    // aspect-square
  /// ```
  Widget aspectRatio(double ratio) =>
      AspectRatio(aspectRatio: ratio, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // FLEX HELPERS
  // ══════════════════════════════════════════════════════════════════════════

  /// Wraps the widget in a [Flexible] — use inside [Row] or [Column].
  ///
  /// Tailwind `flex-{n}` (relative sizing within a flex container).
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Wraps the widget in an [Expanded] — fills remaining space in Row/Column.
  ///
  /// Tailwind `flex-1` with `flex-grow: 1; flex-shrink: 1`.
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // ALIGNMENT & CENTERING
  // ══════════════════════════════════════════════════════════════════════════

  /// Wraps the widget in a [Center] — Tailwind `mx-auto` equivalent.
  Widget center() => Center(child: this);

  /// Wraps the widget in an [Align] with [alignment].
  Widget align(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);

  /// Aligns the widget to the top-left — Tailwind `items-start justify-start`.
  Widget alignTopLeft() => align(Alignment.topLeft);

  /// Aligns the widget to the top-center.
  Widget alignTopCenter() => align(Alignment.topCenter);

  /// Aligns the widget to the top-right — Tailwind `items-start justify-end`.
  Widget alignTopRight() => align(Alignment.topRight);

  /// Aligns the widget to the center-left — Tailwind `items-center justify-start`.
  Widget alignCenterLeft() => align(Alignment.centerLeft);

  /// Aligns the widget to the center-right — Tailwind `items-center justify-end`.
  Widget alignCenterRight() => align(Alignment.centerRight);

  /// Aligns the widget to the bottom-left — Tailwind `items-end justify-start`.
  Widget alignBottomLeft() => align(Alignment.bottomLeft);

  /// Aligns the widget to the bottom-center.
  Widget alignBottomCenter() => align(Alignment.bottomCenter);

  /// Aligns the widget to the bottom-right — Tailwind `items-end justify-end`.
  Widget alignBottomRight() => align(Alignment.bottomRight);

  // ══════════════════════════════════════════════════════════════════════════
  // ACCESSIBILITY & INTERACTION
  // ══════════════════════════════════════════════════════════════════════════

  /// Wraps the widget in a [Tooltip] with [message].
  Widget tooltip(String message) => Tooltip(message: message, child: this);

  /// Makes the widget tappable — wraps in [GestureDetector].
  ///
  /// ```dart
  /// myCard.onTap(() => Navigator.push(context, ...))
  /// ```
  Widget onTap(VoidCallback callback) =>
      GestureDetector(onTap: callback, child: this);

  /// Makes the widget long-press detectable.
  Widget onLongPress(VoidCallback callback) =>
      GestureDetector(onLongPress: callback, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // TRANSFORM & EFFECTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Applies a [Matrix4] transformation — Tailwind `scale`, `rotate`, `translate`.
  Widget transform(Matrix4 matrix) =>
      Transform(transform: matrix, child: this);

  /// Scales the widget uniformly.
  Widget scale(double factor) => Transform.scale(scale: factor, child: this);

  /// Rotates the widget by [angle] radians.
  Widget rotate(double angle) => Transform.rotate(angle: angle, child: this);

  /// Translates the widget by ([dx], [dy]).
  Widget translate({double dx = 0, double dy = 0}) =>
      Transform.translate(offset: Offset(dx, dy), child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // OVERFLOW
  // ══════════════════════════════════════════════════════════════════════════

  /// Wraps in an [OverflowBox] — allows the child to overflow its bounds.
  Widget overflow({
    double? maxWidth,
    double? maxHeight,
    double? minWidth,
    double? minHeight,
  }) =>
      OverflowBox(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        minWidth: minWidth,
        minHeight: minHeight,
        child: this,
      );

  // ══════════════════════════════════════════════════════════════════════════
  // DECORATION (combined shortcut)
  // ══════════════════════════════════════════════════════════════════════════

  /// Applies a fully custom [BoxDecoration] in one call.
  ///
  /// Use this when you need to combine background, border, radius, and shadow
  /// in a single [DecoratedBox] for optimal performance (fewer widget layers).
  Widget decorated(BoxDecoration decoration) =>
      DecoratedBox(decoration: decoration, child: this);

  // ══════════════════════════════════════════════════════════════════════════
  // SAFE AREA
  // ══════════════════════════════════════════════════════════════════════════

  /// Wraps the widget in a [SafeArea].
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) =>
      SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );
}
