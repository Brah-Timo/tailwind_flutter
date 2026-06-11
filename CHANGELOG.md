# Changelog

All notable changes to **tailwind_flutter** are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [0.2.0] — 2026-06-11

### Added

**TwStyle system**
- `TwStyle` — composable, immutable style object with `.merge()`, `.resolve()`,
  `.apply()`, and `.copyWith()` methods
- `TwStyle.card`, `TwStyle.ghost`, `TwStyle.badge` built-in presets
- `TwVariant` enum (`light`, `dark`) for conditional style overrides
- `TwStyleMerger` — `mergeAll()`, `when()`, `atIndex()` helpers
- `List<TwStyle>.merge()` extension for fluent list merging

**Theme layer**
- `TwTheme` — `InheritedWidget` that injects `TwThemeData` into the tree
- `TwThemeData` — light/dark presets with 7 token sub-classes
  (`TwColorTokens`, `TwSpacingTokens`, `TwTypographyTokens`,
  `TwShadowTokens`, `TwRadiiTokens`, `TwOpacityTokens`, `TwBreakpointTokens`)
- `TwThemeData.fromBrightness()` — auto-select light/dark from platform
- `TwContextExtension` — `context.tw`, `context.isMobile`,
  `context.isTablet`, `context.isDesktop`, `context.isDarkMode`,
  `context.breakpoint`
- `TwThemeExtensions` — 4 `ThemeExtension` classes for native `ThemeData`
  integration (`TwColorExtension`, `TwSpacingExtension`, `TwRadiiExtension`,
  `TwShadowExtension`) + `TwThemeExtensions.all()` convenience method

**Widget extensions** (new methods)
- `.gradient(Gradient)` — gradient background
- `.clipOval()` — circular clip
- `.clipRect()` — rectangular clip
- `.center()` — wraps in `Center`
- `.align(AlignmentGeometry)` — wraps in `Align`
- `.alignTopLeft()`, `.alignTopCenter()`, `.alignTopRight()`,
  `.alignCenterLeft()`, `.alignCenterRight()`, `.alignBottomLeft()`,
  `.alignBottomCenter()`, `.alignBottomRight()`
- `.roundedWith(BorderRadius)` — asymmetric corner control
- `.scale(double)`, `.rotate(double)`, `.translate({dx, dy})` — transforms
- `.transform(Matrix4)` — raw transform
- `.onTap(VoidCallback)`, `.onLongPress(VoidCallback)` — gesture wrappers
- `.tooltip(String)` — Tooltip wrapper
- `.square(double)` — equal width & height
- `.size(double, double)` — combined width + height
- `.hidden({required bool show})` — `display: none` equivalent
- `.safeArea(...)` — SafeArea wrapper
- `.overflow(...)` — OverflowBox wrapper
- `.decorated(BoxDecoration)` — raw BoxDecoration shortcut
- `.border(...)`, `.borderX()`, `.borderY()` — new border variants

**Text extensions** (new methods)
- `.semibold()`, `.extrabold()`, `.black()` — additional weight shortcuts
- `.italic()`, `.notItalic()` — font style
- `.noDecoration()` — removes text decoration
- `.textLeft()`, `.textRight()`, `.justify()` — additional alignment helpers
- `.clip()` — TextOverflow.clip
- `.noWrap()` — disables word wrap
- `.textShadow(Shadow)`, `.textShadows(List<Shadow>)` — text shadow
- `.titleCase()` — alias for `.capitalize()`

**Tokens**
- `TwColors` updated to Tailwind v4 exact hex values with `.shade950` added
  for all families
- `TwSpacingValue` — added `toString()`, `==`, `hashCode`
- `TwRadiiValue` — added `.topLeft()`, `.topRight()`, `.bottomLeft()`,
  `.bottomRight()` per-corner getters; `toString()`, `==`, `hashCode`
- `TwFontSizeValue` — added `==`, `hashCode`
- `TwShadows` — added `.byName` lookup map; remapped to Tailwind v4 exact
  shadow definitions including `spreadRadius`
- `TwBreakpoints` — added `labelForWidth()`, `.of()`, `.isAtLeast()`,
  `.isMobile()`, `.isTablet()`, `.isDesktop()` helpers; `TwBreakpointLabel` enum

**Example app**
- Three-page showcase: Tokens, Extensions, Styles
- Dark-mode toggle
- Live colour swatch with 19 families
- Before/after comparison cards

### Changed
- `TwStyle.apply()` now combines `backgroundColor`, `borderRadius`, `shadows`,
  and `border` into a **single `DecoratedBox`** for improved tree depth
- `TwStyle.apply()` now merges `textStyle` directly into `Text.style` instead
  of wrapping in an extra widget
- `TwThemeData.dark()` reduces shadow levels for better dark-mode aesthetics

### Fixed
- `TwTextExtensions._copyWith()` now preserves all `Text` widget properties:
  `textDirection`, `locale`, `softWrap`, `textScaler`, `semanticsLabel`,
  `textWidthBasis`, `textHeightBehavior`, `selectionColor`

---

## [0.1.0] — 2025-05-15

### Added

**Design Tokens**
- `TwColors` — 22 colour families × 11 shades = 242 colours
- `TwSpacing` — 35 values on the 4 px scale (s0 → s96)
- `TwFontSizes` — 13 font sizes with Tailwind-paired line-heights
- `TwFontWeights` — 9 weights (thin → black)
- `TwRadii` — 10 border-radius values with `BorderRadius` getters
- `TwShadows` — 7 shadow presets (none, sm, base, md, lg, xl, 2xl)
- `TwOpacity` — 21 opacity steps (o0 → o100)
- `TwBreakpoints` — 5 responsive breakpoints (sm, md, lg, xl, 2xl)

**Widget Extensions** (`TwWidgetExtensions`)
- Padding: `.p()`, `.px()`, `.py()`, `.pt()`, `.pb()`, `.pl()`, `.pr()`,
  `.padding()`
- Margin: `.m()`, `.mx()`, `.my()`, `.mt()`, `.mb()`, `.ml()`, `.mr()`
- Background: `.bg()`
- Border radius: `.rounded()`
- Shadows: `.shadow()`
- Borders: `.border()`, `.borderTop()`, `.borderBottom()`,
  `.borderLeft()`, `.borderRight()`
- Opacity: `.opacity()`
- Sizing: `.width()`, `.height()`, `.fullWidth()`, `.fullHeight()`
- Visibility: `.visible()`, `.invisible()`
- Layout: `.aspectRatio()`, `.flexible()`, `.expanded()`

**Text Extensions** (`TwTextExtensions`)
- Weight: `.bold()`, `.medium()`, `.light()`, `.thin()`, `.fontWeight()`
- Size: `.fontSize()`, `.textSize()`
- Color: `.textColor()`
- Family: `.fontFamily()`
- Decoration: `.underline()`, `.lineThrough()`, `.overline()`
- Spacing: `.letterSpacing()`, `.lineHeight()`
- Transform: `.uppercase()`, `.lowercase()`, `.capitalize()`
- Alignment: `.center()`, `.start()`, `.end()`, `.textAlign()`
- Overflow: `.ellipsis()`, `.maxLines()`

**Example App**
- Basic showcase of tokens and extensions

---


