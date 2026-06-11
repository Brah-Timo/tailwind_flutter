# Opacity — `TwOpacity`

> **Source:** `lib/src/tokens/tw_opacity.dart`

---

## Overview

`TwOpacity` provides **21 opacity steps** matching Tailwind CSS v4's `opacity-*` utilities.

All values are `const double` in the range `[0.0, 1.0]`. They plug directly into Flutter's `Opacity` widget, `Color.withOpacity()`, and the `.opacity()` extension method.

---

## Complete Token Reference

| Token | Tailwind class | Value | Common use |
|-------|---------------|-------|------------|
| `TwOpacity.o0` | `opacity-0` | 0.00 | Fully transparent / hidden |
| `TwOpacity.o5` | `opacity-5` | 0.05 | Ghost overlays |
| `TwOpacity.o10` | `opacity-10` | 0.10 | Very faint overlays |
| `TwOpacity.o15` | `opacity-15` | 0.15 | |
| `TwOpacity.o20` | `opacity-20` | 0.20 | Disabled states |
| `TwOpacity.o25` | `opacity-25` | 0.25 | Placeholder text |
| `TwOpacity.o30` | `opacity-30` | 0.30 | |
| `TwOpacity.o35` | `opacity-35` | 0.35 | |
| `TwOpacity.o40` | `opacity-40` | 0.40 | |
| `TwOpacity.o45` | `opacity-45` | 0.45 | |
| `TwOpacity.o50` | `opacity-50` | 0.50 | Half-transparent |
| `TwOpacity.o55` | `opacity-55` | 0.55 | |
| `TwOpacity.o60` | `opacity-60` | 0.60 | |
| `TwOpacity.o65` | `opacity-65` | 0.65 | |
| `TwOpacity.o70` | `opacity-70` | 0.70 | |
| `TwOpacity.o75` | `opacity-75` | 0.75 | Muted interactive |
| `TwOpacity.o80` | `opacity-80` | 0.80 | |
| `TwOpacity.o85` | `opacity-85` | 0.85 | |
| `TwOpacity.o90` | `opacity-90` | 0.90 | Slightly faded |
| `TwOpacity.o95` | `opacity-95` | 0.95 | Almost opaque |
| `TwOpacity.o100` | `opacity-100` | 1.00 | Fully opaque (default) |

---

## Extension Method

`TwWidgetExtensions.opacity()` applies the value via Flutter's `Opacity` widget. The value is automatically clamped to `[0.0, 1.0]`:

```dart
myWidget.opacity(TwOpacity.o50)    // 50% transparent
myWidget.opacity(TwOpacity.o0)     // invisible (preserves layout space)
myWidget.opacity(TwOpacity.o75)    // 75% opaque
```

> **Note:** `Opacity` adds a layer to the widget tree. For performance-critical situations, prefer `Color.withOpacity()` on colors directly, or use `AnimatedOpacity` for transitions.

---

## Usage Patterns

### Disabled state

```dart
myButton.opacity(isEnabled ? TwOpacity.o100 : TwOpacity.o40)
```

### Overlay / scrim

```dart
Container(
  color: TwColors.black.withOpacity(TwOpacity.o50),   // half-black scrim
)

// Via extension
Container(color: TwColors.black)
    .opacity(TwOpacity.o50)
```

### Placeholder / helper text

```dart
Text('Enter email')
    .textColor(TwColors.slate.shade700)
    .opacity(TwOpacity.o50)
```

### Animated fade

```dart
AnimatedOpacity(
  opacity: isVisible ? TwOpacity.o100 : TwOpacity.o0,
  duration: const Duration(milliseconds: 200),
  child: myWidget,
)
```

### Color with embedded opacity

Instead of the widget-level `Opacity` wrapper, apply opacity directly to a color:

```dart
// These are equivalent:
Text('Hi').textColor(TwColors.blue.shade600)
    .opacity(TwOpacity.o75)

// vs (no extra widget layer):
Text('Hi').textColor(
  TwColors.blue.shade600.withOpacity(TwOpacity.o75),
)
```

---

## `TwOpacity.all` List

```dart
TwOpacity.all   // List<double> — 21 values from 0.0 to 1.0
```

---

## Via Theme

```dart
final opacity = context.tw.opacity;
opacity.o0    // 0.0
opacity.o25   // 0.25
opacity.o50   // 0.5
opacity.o75   // 0.75
opacity.o100  // 1.0
```

> Note: `TwThemeData.opacity` exposes `TwOpacityTokens` with 5 key steps: `o0`, `o25`, `o50`, `o75`, `o100`. For the full 21-step scale, use `TwOpacity` directly.
