# ThemeExtensions — Flutter Native Bridge

> **Source:** `lib/src/theme/tw_theme_extension.dart`

---

## Overview

The `tw_theme_extension.dart` file provides four `ThemeExtension` subclasses that bridge tailwind_ui_flutter tokens into Flutter's **native `ThemeData.extensions` system**.

Use this when:
- Your codebase already uses `Theme.of(context)` heavily
- You want Tailwind tokens available in animated theme transitions (`ThemeData.lerp`)
- You prefer not to add a `TwTheme` wrapper to your widget tree

---

## The Four Extensions

| Class | Token group | Access pattern |
|-------|-------------|----------------|
| `TwColorExtension` | Colors | `Theme.of(context).extension<TwColorExtension>()` |
| `TwSpacingExtension` | Spacing | `Theme.of(context).extension<TwSpacingExtension>()` |
| `TwRadiiExtension` | Border radii | `Theme.of(context).extension<TwRadiiExtension>()` |
| `TwShadowExtension` | Shadows | `Theme.of(context).extension<TwShadowExtension>()` |

---

## Registration

### One-liner with `TwThemeExtensions.all()`

```dart
MaterialApp(
  theme: ThemeData(
    extensions: TwThemeExtensions.all(),                         // light preset
  ),
  darkTheme: ThemeData(
    extensions: TwThemeExtensions.all(data: TwThemeData.dark()), // dark preset
  ),
)
```

### Manual registration

```dart
MaterialApp(
  theme: ThemeData(
    extensions: [
      TwColorExtension.fromTokens(const TwColorTokens()),
      TwSpacingExtension.fromTokens(const TwSpacingTokens()),
      TwRadiiExtension.fromTokens(const TwRadiiTokens()),
      TwShadowExtension.fromTokens(const TwShadowTokens()),
    ],
  ),
)
```

### Custom brand colors

```dart
ThemeData(
  extensions: [
    TwColorExtension.fromTokens(
      TwColorTokens(primary: TwColors.violet, error: TwColors.pink),
    ),
    ...
  ],
)
```

---

## Reading Extensions

```dart
// In a widget build() method:
final colors  = Theme.of(context).extension<TwColorExtension>()!;
final spacing = Theme.of(context).extension<TwSpacingExtension>()!;
final radii   = Theme.of(context).extension<TwRadiiExtension>()!;
final shadows = Theme.of(context).extension<TwShadowExtension>()!;

// Using values:
final primary    = colors.primary.shade500;
final background = colors.background;
final gap        = spacing.s4.px;
final cardRadius = radii.lg.all;
final cardShadow = shadows.md;
```

---

## `TwColorExtension`

```dart
class TwColorExtension extends ThemeExtension<TwColorExtension> {
  final TwColor slate, gray, blue, indigo, violet,
                green, red, amber, pink, teal;
  final Color white, black, surface, background;
  final TwColor primary, error, success, warning;
}
```

### Factories

```dart
TwColorExtension.light()             // default light preset
TwColorExtension.dark()              // default dark preset
TwColorExtension.fromTokens(tokens)  // from TwColorTokens
```

### `copyWith()`

```dart
// All 18 parameters are TwColor? or Color? nullable overrides:
colors.copyWith(
  primary: TwColors.violet,
  surface: const Color(0xFFF5F3FF),  // violet-50
)
```

### `lerp()`

Colors that are `TwColor` (MaterialColor subclass) use step interpolation (step at `t = 0.5`). `Color` fields use `Color.lerp()`:

```dart
// Automatically called by Flutter during ThemeData.lerp()
// TwColor fields: return 'this' for t < 0.5, 'other' for t >= 0.5
// Color fields: linear interpolation
```

---

## `TwSpacingExtension`

```dart
class TwSpacingExtension extends ThemeExtension<TwSpacingExtension> {
  final TwSpacingValue s1, s2, s3, s4, s5, s6, s8,
                       s10, s12, s16, s20, s24;
}
```

```dart
spacing.s4.all    // EdgeInsets.all(16)
spacing.s6.px     // 24.0
```

`lerp()` returns `this` (spacing values are discrete).

---

## `TwRadiiExtension`

```dart
class TwRadiiExtension extends ThemeExtension<TwRadiiExtension> {
  final TwRadiiValue none, sm, base, md, lg, xl, xl2, xl3, full;
}
```

```dart
radii.lg.all         // BorderRadius.circular(8)
radii.xl2.value      // 16.0
radii.full.value     // 9999.0
```

`lerp()` returns `this` (radius values are discrete).

---

## `TwShadowExtension`

```dart
class TwShadowExtension extends ThemeExtension<TwShadowExtension> {
  final List<BoxShadow> none, sm, base, md, lg, xl, xl2;
}
```

```dart
shadows.md          // List<BoxShadow>
shadows.none        // [] (empty list)
```

`lerp()` returns `this` (shadow lists are discrete).

---

## `TwThemeExtensions` Helper

```dart
class TwThemeExtensions {
  /// Returns all four extensions for the given TwThemeData (defaults to light).
  static List<ThemeExtension<dynamic>> all({TwThemeData? data}) {
    final d = data ?? TwThemeData.light();
    return [
      TwColorExtension.fromTokens(d.colors),
      TwSpacingExtension.fromTokens(d.spacing),
      TwRadiiExtension.fromTokens(d.radii),
      TwShadowExtension.fromTokens(d.shadows),
    ];
  }
}
```

---

## Combined with `TwTheme`

You can use both systems together — `TwTheme` for the primary API and `ThemeExtensions` for any code that already uses `Theme.of(context)`:

```dart
MaterialApp(
  theme: ThemeData(
    extensions: TwThemeExtensions.all(),
  ),
  home: Builder(
    builder: (context) => TwTheme(
      data: TwThemeData.light(),
      child: const MyApp(),
    ),
  ),
)
```

---

## Choosing Between Systems

| Scenario | Recommendation |
|----------|---------------|
| Greenfield Flutter app | Use `TwTheme` + `context.tw` |
| Existing app with `Theme.of(context)` everywhere | Use `ThemeData.extensions` |
| App needing theme animation (`ThemeData.lerp`) | Use `ThemeData.extensions` |
| App with subtree-specific themes | Use multiple `TwTheme` wrappers |
| Maximum ergonomics | Use both — they coexist seamlessly |
