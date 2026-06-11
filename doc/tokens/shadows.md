# Shadows — `TwShadows`

> **Source:** `lib/src/tokens/tw_shadows.dart`

---

## Overview

`TwShadows` provides **7 shadow presets** matching Tailwind CSS v4's `shadow-*` utilities.

Each preset is a `const List<BoxShadow>` — ready to drop directly into any Flutter API that accepts box shadows. All values use black with alpha transparency to exactly replicate Tailwind v4's shadow color system.

---

## Token Reference

| Token | Tailwind class | Layers | Offset Y | Blur | Use case |
|-------|---------------|--------|----------|------|----------|
| `TwShadows.none` | `shadow-none` | 0 | — | — | Remove shadow |
| `TwShadows.sm` | `shadow-sm` | 1 | 1 px | 2 px | Subtle hover lift |
| `TwShadows.base` | `shadow` | 2 | 1 px | 3 px | Default, 10% opacity |
| `TwShadows.md` | `shadow-md` | 2 | 4 px | 6 px | Cards, dropdowns |
| `TwShadows.lg` | `shadow-lg` | 2 | 10 px | 15 px | Modals, popovers |
| `TwShadows.xl` | `shadow-xl` | 2 | 20 px | 25 px | Drawers, overlays |
| `TwShadows.xl2` | `shadow-2xl` | 1 | 25 px | 50 px | Full-screen dialogs, 25% opacity |

---

## Detailed Shadow Values

### `TwShadows.sm`
```
Tailwind: 0 1px 2px 0 rgb(0 0 0 / 0.05)
BoxShadow(color: Color(0x0D000000), blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1))
```

### `TwShadows.base`
```
Tailwind: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)
BoxShadow(color: Color(0x1A000000), blurRadius: 3, spreadRadius: 0, offset: Offset(0, 1))
BoxShadow(color: Color(0x1A000000), blurRadius: 2, spreadRadius: -1, offset: Offset(0, 1))
```

### `TwShadows.md`
```
Tailwind: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)
BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -1, offset: Offset(0, 4))
BoxShadow(color: Color(0x1A000000), blurRadius: 4, spreadRadius: -2, offset: Offset(0, 2))
```

### `TwShadows.lg`
```
Tailwind: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)
BoxShadow(color: Color(0x1A000000), blurRadius: 15, spreadRadius: -3, offset: Offset(0, 10))
BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -4, offset: Offset(0, 4))
```

### `TwShadows.xl`
```
Tailwind: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1)
BoxShadow(color: Color(0x1A000000), blurRadius: 25, spreadRadius: -5, offset: Offset(0, 20))
BoxShadow(color: Color(0x1A000000), blurRadius: 10, spreadRadius: -6, offset: Offset(0, 8))
```

### `TwShadows.xl2`
```
Tailwind: 0 25px 50px -12px rgb(0 0 0 / 0.25)
BoxShadow(color: Color(0x40000000), blurRadius: 50, spreadRadius: -12, offset: Offset(0, 25))
```

---

## Color Alpha Values

The opacity encoding follows the Tailwind pattern — black with hex alpha:

| Alpha hex | Opacity | Tailwind value |
|-----------|---------|----------------|
| `0x0D` | 5% | `sm` shadow layer |
| `0x1A` | 10% | most shadow layers |
| `0x40` | 25% | `xl2` heavy shadow |

---

## Extension Method Equivalents

`TwWidgetExtensions.shadow()` accepts any `List<BoxShadow>?`:

```dart
myWidget.shadow()               // defaults to TwShadows.base
myWidget.shadow(TwShadows.md)   // medium shadow
myWidget.shadow(TwShadows.none) // removes shadow (empty list)
myWidget.shadow(TwShadows.xl2)  // heavy dialog shadow
```

Text-level drop-shadow via `TwTextExtensions`:

```dart
Text('Heading').textShadow(Shadow(
  color: Colors.black45,
  blurRadius: 4,
  offset: Offset(1, 2),
))

Text('Multi').textShadows([shadow1, shadow2])
```

---

## Usage Patterns

### Card with shadow

```dart
Text('Card content')
    .p(TwSpacing.s4)
    .bg(TwColors.white)
    .rounded(TwRadii.lg.value)
    .shadow(TwShadows.md)
```

### In BoxDecoration

```dart
Container(
  decoration: BoxDecoration(
    color: TwColors.white,
    borderRadius: TwRadii.xl.all,
    boxShadow: TwShadows.lg,
  ),
)
```

### In TwStyle

```dart
const cardStyle = TwStyle(
  backgroundColor: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.all(Radius.circular(8)),
  shadows: TwShadows.md,
);
```

### Modal / dialog elevation

```dart
Dialog(
  child: Container(
    decoration: BoxDecoration(
      color: TwColors.white,
      borderRadius: TwRadii.xl2.all,
      boxShadow: TwShadows.xl2,   // max elevation for dialogs
    ),
    child: content,
  ),
)
```

### Dark mode — reduced shadows

In dark mode, `TwShadowTokens.dark()` automatically reduces all shadow levels by one step (shadows are less visible and harsher on dark backgrounds):

```dart
TwThemeData.dark()
// uses TwShadowTokens.dark() which maps:
// sm → none, base → sm, md → sm, lg → base, xl → md, xl2 → lg
```

---

## `TwShadows.byName` Map

Retrieve a shadow by its Tailwind name string:

```dart
TwShadows.byName['md']    // TwShadows.md
TwShadows.byName['xl2']   // TwShadows.xl2
TwShadows.byName['none']  // []
```
