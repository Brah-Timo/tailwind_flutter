# TwStyle — Composable Style Objects

> **Source:** `lib/src/styles/tw_style.dart`

---

## Overview

`TwStyle` is an **immutable, composable style object** — the Flutter equivalent of a CSS class or a named set of Tailwind utilities.

Instead of repeating the same chain of `.p().bg().rounded().shadow()` across your codebase, define a `TwStyle` once and reuse it everywhere with `.apply()`.

Key features:
- **Immutable** — all fields are `final`; mutation returns new instances
- **Composable** — `merge()` combines styles (right-hand wins)
- **Theme-aware** — `resolve(context)` applies dark/light variant overrides
- **Performant** — `apply()` combines decoration into a single `DecoratedBox`
- **Const-friendly** — supports `const` declarations for zero runtime cost

---

## Constructor

```dart
const TwStyle({
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  Color?             backgroundColor,
  Gradient?          backgroundGradient,
  BorderRadiusGeometry? borderRadius,
  List<BoxShadow>?   shadows,
  BoxBorder?         border,
  double?            opacity,
  double?            width,
  double?            height,
  TextStyle?         textStyle,
  Map<TwVariant, TwStyle>? variants,
})
```

---

## Properties

| Property | Type | Tailwind equivalent |
|----------|------|---------------------|
| `padding` | `EdgeInsetsGeometry?` | `p-*`, `px-*`, `py-*`, etc. |
| `margin` | `EdgeInsetsGeometry?` | `m-*`, `mx-*`, `my-*`, etc. |
| `backgroundColor` | `Color?` | `bg-{color}` |
| `backgroundGradient` | `Gradient?` | `bg-gradient-to-*` (overrides `backgroundColor`) |
| `borderRadius` | `BorderRadiusGeometry?` | `rounded-*` |
| `shadows` | `List<BoxShadow>?` | `shadow-*` |
| `border` | `BoxBorder?` | `border`, `border-{side}` |
| `opacity` | `double?` | `opacity-*` |
| `width` | `double?` | `w-*` |
| `height` | `double?` | `h-*` |
| `textStyle` | `TextStyle?` | typography utilities |
| `variants` | `Map<TwVariant, TwStyle>?` | `dark:`, `light:` variant overrides |

---

## Core Methods

### `merge(TwStyle other) → TwStyle`

Returns a new style where every non-null property from `other` overwrites the corresponding property in `this`. Null properties in `other` are inherited from `this`.

```dart
final base = TwStyle(
  padding: EdgeInsets.all(16),
  backgroundColor: Colors.white,
  shadows: TwShadows.md,
);

final featured = base.merge(TwStyle(
  backgroundColor: TwColors.blue.shade50,
  shadows: TwShadows.lg,
));
// → padding: 16 (from base), bg: blue-50, shadows: lg
```

**TextStyle merging:** When both `this` and `other` have a `textStyle`, they are merged using `TextStyle.merge()` so that font weight from `base` isn't lost when `other` sets only color.

---

### `resolve(BuildContext context) → TwStyle`

Reads `Theme.of(context).brightness` and merges the matching variant override:

```dart
const darkCard = TwStyle(
  backgroundColor: Colors.white,
  variants: {
    TwVariant.dark: TwStyle(backgroundColor: Color(0xFF1E293B)),
  },
);

// In build():
darkCard.resolve(context).apply(child: myWidget)
// Light mode → bg: white
// Dark mode  → bg: slate-800
```

If `variants` is null or no matching variant exists, returns `this` unchanged.

---

### `apply({required Widget child}) → Widget`

Wraps `child` in the widget layers needed to apply this style.

**Layer order (inside → outside):**

| Layer | Widget | Property |
|-------|--------|----------|
| 1 | `Text` merge | `textStyle` merged into Text directly |
| 2 | `DecoratedBox` | `backgroundColor`, `backgroundGradient`, `shadows`, `border` |
| 3 | `ClipRRect` | `borderRadius` (applied after decoration) |
| 4 | `Padding` | `padding` |
| 5 | `Opacity` | `opacity` |
| 6 | `SizedBox` | `width`, `height` |
| 7 | `Container` | `margin` |

The key optimization: properties 2 are **combined into one `DecoratedBox`** instead of four separate wrappers.

```dart
cardStyle.apply(child: Text('Hello'))
```

---

### `copyWith({...}) → TwStyle`

