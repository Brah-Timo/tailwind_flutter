# Text Extensions — `TwTextExtensions`

> **Source:** `lib/src/extensions/text_extensions.dart`
> **Extension on:** `Text`

---

## Overview

`TwTextExtensions` adds **30+ chainable utility methods** to Flutter's `Text` widget, directly mirroring Tailwind's typography utilities (`text-*`, `font-*`, `uppercase`, `underline`, etc.).

Every method returns a **new** `Text` widget, preserving all existing properties from the original (`key`, `textAlign`, `overflow`, `maxLines`, `textDirection`, etc.) — nothing is silently discarded.

---

## Critical Rule: Order of Extensions

```dart
// ✅ CORRECT — text extensions first, then widget extensions
Text('Hello')
    .bold()                              // TwTextExtensions
    .fontSize(TwFontSizes.xl)            // TwTextExtensions
    .textColor(TwColors.blue.shade600)   // TwTextExtensions
    .p(TwSpacing.s4)                     // ← PIVOT to TwWidgetExtensions
    .bg(TwColors.white)                  // TwWidgetExtensions

// ❌ WRONG — widget extension called before text extensions
Text('Hello').p(TwSpacing.s4).bold()    // compile error: no .bold() on Widget
```

Once any `TwWidgetExtensions` method is called, the expression type becomes `Widget` and the `Text`-specific methods become unavailable.

---

## Method Reference

### Font Weight

| Method | Tailwind | FontWeight |
|--------|----------|------------|
| `.bold()` | `font-bold` | `w700` |
| `.semibold()` | `font-semibold` | `w600` |
| `.medium()` | `font-medium` | `w500` |
| `.light()` | `font-light` | `w300` |
| `.thin()` | `font-thin` | `w100` |
| `.extrabold()` | `font-extrabold` | `w800` |
| `.black()` | `font-black` | `w900` |
| `.fontWeight(FontWeight)` | `font-{weight}` | any |

```dart
Text('Title').bold()
Text('Label').semibold()
Text('Body').fontWeight(TwFontWeights.medium)
```

---

### Font Size

| Method | Description |
|--------|-------------|
| `.fontSize(TwFontSizeValue)` | Sets size **and** paired line-height from token |
| `.textSize(double)` | Sets an arbitrary size (no automatic line-height) |

```dart
Text('Title').fontSize(TwFontSizes.xl3)    // 30 px, lh 36 px
Text('Body').fontSize(TwFontSizes.base)    // 16 px, lh 24 px
Text('Custom').textSize(22)                // 22 px, no lh change
```

---

### Color

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.textColor(Color)` | `text-{color}-{shade}` | Sets text color |

```dart
Text('Hello').textColor(TwColors.slate.shade700)
Text('Link').textColor(TwColors.blue.shade600)
Text('Error').textColor(TwColors.red.shade500)
```

---

### Font Family

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.fontFamily(String)` | `font-{family}` | Sets font family by name |

```dart
Text('Code snippet').fontFamily('Courier New')
Text('Body text').fontFamily('Inter')
```

---

### Font Style

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.italic()` | `italic` | `FontStyle.italic` |
| `.notItalic()` | `not-italic` | `FontStyle.normal` |

```dart
Text('Emphasis').italic()
Text('Normal').notItalic()
```

---

### Text Decoration

| Method | Tailwind | Decoration |
|--------|----------|------------|
| `.underline()` | `underline` | `TextDecoration.underline` |
| `.lineThrough()` | `line-through` | `TextDecoration.lineThrough` |
| `.overline()` | `overline` | `TextDecoration.overline` |
| `.noDecoration()` | `no-underline` | `TextDecoration.none` |

```dart
Text('Link').underline().textColor(TwColors.blue.shade600)
Text('Sale').lineThrough().textColor(TwColors.gray.shade400)
```

---

### Letter Spacing

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.letterSpacing(double)` | `tracking-{size}` | Logical-pixel letter spacing |

Tailwind reference values (at base 16 px font):
```
tracking-tighter → -0.05em ≈ -0.8 px
tracking-tight   → -0.025em ≈ -0.4 px
tracking-normal  → 0
tracking-wide    → 0.025em ≈ 0.4 px
tracking-wider   → 0.05em ≈ 0.8 px
tracking-widest  → 0.1em ≈ 1.6 px
```

```dart
Text('LABEL').uppercase().letterSpacing(1.6)    // widest
Text('Heading').letterSpacing(-0.5)             // tighter
```

---

