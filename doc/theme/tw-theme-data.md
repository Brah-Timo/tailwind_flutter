# TwThemeData — Token Container

> **Source:** `lib/src/theme/tw_theme_data.dart`

---

## Overview

`TwThemeData` is the container that aggregates all seven design token groups into one object. It is injected into the widget tree by `TwTheme` and accessed via `context.tw`.

---

## Class Structure

```dart
class TwThemeData {
  final TwColorTokens     colors;
  final TwSpacingTokens   spacing;
  final TwTypographyTokens typography;
  final TwShadowTokens    shadows;
  final TwRadiiTokens     radii;
  final TwOpacityTokens   opacity;
  final TwBreakpointTokens breakpoints;
}
```

---

## Factory Constructors

### `TwThemeData.light({...})`

Creates a light-mode theme. All token groups default to their standard Tailwind v4 values. Override individual groups by passing them as named arguments:

```dart
// Default light theme
TwThemeData.light()

// Custom brand color
TwThemeData.light(
  colors: TwColorTokens(primary: TwColors.violet),
)

// Custom everything
TwThemeData.light(
  colors: myBrandColors,
  typography: myTypography,
  radii: myRadii,
)
```

**Light defaults:**
- `colors.surface` → `Color(0xFFFFFFFF)` (white)
- `colors.background` → `Color(0xFFF9FAFB)` (gray-50)
- Shadows → standard Tailwind shadow scale

### `TwThemeData.dark({...})`

Creates a dark-mode theme with adjusted surface colors and softened shadows:

```dart
TwThemeData.dark()

// With custom brand
TwThemeData.dark(
  colors: TwColorTokens.dark(primary: TwColors.violet),
)
```

**Dark defaults:**
- `colors.surface` → `Color(0xFF1E293B)` (slate-800)
- `colors.background` → `Color(0xFF0F172A)` (slate-900)
- Shadows → `TwShadowTokens.dark()` (one step reduced)

### `TwThemeData.fromBrightness(Brightness brightness)`

Selects `light()` or `dark()` based on the platform brightness — for adaptive apps:

```dart
final brightness = MediaQuery.platformBrightnessOf(context);
TwThemeData.fromBrightness(brightness)
```

---

## Token Group Classes

### `TwColorTokens`

Exposes the complete Tailwind color palette plus semantic brand colors.

```dart
const TwColorTokens({
  // All 22 color families (default to TwColors values):
  TwColor slate, gray, zinc, neutral, stone,
  TwColor red, orange, amber, yellow, lime,
  TwColor green, emerald, teal, cyan, sky,
  TwColor blue, indigo, violet, purple, fuchsia, pink, rose,

  // Special colors:
  Color white, black, transparent,

  // Semantic colors:
  Color surface,     // card/panel background
  Color background,  // page/scaffold background

  // Brand colors:
  TwColor primary,   // default: TwColors.blue
  TwColor secondary, // default: TwColors.indigo
  TwColor error,     // default: TwColors.red
  TwColor success,   // default: TwColors.green
  TwColor warning,   // default: TwColors.amber
})
```

**Dark variant:**
```dart
const TwColorTokens.dark({
  // Same as above, but:
  Color surface    = const Color(0xFF1E293B),  // slate-800
  Color background = const Color(0xFF0F172A),  // slate-900
})
```

**Override brand color:**
```dart
TwColorTokens(primary: TwColors.violet)
TwColorTokens(primary: TwColors.rose, error: TwColors.pink)
```

---

### `TwSpacingTokens`

Exposes 21 of the most commonly used spacing values (the full 35-step scale is available on `TwSpacing` directly):

| Token | px |
|-------|----|
| `s0` | 0 |
| `s0_5` | 2 |
| `s1` | 4 |
| `s1_5` | 6 |
| `s2` | 8 |
| `s3` | 12 |
| `s4` | 16 |
| `s5` | 20 |
| `s6` | 24 |
| `s7` | 28 |
| `s8` | 32 |
| `s10` | 40 |
| `s12` | 48 |
| `s16` | 64 |
| `s20` | 80 |
| `s24` | 96 |
| `s32` | 128 |
| `s40` | 160 |
| `s48` | 192 |
| `s64` | 256 |
| `s96` | 384 |

```dart
context.tw.spacing.s4.all    // EdgeInsets.all(16)
context.tw.spacing.s6.px     // 24.0
```

---

### `TwTypographyTokens`

Exposes font sizes `xs`–`xl4` and common font weights:

| Field | Value |
|-------|-------|
| `xs` | 12 px / lh 16 px |
| `sm` | 14 px / lh 20 px |
| `base` | 16 px / lh 24 px |
| `lg` | 18 px / lh 28 px |
| `xl` | 20 px / lh 28 px |
| `xl2` | 24 px / lh 32 px |
| `xl3` | 30 px / lh 36 px |
| `xl4` | 36 px / lh 40 px |
| `thin` | `FontWeight.w100` |
| `light` | `FontWeight.w300` |
| `normal` | `FontWeight.w400` |
| `medium` | `FontWeight.w500` |
| `semibold` | `FontWeight.w600` |
| `bold` | `FontWeight.w700` |

> For sizes `xl5`–`xl9`, use `TwFontSizes` directly.

---

### `TwShadowTokens`

```dart
const TwShadowTokens({
  List<BoxShadow> none, sm, base, md, lg, xl, xl2,
})

// Dark mode — shadows reduced by one level:
const TwShadowTokens.dark({
  // sm → none, base → sm, md → sm, lg → base, xl → md, xl2 → lg
})
```

---

### `TwRadiiTokens`

```dart
const TwRadiiTokens({
  TwRadiiValue none, sm, base, md, lg, xl, xl2, xl3, full,
})
```

Exposes the same values as `TwRadii` but under the theme namespace:

```dart
context.tw.radii.lg.all    // BorderRadius.circular(8)
context.tw.radii.full.value  // 9999.0
```

---

### `TwOpacityTokens`

The 5 most common opacity steps:

```dart
const TwOpacityTokens({
  double o0   = 0.0,
  double o25  = 0.25,
  double o50  = 0.5,
  double o75  = 0.75,
  double o100 = 1.0,
})
```

---

### `TwBreakpointTokens`

```dart
const TwBreakpointTokens({
  double sm  = 640.0,
  double md  = 768.0,
  double lg  = 1024.0,
  double xl  = 1280.0,
  double xl2 = 1536.0,
})
```

---

## Accessing Tokens

```dart
final tw = context.tw;   // TwThemeData

// Colors
tw.colors.primary.shade500
tw.colors.surface
tw.colors.background
tw.colors.blue.shade400
tw.colors.error.shade600

// Spacing
tw.spacing.s4.all         // EdgeInsets.all(16)
tw.spacing.s6.px          // 24.0

// Typography
tw.typography.lg.textStyle
tw.typography.bold        // FontWeight.w700

// Shadows
tw.shadows.md             // List<BoxShadow>
tw.shadows.none           // []

// Radii
tw.radii.lg.all           // BorderRadius.circular(8)
tw.radii.xl2.value        // 16.0

// Opacity
tw.opacity.o50            // 0.5

// Breakpoints
tw.breakpoints.md         // 768.0
```
