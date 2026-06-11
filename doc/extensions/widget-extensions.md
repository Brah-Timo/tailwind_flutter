# Widget Extensions — `TwWidgetExtensions`

> **Source:** `lib/src/extensions/widget_extensions.dart`
> **Extension on:** `Widget`

---

## Overview

`TwWidgetExtensions` adds **50+ chainable utility methods** to **any** Flutter widget, mirroring Tailwind CSS layout, spacing, color, shape, and effect utilities.

Chain these instead of manually nesting `Padding`, `Container`, `ColoredBox`, `ClipRRect`, `Opacity`, etc.

---

## Critical Rule: Order with Text Extensions

Always apply `TwTextExtensions` (on `Text`) **before** `TwWidgetExtensions`:

```dart
// ✅ CORRECT
Text('Hello')
    .bold()                           // TwTextExtensions
    .fontSize(TwFontSizes.xl)         // TwTextExtensions
    .p(TwSpacing.s4)                  // ← TwWidgetExtensions start here
    .bg(TwColors.white)               // TwWidgetExtensions

// ❌ WRONG
Text('Hello').p(TwSpacing.s4).bold()  // compile error
```

---

## Method Reference

### Padding

| Method | Tailwind | `EdgeInsets` |
|--------|----------|-------------|
| `.p(TwSpacingValue)` | `p-{n}` | all sides |
| `.px(TwSpacingValue)` | `px-{n}` | horizontal |
| `.py(TwSpacingValue)` | `py-{n}` | vertical |
| `.pt(TwSpacingValue)` | `pt-{n}` | top only |
| `.pb(TwSpacingValue)` | `pb-{n}` | bottom only |
| `.pl(TwSpacingValue)` | `pl-{n}` | left only |
| `.pr(TwSpacingValue)` | `pr-{n}` | right only |
| `.padding(EdgeInsetsGeometry)` | — | custom `EdgeInsets` |

```dart
myWidget.p(TwSpacing.s4)                    // 16 px all sides
myWidget.px(TwSpacing.s6).py(TwSpacing.s3)  // 24 px H, 12 px V
myWidget.pt(TwSpacing.s2).pb(TwSpacing.s4)  // asymmetric vertical
myWidget.padding(const EdgeInsets.fromLTRB(8, 4, 8, 12))
```

**Implementation:** All padding methods wrap the widget in a `Padding` widget.

---

### Margin

| Method | Tailwind | `EdgeInsets` |
|--------|----------|-------------|
| `.m(TwSpacingValue)` | `m-{n}` | all sides |
| `.mx(TwSpacingValue)` | `mx-{n}` | horizontal |
| `.my(TwSpacingValue)` | `my-{n}` | vertical |
| `.mt(TwSpacingValue)` | `mt-{n}` | top only |
| `.mb(TwSpacingValue)` | `mb-{n}` | bottom only |
| `.ml(TwSpacingValue)` | `ml-{n}` | left only |
| `.mr(TwSpacingValue)` | `mr-{n}` | right only |
| `.margin(EdgeInsetsGeometry)` | — | custom `EdgeInsets` |

```dart
myWidget.m(TwSpacing.s4)       // 16 px margin all sides
myWidget.mx(TwSpacing.s6)      // 24 px horizontal margin
myWidget.mt(TwSpacing.s8)      // 32 px top margin
```

**Implementation:** Margin methods wrap the widget in a `Container` (since `SizedBox` has no margin parameter).

---

### Background

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.bg(Color)` | `bg-{color}` | Solid background color |
| `.gradient(Gradient)` | `bg-gradient-to-*` | Gradient background |

```dart
myWidget.bg(TwColors.white)
myWidget.bg(TwColors.blue.shade500)
myWidget.bg(TwColors.transparent)

myWidget.gradient(LinearGradient(
  colors: [TwColors.blue.shade400, TwColors.indigo.shade600],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
))
```

**Implementation:**
- `.bg()` uses `ColoredBox` (more performant than `Container` for solid colors)
- `.gradient()` uses `DecoratedBox` with `BoxDecoration.gradient`

---

### Border Radius & Clipping

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.rounded([double?])` | `rounded-{size}` | All corners; default `TwRadii.base` (4 px) |
| `.roundedWith(BorderRadius)` | — | Custom `BorderRadius` |
| `.clipOval()` | `rounded-full` (square) | Oval/circle clip |
| `.clipRect()` | — | Clip to bounding rectangle |