Creates a copy with specified fields replaced:

```dart
final wider = cardStyle.copyWith(
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
);
```

All parameters are optional and nullable. Only non-null arguments replace the original value.

---

## Built-in Presets

### `TwStyle.card`

```
padding: EdgeInsets.all(16)
backgroundColor: Color(0xFFFFFFFF)
borderRadius: BorderRadius.all(Radius.circular(8))  // rounded-lg
shadows: TwShadows.md
border: Border.all(color: Color(0xFFE5E7EB), width: 1)  // gray-200
```

### `TwStyle.ghost`

```
padding: EdgeInsets.all(16)
borderRadius: BorderRadius.all(Radius.circular(8))
border: Border.all(color: Color(0xFFE5E7EB), width: 1)
// no background, no shadow
```

### `TwStyle.badge`

```
padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2)
borderRadius: BorderRadius.all(Radius.circular(9999))  // rounded-full
// no background — set via merge
```

---

## Variants and Dark Mode

`TwVariant` has two values: `TwVariant.light` and `TwVariant.dark`.

```dart
// Define a style with a dark override
const themedButton = TwStyle(
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  backgroundColor: Color(0xFFEFF6FF),     // blue-50
  borderRadius: BorderRadius.all(Radius.circular(8)),
  textStyle: TextStyle(color: Color(0xFF1D4ED8), fontWeight: FontWeight.w600),
  variants: {
    TwVariant.dark: TwStyle(
      backgroundColor: Color(0xFF1E3A8A),  // blue-900
      textStyle: TextStyle(color: Color(0xFFBFDBFE)),  // blue-200
    ),
  },
);

// In build():
final resolved = themedButton.resolve(context);
resolved.apply(child: Text('Click me'))
```

---

## Usage Patterns

### Define once, reuse everywhere

```dart
// In a theme_constants.dart file
const kCardStyle = TwStyle(
  padding: EdgeInsets.all(16),
  backgroundColor: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(12)),
  shadows: TwShadows.md,
);

const kBadgeSuccess = TwStyle(
  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
  backgroundColor: Color(0xFFDCFCE7),   // green-100
  borderRadius: BorderRadius.all(Radius.circular(9999)),
);

// Use:
kCardStyle.apply(child: myCard)
kBadgeSuccess.apply(child: Text('Active').textColor(TwColors.green.shade700).semibold())
```

### Merge for variants

```dart
// Base + state variations
const base = TwStyle.card;
const selected = TwStyle(
  backgroundColor: Color(0xFFEFF6FF),   // blue-50
  border: Border.fromBorderSide(BorderSide(color: Color(0xFF3B82F6), width: 2)),
);
const disabled = TwStyle(opacity: 0.4);

// Usage:
final style = isDisabled
    ? base.merge(disabled)
    : isSelected
        ? base.merge(selected)
        : base;

style.apply(child: myCard)
```

### Combine with TwStyleMerger

```dart
TwStyleMerger.mergeAll([
  TwStyle.card,
  if (isSelected) selectedOverride,
  if (isPrimary) primaryOverride,
]).apply(child: content)
```

### Step-based severity styling

```dart
final severityStyles = [
  TwStyle(backgroundColor: TwColors.green.shade50),   // 0: ok
  TwStyle(backgroundColor: TwColors.yellow.shade50),  // 1: warning
  TwStyle(backgroundColor: TwColors.red.shade50),     // 2: error
];

TwStyleMerger.atIndex(TwStyle.card, severityStyles, alert.level)
    .apply(child: alertWidget)
```

---

## Equality

`TwStyle` implements `==` and `hashCode` based on all 11 style properties (excluding `variants`). This means:

```dart
TwStyle.card == TwStyle.card   // true (same const)
const a = TwStyle(padding: EdgeInsets.all(16));
const b = TwStyle(padding: EdgeInsets.all(16));
a == b   // true
```

---

## Performance Notes

- Use `const TwStyle(...)` wherever possible — zero allocation at runtime
- `apply()` combines background, gradient, shadow, and border into **one** `DecoratedBox` instead of four separate wrappers
- `borderRadius` adds one extra `ClipRRect` layer; unavoidable for correct clipping
- `resolve()` returns `this` when there are no variants or no active variant — zero overhead in that case
- The `textStyle` injection directly modifies the `Text` widget rather than adding a `DefaultTextStyle` wrapper
