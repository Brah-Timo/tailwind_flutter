# Typography — `TwFontSizes`, `TwFontWeights`, `TwFontSizeValue`

> **Sources:** `lib/src/tokens/tw_font_sizes.dart` · `lib/src/tokens/tw_font_weights.dart`

---

## Overview

Typography tokens cover:
- **`TwFontSizeValue`** — value class pairing a size with its Tailwind-recommended line-height
- **`TwFontSizes`** — 13 `TwFontSizeValue` constants (`xs` → `xl9`)
- **`TwFontWeights`** — 9 `FontWeight` constants (`thin` → `black`)

All values are `const`.

---

## `TwFontSizeValue` Class

Tailwind always couples a font size with a recommended line-height. `TwFontSizeValue` enforces that pairing so you never accidentally mismatche them.

```dart
class TwFontSizeValue {
  final double size;        // font size in logical pixels
  final double lineHeight;  // recommended line-height in logical pixels

  // Returns a TextStyle with fontSize + height (line-height multiplier) set
  TextStyle get textStyle => TextStyle(
    fontSize: size,
    height: lineHeight / size,   // Flutter TextStyle.height is a multiplier
  );
}
```

### Using `textStyle`

```dart
Text('Hello', style: TwFontSizes.lg.textStyle)
// equivalent to:
Text('Hello', style: TextStyle(fontSize: 18, height: 1.5556))
```

---

## Font Size Tokens

| Token | Tailwind class | Size | Line-height | Height multiplier |
|-------|---------------|------|-------------|-------------------|
| `TwFontSizes.xs` | `text-xs` | 12 px | 16 px | 1.333 |
| `TwFontSizes.sm` | `text-sm` | 14 px | 20 px | 1.429 |
| `TwFontSizes.base` | `text-base` | 16 px | 24 px | 1.500 |
| `TwFontSizes.lg` ⭐ | `text-lg` | 18 px | 28 px | 1.556 |
| `TwFontSizes.xl` | `text-xl` | 20 px | 28 px | 1.400 |
| `TwFontSizes.xl2` | `text-2xl` | 24 px | 32 px | 1.333 |
| `TwFontSizes.xl3` | `text-3xl` | 30 px | 36 px | 1.200 |
| `TwFontSizes.xl4` | `text-4xl` | 36 px | 40 px | 1.111 |
| `TwFontSizes.xl5` | `text-5xl` | 48 px | 48 px | 1.000 |
| `TwFontSizes.xl6` | `text-6xl` | 60 px | 60 px | 1.000 |
| `TwFontSizes.xl7` | `text-7xl` | 72 px | 72 px | 1.000 |
| `TwFontSizes.xl8` | `text-8xl` | 96 px | 96 px | 1.000 |
| `TwFontSizes.xl9` | `text-9xl` | 128 px | 128 px | 1.000 |

> ⭐ `lg` (18 px) is the recommended size for section headings.

**Note:** Sizes xl5 and above use a `height` multiplier of `1.0` (tight line-height), matching Tailwind's CSS `line-height: 1`.

---

## Font Weight Tokens

| Token | Tailwind class | Flutter value | Numeric |
|-------|---------------|---------------|---------|
| `TwFontWeights.thin` | `font-thin` | `FontWeight.w100` | 100 |
| `TwFontWeights.extralight` | `font-extralight` | `FontWeight.w200` | 200 |
| `TwFontWeights.light` | `font-light` | `FontWeight.w300` | 300 |
| `TwFontWeights.normal` | `font-normal` | `FontWeight.w400` | 400 |
| `TwFontWeights.medium` | `font-medium` | `FontWeight.w500` | 500 |
| `TwFontWeights.semibold` | `font-semibold` | `FontWeight.w600` | 600 |
| `TwFontWeights.bold` | `font-bold` | `FontWeight.w700` | 700 |
| `TwFontWeights.extrabold` | `font-extrabold` | `FontWeight.w800` | 800 |
| `TwFontWeights.black` | `font-black` | `FontWeight.w900` | 900 |

---

## Extension Method Equivalents

`TwTextExtensions` on `Text` wraps these tokens:

### Font size

```dart
Text('Title').fontSize(TwFontSizes.xl3)  // sets size + paired line-height
Text('Body').textSize(18)                // arbitrary size (no paired lh)
```

### Font weight

```dart
Text('Bold').bold()           // font-bold (w700)
Text('Semi').semibold()       // font-semibold (w600)
Text('Med').medium()          // font-medium (w500)
Text('Light').light()         // font-light (w300)
Text('Thin').thin()           // font-thin (w100)
Text('Xbold').extrabold()     // font-extrabold (w800)
Text('Black').black()         // font-black (w900)
Text('Custom').fontWeight(TwFontWeights.semibold)  // arbitrary
```

### Letter spacing

```dart
Text('Tight').letterSpacing(-0.4)   // tracking-tight
Text('Wide').letterSpacing(0.8)     // tracking-wider
```

### Line height override

```dart
Text('Custom LH').lineHeight(1.8)   // sets TextStyle.height = 1.8
```

---

## Usage Patterns

### Hero heading

```dart
Text('Welcome Back')
    .bold()
    .fontSize(TwFontSizes.xl4)     // 36 px, tight line-height
    .textColor(TwColors.slate.shade900)
    .letterSpacing(-0.5)
```

### Body text

```dart
Text('Lorem ipsum dolor sit amet…')
    .fontSize(TwFontSizes.base)     // 16 px / 24 px lh
    .textColor(TwColors.slate.shade600)
    .lineHeight(1.75)               // slightly looser for readability
```

### Badge label

```dart
Text('NEW')
    .bold()
    .fontSize(TwFontSizes.xs)       // 12 px
    .textColor(TwColors.blue.shade700)
    .uppercase()
    .letterSpacing(0.5)
```

### Using `textStyle` getter directly

```dart
// For explicit TextStyle usage in non-extension contexts
final headingStyle = TwFontSizes.xl2.textStyle.copyWith(
  fontWeight: TwFontWeights.semibold,
  color: TwColors.slate.shade900,
);

Text('Section', style: headingStyle)
```

---

## `TwFontSizes.all` List

```dart
TwFontSizes.all   // List<TwFontSizeValue> — 13 values from xs to xl9
```

---

## `TwFontWeights.all` List

```dart
TwFontWeights.all   // List<FontWeight> — 9 values from thin to black
```

---

## Via Theme

```dart
final typo = context.tw.typography;
typo.base.size         // 16.0
typo.lg.lineHeight     // 28.0
typo.xl3.textStyle     // TextStyle(fontSize: 30, height: 1.2)
typo.semibold          // FontWeight.w600
```

> Note: `TwThemeData.typography` exposes a `TwTypographyTokens` instance that includes font sizes `xs`–`xl4` and weights `thin`–`bold`. For larger sizes (`xl5`–`xl9`), use `TwFontSizes` directly.