```dart
myWidget.rounded()                    // 4 px — TwRadii.base
myWidget.rounded(TwRadii.lg.value)    // 8 px
myWidget.rounded(TwRadii.xl2.value)   // 16 px
myWidget.rounded(TwRadii.full.value)  // pill or circle

myWidget.roundedWith(TwRadii.xl.top)  // top corners only
myWidget.roundedWith(TwRadii.lg.topLeft.add(TwRadii.lg.topRight))

myWidget.clipOval()    // circle avatar
myWidget.clipRect()    // clip overflowing child
```

**Implementation:** All clipping uses `ClipRRect` or `ClipOval`/`ClipRect`.

---

### Shadows

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.shadow([List<BoxShadow>?])` | `shadow-{level}` | Box shadow; default `TwShadows.base` |

```dart
myWidget.shadow()                // default shadow
myWidget.shadow(TwShadows.md)    // medium shadow
myWidget.shadow(TwShadows.lg)    // large shadow
myWidget.shadow(TwShadows.none)  // removes all shadows
myWidget.shadow(TwShadows.xl2)   // heavy shadow
```

**Implementation:** `DecoratedBox` with `BoxDecoration.boxShadow`.

---

### Borders

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.border({color, width, style})` | `border` | All sides |
| `.borderTop({color, width})` | `border-t` | Top side |
| `.borderBottom({color, width})` | `border-b` | Bottom side |
| `.borderLeft({color, width})` | `border-l` | Left side |
| `.borderRight({color, width})` | `border-r` | Right side |
| `.borderX({color, width})` | `border-x` | Left + right |
| `.borderY({color, width})` | `border-y` | Top + bottom |

Default color is `Color(0xFFE5E7EB)` (gray-200). Default width is `1.0`.

```dart
myWidget.border()
myWidget.border(color: TwColors.blue.shade300, width: 2)
myWidget.borderBottom(color: TwColors.slate.shade200)
myWidget.borderX(color: TwColors.gray.shade300, width: 1)
```

**Implementation:** All border methods use `DecoratedBox` with `BoxDecoration.border`.

---

### Opacity

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.opacity(double)` | `opacity-{n}` | Widget opacity clamped to `[0, 1]` |

```dart
myWidget.opacity(TwOpacity.o50)   // 50%
myWidget.opacity(TwOpacity.o0)    // invisible (preserves space)
myWidget.opacity(TwOpacity.o75)   // 75%
```

**Implementation:** `Opacity` widget. Value is clamped automatically.

---

### Sizing

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.width(double)` | `w-{n}` | Fixed width |
| `.height(double)` | `h-{n}` | Fixed height |
| `.fullWidth()` | `w-full` | `SizedBox(width: double.infinity)` |
| `.fullHeight()` | `h-full` | `SizedBox(height: double.infinity)` |
| `.size(double w, double h)` | `w-{n} h-{n}` | Both width and height |
| `.square(double side)` | — | Width == height |

```dart
myWidget.width(TwSpacing.s64.px)   // 256 px wide
myWidget.height(TwSpacing.s48.px)  // 192 px tall
myWidget.fullWidth()               // stretch horizontally
myWidget.size(200, 100)            // 200×100 px
myWidget.square(40)                // 40×40 px (icon, avatar)
```

**Implementation:** `SizedBox`.

---

### Visibility

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.visible({required bool isVisible})` | `visible` / `invisible` | Toggles visibility, **preserves space** |
| `.invisible()` | `invisible` | Always hidden, preserves layout space |
| `.hidden({required bool show})` | `hidden` | Removes from layout when `show: false` |

```dart
myWidget.visible(isVisible: canSee)   // show/hide, keep space
myWidget.invisible()                  // always hidden, space kept
myWidget.hidden(show: isLoggedIn)     // completely removes from layout
```

**Implementation:** `Visibility` widget with appropriate `maintainSize` flags.

---

### Aspect Ratio

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.aspectRatio(double)` | `aspect-{ratio}` | Enforces width/height ratio |

```dart
myWidget.aspectRatio(16 / 9)   // aspect-video
myWidget.aspectRatio(1 / 1)    // aspect-square
myWidget.aspectRatio(4 / 3)    // classic photo ratio
```

**Implementation:** `AspectRatio` widget.

---

