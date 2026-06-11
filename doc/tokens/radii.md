# Radii — `TwRadii` & `TwRadiiValue`

> **Source:** `lib/src/tokens/tw_radii.dart`

---

## Overview

`TwRadii` provides **10 border-radius tokens** matching Tailwind CSS v4's `rounded-*` utilities.

Each token is a `TwRadiiValue` — a value class that holds the pixel radius and exposes computed `BorderRadius` getters for every possible corner combination. All values are `const`.

---

## `TwRadiiValue` Class

```dart
class TwRadiiValue {
  final double value;    // radius in logical pixels

  // Full BorderRadius getters
  BorderRadius get all         => BorderRadius.circular(value);
  BorderRadius get top         => BorderRadius.vertical(top: Radius.circular(value));
  BorderRadius get bottom      => BorderRadius.vertical(bottom: Radius.circular(value));
  BorderRadius get left        => BorderRadius.horizontal(left: Radius.circular(value));
  BorderRadius get right       => BorderRadius.horizontal(right: Radius.circular(value));
  BorderRadius get topLeft     => BorderRadius.only(topLeft: Radius.circular(value));
  BorderRadius get topRight    => BorderRadius.only(topRight: Radius.circular(value));
  BorderRadius get bottomLeft  => BorderRadius.only(bottomLeft: Radius.circular(value));
  BorderRadius get bottomRight => BorderRadius.only(bottomRight: Radius.circular(value));
}
```

---

## Token Reference

| Token | Tailwind class | Radius | Use case |
|-------|---------------|--------|----------|
| `TwRadii.none` | `rounded-none` | 0 px | Sharp corners |
| `TwRadii.sm` | `rounded-sm` | 2 px | Subtle rounding |
| `TwRadii.base` | `rounded` | 4 px | Default Flutter rounding |
| `TwRadii.md` | `rounded-md` | 6 px | Inputs, buttons |
| `TwRadii.lg` ⭐ | `rounded-lg` | **8 px** | Cards, modals |
| `TwRadii.xl` | `rounded-xl` | 12 px | Large cards, panels |
| `TwRadii.xl2` | `rounded-2xl` | 16 px | Feature cards |
| `TwRadii.xl3` | `rounded-3xl` | 24 px | Sheets, dialogs |
| `TwRadii.full` | `rounded-full` | 9999 px | Pills, circles |
| `TwRadii.inner` | *(inner element)* | 2 px | Nested rounded elements |

> ⭐ `lg` (8 px) is the most common card and container radius.

---

## `TwRadiiValue` Getters Reference

```dart
final r = TwRadii.xl;   // 12 px

r.value           // 12.0 (double)
r.all             // BorderRadius.circular(12)
r.top             // BorderRadius.vertical(top: Radius.circular(12))
r.bottom          // BorderRadius.vertical(bottom: Radius.circular(12))
r.left            // BorderRadius.horizontal(left: Radius.circular(12))
r.right           // BorderRadius.horizontal(right: Radius.circular(12))
r.topLeft         // BorderRadius.only(topLeft: Radius.circular(12))
r.topRight        // BorderRadius.only(topRight: Radius.circular(12))
r.bottomLeft      // BorderRadius.only(bottomLeft: Radius.circular(12))
r.bottomRight     // BorderRadius.only(bottomRight: Radius.circular(12))
```

---

## Extension Method Equivalents

`TwWidgetExtensions` provides:

| Extension | Description |
|-----------|-------------|
| `.rounded()` | All corners, defaults to `TwRadii.base` (4 px) if no arg |
| `.rounded(radius)` | All corners with specific `double` radius |
| `.roundedWith(borderRadius)` | Any custom `BorderRadius` instance |
| `.clipOval()` | Oval/circle clip |
| `.clipRect()` | Rectangular clip |

---

## Usage Patterns

### Basic rounded corners

```dart
// Using .rounded() extension
myWidget.rounded()                    // 4 px — TwRadii.base
myWidget.rounded(TwRadii.lg.value)   // 8 px
myWidget.rounded(TwRadii.xl2.value)  // 16 px
myWidget.rounded(TwRadii.full.value) // pill / circle
```

### Asymmetric rounding

```dart
// Only top corners — useful for bottom-sheets or tab panels
myWidget.roundedWith(TwRadii.xl.top)

// Only bottom corners
myWidget.roundedWith(TwRadii.lg.bottom)

// Only top-left corner
myWidget.roundedWith(TwRadii.xl.topLeft)
```

### In BoxDecoration / ClipRRect

```dart
// Direct BorderRadius in BoxDecoration
Container(
  decoration: BoxDecoration(
    borderRadius: TwRadii.xl2.all,     // all corners, 16 px
    color: TwColors.white,
  ),
)

// ClipRRect
ClipRRect(
  borderRadius: TwRadii.xl.top,        // top corners only
  child: Image.network(url),
)
```

### In TwStyle

```dart
const cardStyle = TwStyle(
  borderRadius: BorderRadius.all(Radius.circular(8)),   // TwRadii.lg.value
);

// Or use the value directly
final r = TwRadii.xl2.value;   // 16.0
TwStyle(borderRadius: BorderRadius.circular(r))
```

### Pill buttons

```dart
Text('Submit')
    .bold()
    .textColor(TwColors.white)
    .px(TwSpacing.s6)
    .py(TwSpacing.s2)
    .bg(TwColors.blue.shade600)
    .rounded(TwRadii.full.value)   // pill shape
```

### Avatar / icon circle

```dart
Image.network(avatarUrl)
    .square(40)               // 40×40 px
    .clipOval()               // perfect circle
// or:
    .rounded(TwRadii.full.value)
```

---

## `TwRadii.all` List

```dart
TwRadii.all   // List<TwRadiiValue> — 9 values from none to full (inner excluded)
```

---

## Inner Radius Pattern

The `inner` token (2 px) is useful for maintaining visual consistency when nesting rounded containers:

```dart
// Outer container: 8 px (rounded-lg)
// Inner element:   2 px (inner) — preserves the "inset" look
Container(
  decoration: BoxDecoration(
    borderRadius: TwRadii.lg.all,
    color: TwColors.blue.shade50,
  ),
  padding: TwSpacing.s2.all,
  child: Container(
    decoration: BoxDecoration(
      borderRadius: TwRadii.inner.all,  // 2 px inner
      color: TwColors.white,
    ),
  ),
)
```