### Line Height

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.lineHeight(double)` | `leading-{size}` | `TextStyle.height` multiplier |

`TextStyle.height` is a multiplier relative to the font size. `1.5` with 16 px font = 24 px line height.

```dart
Text('Body text').lineHeight(1.75)     // leading-7 equivalent
Text('Tight').lineHeight(1.0)          // leading-none
Text('Normal').lineHeight(1.5)         // leading-normal
```

---

### Text Transform

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.uppercase()` | `uppercase` | Transforms data to `UPPERCASE` |
| `.lowercase()` | `lowercase` | Transforms data to `lowercase` |
| `.capitalize()` | `capitalize` | Title Case First Letter Of Each Word |
| `.titleCase()` | — | Alias for `.capitalize()` |

```dart
Text('hello world').uppercase()     // 'HELLO WORLD'
Text('HELLO WORLD').lowercase()     // 'hello world'
Text('hello world').capitalize()    // 'Hello World'
```

> **Note:** These methods rebuild the `Text` widget with transformed `data`. They mutate the string content, not just the style.

---

### Text Alignment

| Method | Tailwind | TextAlign |
|--------|----------|-----------|
| `.withTextAlign(TextAlign)` | `text-{align}` | Any `TextAlign` value |
| `.textCenter()` | `text-center` | `TextAlign.center` |
| `.textLeft()` | `text-left` | `TextAlign.left` |
| `.textRight()` | `text-right` | `TextAlign.right` |
| `.start()` | `text-start` | `TextAlign.start` (RTL-aware) |
| `.end()` | `text-end` | `TextAlign.end` (RTL-aware) |
| `.justify()` | `text-justify` | `TextAlign.justify` |

```dart
Text('Centered').textCenter()
Text('Right').textRight()
Text('RTL-safe').start()
Text('Justified paragraph text').justify()
Text('Custom').withTextAlign(TextAlign.center)
```

---

### Overflow & Max Lines

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.ellipsis({int maxLines = 1})` | `truncate` | Clips with `…`, limits to N lines |
| `.clip()` | `overflow-hidden` | Hard clips overflowing text |
| `.withMaxLines(int)` | — | Sets max line count, keeps overflow setting |
| `.noWrap()` | `whitespace-nowrap` | Single line, `softWrap: false` |

```dart
Text('A very long string').ellipsis()              // 1 line + …
Text('A very long string').ellipsis(maxLines: 3)   // 3 lines + …
Text('A very long string').clip()                  // hard clip
Text('Long label').noWrap()                        // no wrap, single line
Text('Multi line').withMaxLines(5)                 // up to 5 lines
```

---

### Text Shadows

| Method | Description |
|--------|-------------|
| `.textShadow(Shadow)` | Single drop-shadow on text |
| `.textShadows(List<Shadow>)` | Multiple shadows on text |

```dart
Text('Heading').textShadow(
  Shadow(color: Colors.black45, blurRadius: 4, offset: Offset(1, 2)),
)
```

---

## Full Chain Examples

### Navigation link

```dart
Text('About Us')
    .semibold()
    .fontSize(TwFontSizes.sm)
    .textColor(TwColors.slate.shade600)
    .letterSpacing(0.2)
```

### Page title

```dart
Text('Dashboard')
    .bold()
    .fontSize(TwFontSizes.xl3)
    .textColor(TwColors.slate.shade900)
    .letterSpacing(-0.5)
    .textCenter()
```

### Status badge label

```dart
Text('ACTIVE')
    .semibold()
    .fontSize(TwFontSizes.xs)
    .textColor(TwColors.green.shade700)
    .uppercase()
    .letterSpacing(1.0)
    // pivot to widget extensions:
    .px(TwSpacing.s2)
    .py(TwSpacing.s0_5)
    .bg(TwColors.green.shade50)
    .rounded(TwRadii.full.value)
```

### Truncated list item title

```dart
Text(item.title)
    .semibold()
    .fontSize(TwFontSizes.sm)
    .textColor(TwColors.slate.shade900)
    .ellipsis()   // single line with …
```

### Long-form body

```dart
Text(articleBody)
    .fontSize(TwFontSizes.base)
    .textColor(TwColors.slate.shade700)
    .lineHeight(1.75)
    .withMaxLines(10)
```

---

## Internal Implementation

All style-modifying methods delegate to `_copyWith()`, which merges properties onto the existing `TextStyle` and preserves all non-style `Text` properties:

```dart
Text _copyWith({Color? color, double? fontSize, ...}) {
  final currentStyle = style ?? const TextStyle();
  return Text(
    data ?? '',
    key: key,
    style: currentStyle.copyWith(...),
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    // ... all other Text properties preserved
  );
}
```

Alignment methods use `_rebuildAlign(TextAlign)` and transform methods use `_rebuild(String)` — both preserve the full `Text` property set.