### Flex Helpers

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.flexible({int flex, FlexFit fit})` | `flex-{n}` | Wraps in `Flexible` |
| `.expanded({int flex})` | `flex-1` | Wraps in `Expanded` |

Use inside `Row` or `Column`:

```dart
Row(children: [
  Text('Fixed').p(TwSpacing.s2),
  Text('Fills rest').expanded(),    // takes remaining space
  Text('2x').expanded(flex: 2),     // takes 2× more space
])
```

---

### Alignment & Centering

| Method | Tailwind equivalent | Description |
|--------|---------------------|-------------|
| `.center()` | `mx-auto` / centering | Wraps in `Center` |
| `.align(AlignmentGeometry)` | — | Wraps in `Align` |
| `.alignTopLeft()` | `items-start justify-start` | |
| `.alignTopCenter()` | — | |
| `.alignTopRight()` | `items-start justify-end` | |
| `.alignCenterLeft()` | `items-center justify-start` | |
| `.alignCenterRight()` | `items-center justify-end` | |
| `.alignBottomLeft()` | `items-end justify-start` | |
| `.alignBottomCenter()` | — | |
| `.alignBottomRight()` | `items-end justify-end` | |

```dart
myWidget.center()                           // Center
myWidget.align(Alignment.topRight)          // custom alignment
myWidget.alignTopLeft()                     // top-left
myWidget.alignBottomRight()                 // bottom-right
```

---

### Accessibility & Interaction

| Method | Description |
|--------|-------------|
| `.tooltip(String)` | Wraps in `Tooltip` |
| `.onTap(VoidCallback)` | Wraps in `GestureDetector` |
| `.onLongPress(VoidCallback)` | Long-press `GestureDetector` |

```dart
myIcon.tooltip('Close dialog')
myCard.onTap(() => Navigator.push(context, route))
myCard.onLongPress(() => showOptions())
```

---

### Transform & Effects

| Method | Tailwind | Description |
|--------|----------|-------------|
| `.transform(Matrix4)` | `scale` / `rotate` / `translate` | Custom matrix |
| `.scale(double)` | — | Uniform scale |
| `.rotate(double)` | — | Rotate by radians |
| `.translate({double dx, double dy})` | — | Translate by offset |

```dart
myWidget.scale(1.05)                   // 5% larger
myWidget.rotate(0.1)                   // ~5.7° rotation
myWidget.translate(dx: 4, dy: -2)     // offset
```

---

### Overflow

| Method | Description |
|--------|-------------|
| `.overflow({maxWidth, maxHeight, minWidth, minHeight})` | `OverflowBox` |

```dart
myWidget.overflow(maxWidth: 300, maxHeight: 200)
```

---

### Combined Decoration

| Method | Description |
|--------|-------------|
| `.decorated(BoxDecoration)` | Applies any `BoxDecoration` in one call |

Use when combining background + border + radius + shadow in a single `DecoratedBox` for optimal performance:

```dart
myWidget.decorated(BoxDecoration(
  color: TwColors.white,
  borderRadius: TwRadii.xl.all,
  boxShadow: TwShadows.md,
  border: Border.all(color: TwColors.gray.shade200),
))
```

> This is equivalent to chaining `.bg()`, `.rounded()`, `.shadow()`, `.border()` but uses **one widget layer** instead of four.

---

### Safe Area

| Method | Description |
|--------|-------------|
| `.safeArea({top, bottom, left, right})` | Wraps in `SafeArea` |

```dart
myContent.safeArea()                               // all sides
myContent.safeArea(bottom: true, top: false)       // bottom notch only
```

---

## Full Chain Examples

### Styled card

```dart
Text('Card title')
    .bold()
    .fontSize(TwFontSizes.lg)
    .textColor(TwColors.slate.shade900)
    .p(TwSpacing.s4)
    .bg(TwColors.white)
    .rounded(TwRadii.xl.value)
    .shadow(TwShadows.md)
    .border(color: TwColors.gray.shade200)
```

### Interactive button

```dart
Text('Get started')
    .bold()
    .textColor(TwColors.white)
    .px(TwSpacing.s6)
    .py(TwSpacing.s3)
    .bg(TwColors.blue.shade600)
    .rounded(TwRadii.lg.value)
    .shadow(TwShadows.sm)
    .onTap(() => doAction())
```

### Avatar with tooltip

```dart
Image.network(profileUrl)
    .square(40)
    .clipOval()
    .tooltip(user.name)
    .onTap(() => openProfile())
```

### Responsive padding

```dart
content.px(context.isDesktop ? TwSpacing.s16 : TwSpacing.s4)
```

### Full-width input area

```dart
TextField()
    .fullWidth()
    .border(color: TwColors.gray.shade300)
    .rounded(TwRadii.md.value)
    .px(TwSpacing.s3)
    .py(TwSpacing.s2)
```
