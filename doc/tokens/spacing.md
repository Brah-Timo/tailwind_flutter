# Spacing — `TwSpacing` & `TwSpacingValue`

> **Source:** `lib/src/tokens/tw_spacing.dart`

---

## Overview

`TwSpacing` provides **35 spacing tokens** matching the Tailwind CSS v4 default spacing scale.

Each token is a `TwSpacingValue` — a tiny value class that wraps a pixel amount and exposes convenience `EdgeInsets` getters for every direction. All values are `const`.

**1 Tailwind spacing unit = 4 logical pixels** (identical to the CSS rem-based scale at 16 px root font size).

---

## `TwSpacingValue` Class

```dart
class TwSpacingValue {
  final double value;         // raw logical-pixel amount
  double get px => value;     // alias for value

  // EdgeInsets getters
  EdgeInsets get all    => EdgeInsets.all(value);
  EdgeInsets get x      => EdgeInsets.symmetric(horizontal: value);
  EdgeInsets get y      => EdgeInsets.symmetric(vertical: value);
  EdgeInsets get top    => EdgeInsets.only(top: value);
  EdgeInsets get bottom => EdgeInsets.only(bottom: value);
  EdgeInsets get left   => EdgeInsets.only(left: value);
  EdgeInsets get right  => EdgeInsets.only(right: value);
}
```

---

## Complete Token Reference

| Token | Tailwind class | Value (px) | EdgeInsets.all equivalent |
|-------|---------------|-----------|--------------------------|
| `TwSpacing.s0` | `space-0` | 0 px | `EdgeInsets.zero` |
| `TwSpacing.s0_5` | `space-0.5` | 2 px | `EdgeInsets.all(2)` |
| `TwSpacing.s1` | `space-1` | 4 px | `EdgeInsets.all(4)` |
| `TwSpacing.s1_5` | `space-1.5` | 6 px | `EdgeInsets.all(6)` |
| `TwSpacing.s2` | `space-2` | 8 px | `EdgeInsets.all(8)` |
| `TwSpacing.s2_5` | `space-2.5` | 10 px | `EdgeInsets.all(10)` |
| `TwSpacing.s3` | `space-3` | 12 px | `EdgeInsets.all(12)` |
| `TwSpacing.s3_5` | `space-3.5` | 14 px | `EdgeInsets.all(14)` |
| `TwSpacing.s4` ⭐ | `space-4` | **16 px** | `EdgeInsets.all(16)` |
| `TwSpacing.s5` | `space-5` | 20 px | `EdgeInsets.all(20)` |
| `TwSpacing.s6` | `space-6` | 24 px | `EdgeInsets.all(24)` |
| `TwSpacing.s7` | `space-7` | 28 px | `EdgeInsets.all(28)` |
| `TwSpacing.s8` | `space-8` | 32 px | `EdgeInsets.all(32)` |
| `TwSpacing.s9` | `space-9` | 36 px | `EdgeInsets.all(36)` |
| `TwSpacing.s10` | `space-10` | 40 px | `EdgeInsets.all(40)` |
| `TwSpacing.s11` | `space-11` | 44 px | `EdgeInsets.all(44)` |
| `TwSpacing.s12` | `space-12` | 48 px | `EdgeInsets.all(48)` |
| `TwSpacing.s14` | `space-14` | 56 px | `EdgeInsets.all(56)` |
| `TwSpacing.s16` | `space-16` | 64 px | `EdgeInsets.all(64)` |
| `TwSpacing.s20` | `space-20` | 80 px | `EdgeInsets.all(80)` |
| `TwSpacing.s24` | `space-24` | 96 px | `EdgeInsets.all(96)` |
| `TwSpacing.s28` | `space-28` | 112 px | `EdgeInsets.all(112)` |
| `TwSpacing.s32` | `space-32` | 128 px | `EdgeInsets.all(128)` |
| `TwSpacing.s36` | `space-36` | 144 px | `EdgeInsets.all(144)` |
| `TwSpacing.s40` | `space-40` | 160 px | `EdgeInsets.all(160)` |
| `TwSpacing.s44` | `space-44` | 176 px | `EdgeInsets.all(176)` |
| `TwSpacing.s48` | `space-48` | 192 px | `EdgeInsets.all(192)` |
| `TwSpacing.s52` | `space-52` | 208 px | `EdgeInsets.all(208)` |
| `TwSpacing.s56` | `space-56` | 224 px | `EdgeInsets.all(224)` |
| `TwSpacing.s60` | `space-60` | 240 px | `EdgeInsets.all(240)` |
| `TwSpacing.s64` | `space-64` | 256 px | `EdgeInsets.all(256)` |
| `TwSpacing.s72` | `space-72` | 288 px | `EdgeInsets.all(288)` |
| `TwSpacing.s80` | `space-80` | 320 px | `EdgeInsets.all(320)` |
| `TwSpacing.s96` | `space-96` | 384 px | `EdgeInsets.all(384)` |

> ⭐ `s4` (16 px) is the most commonly used — equivalent to Tailwind's `p-4`.

---

## `TwSpacingValue` Getters Reference

Every `TwSpacingValue` instance exposes these computed `EdgeInsets`:

```dart
final s = TwSpacing.s4;   // 16 px

s.px      // 16.0          (plain double)
s.all     // EdgeInsets.all(16)
s.x       // EdgeInsets.symmetric(horizontal: 16)
s.y       // EdgeInsets.symmetric(vertical: 16)
s.top     // EdgeInsets.only(top: 16)
s.bottom  // EdgeInsets.only(bottom: 16)
s.left    // EdgeInsets.only(left: 16)
s.right   // EdgeInsets.only(right: 16)
```

---

## Extension Method Equivalents

`TwWidgetExtensions` maps directly onto `TwSpacingValue`:

| Extension | Tailwind | EdgeInsets applied |
|-----------|----------|--------------------|
| `.p(v)` | `p-{n}` | `v.all` |
| `.px(v)` | `px-{n}` | `v.x` |
| `.py(v)` | `py-{n}` | `v.y` |
| `.pt(v)` | `pt-{n}` | `v.top` |
| `.pb(v)` | `pb-{n}` | `v.bottom` |
| `.pl(v)` | `pl-{n}` | `v.left` |
| `.pr(v)` | `pr-{n}` | `v.right` |
| `.m(v)` | `m-{n}` | `v.all` |
| `.mx(v)` | `mx-{n}` | `v.x` |
| `.my(v)` | `my-{n}` | `v.y` |
| `.mt(v)` | `mt-{n}` | `v.top` |
| `.mb(v)` | `mb-{n}` | `v.bottom` |
| `.ml(v)` | `ml-{n}` | `v.left` |
| `.mr(v)` | `mr-{n}` | `v.right` |

---

## Usage Patterns

### Basic padding

```dart
Text('Hello')
    .p(TwSpacing.s4)    // padding all: 16 px
```

### Directional padding

```dart
myWidget
    .px(TwSpacing.s6)   // horizontal: 24 px
    .py(TwSpacing.s3)   // vertical: 12 px
```

### Sizing

```dart
myWidget.width(TwSpacing.s64.px)   // 256 px wide
myWidget.height(TwSpacing.s48.px)  // 192 px tall
```

### Raw px value in any context

```dart
SizedBox(
  width:  TwSpacing.s32.px,   // 128 px
  height: TwSpacing.s16.px,   // 64 px
)

Row(
  children: [
    SizedBox(width: TwSpacing.s2.px),  // 8 px gap
    Text('Item'),
  ],
)
```

### EdgeInsets directly

```dart
Padding(
  padding: TwSpacing.s4.all,   // EdgeInsets.all(16)
)

Padding(
  padding: TwSpacing.s6.x,     // EdgeInsets.symmetric(horizontal: 24)
)
```

### Mixed asymmetric padding (use raw EdgeInsets)

```dart
myWidget.padding(const EdgeInsets.fromLTRB(16, 8, 16, 12))
```

---

## `TwSpacing.all` List

The full ordered list is available for iteration or documentation generation:

```dart
TwSpacing.all   // List<TwSpacingValue> — 34 values from s0 to s96
```

---

## Theme Access

When using `TwTheme`, spacing tokens are grouped in `TwThemeData.spacing` (a `TwSpacingTokens` instance exposing the most common 21 values):

```dart
final spacing = context.tw.spacing;
spacing.s4.px    // 16.0
spacing.s6.all   // EdgeInsets.all(24)
```
