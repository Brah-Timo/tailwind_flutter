# Breakpoints — `TwBreakpoints` & `TwBreakpointLabel`

> **Source:** `lib/src/tokens/tw_breakpoints.dart`

---

## Overview

`TwBreakpoints` provides **5 responsive breakpoint thresholds** matching Tailwind CSS v4's default screen sizes, along with helper methods to resolve the active breakpoint from a `BuildContext`.

`TwBreakpointLabel` is an enum of 6 labels (including `xs` for the mobile default).

---

## Breakpoint Constants

| Token | Tailwind prefix | Width threshold | Device range |
|-------|----------------|-----------------|--------------|
| `TwBreakpoints.sm` | `sm:` | ≥ 640 px | Large phone, small tablet |
| `TwBreakpoints.md` | `md:` | ≥ 768 px | Tablet portrait |
| `TwBreakpoints.lg` | `lg:` | ≥ 1024 px | Tablet landscape, small desktop |
| `TwBreakpoints.xl` | `xl:` | ≥ 1280 px | Desktop |
| `TwBreakpoints.xl2` | `2xl:` | ≥ 1536 px | Wide desktop |

**Below `sm`** is implicitly the mobile (base) case — no prefix in Tailwind, `TwBreakpointLabel.xs` in this package.

---

## `TwBreakpointLabel` Enum

```dart
enum TwBreakpointLabel { xs, sm, md, lg, xl, xl2 }
```

| Label | Width |
|-------|-------|
| `xs` | < 640 px (mobile default) |
| `sm` | ≥ 640 px |
| `md` | ≥ 768 px |
| `lg` | ≥ 1024 px |
| `xl` | ≥ 1280 px |
| `xl2` | ≥ 1536 px |

---

## Helper Methods

### `TwBreakpoints.labelForWidth(double width)`

Pure function — returns the `TwBreakpointLabel` for any width, no `BuildContext` needed:

```dart
TwBreakpoints.labelForWidth(400)    // TwBreakpointLabel.xs
TwBreakpoints.labelForWidth(800)    // TwBreakpointLabel.md
TwBreakpoints.labelForWidth(1280)   // TwBreakpointLabel.xl
```

### `TwBreakpoints.of(BuildContext context)`

Reads `MediaQuery` width and returns the active label:

```dart
final bp = TwBreakpoints.of(context);
if (bp == TwBreakpointLabel.lg) { /* desktop layout */ }
```

### `TwBreakpoints.isAtLeast(BuildContext context, double breakpoint)`

```dart
TwBreakpoints.isAtLeast(context, TwBreakpoints.md)  // true if ≥ 768 px
```

### `TwBreakpoints.isMobile(BuildContext context)`

```dart
TwBreakpoints.isMobile(context)   // true if < 640 px
```

### `TwBreakpoints.isTablet(BuildContext context)`

```dart
TwBreakpoints.isTablet(context)   // true if ≥ 768 px
```

### `TwBreakpoints.isDesktop(BuildContext context)`

```dart
TwBreakpoints.isDesktop(context)  // true if ≥ 1024 px
```

---

## `TwContextExtension` Shortcuts

When `TwTheme` is in the tree, the `BuildContext` extension provides these:

```dart
context.breakpoint   // TwBreakpointLabel — active label
context.isMobile     // bool — < 640 px
context.isTablet     // bool — ≥ 768 px
context.isDesktop    // bool — ≥ 1024 px
```

---

## Usage Patterns

### LayoutBuilder-based responsive

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final width = constraints.maxWidth;
    final isWide = width >= TwBreakpoints.md;

    return Padding(
      padding: isWide
          ? TwSpacing.s8.x        // 32 px horizontal on wider screens
          : TwSpacing.s4.x,       // 16 px horizontal on mobile
      child: myContent,
    );
  },
)
```

### MediaQuery-based inline

```dart
@override
Widget build(BuildContext context) {
  final isDesktop = TwBreakpoints.isDesktop(context);
  // or: context.isDesktop (with TwContextExtension)

  return Row(
    children: isDesktop
        ? [sidebar, Expanded(child: content)]
        : [content],
  );
}
```

### Switch on label

```dart
final columns = switch (context.breakpoint) {
  TwBreakpointLabel.xs => 1,
  TwBreakpointLabel.sm => 1,
  TwBreakpointLabel.md => 2,
  TwBreakpointLabel.lg => 3,
  TwBreakpointLabel.xl => 4,
  TwBreakpointLabel.xl2 => 5,
};

GridView.count(crossAxisCount: columns, children: [...])
```

### Conditional widget size

```dart
@override
Widget build(BuildContext context) {
  final avatarSize = context.isDesktop ? 64.0 : 40.0;

  return Image.network(avatarUrl)
      .square(avatarSize)
      .rounded(TwRadii.full.value);
}
```

### Responsive font size

```dart
Text('Title')
    .fontSize(context.isDesktop ? TwFontSizes.xl3 : TwFontSizes.xl2)
    .bold()
```

---

## Via Theme

```dart
final bp = context.tw.breakpoints;
bp.sm    // 640.0
bp.md    // 768.0
bp.lg    // 1024.0
bp.xl    // 1280.0
bp.xl2   // 1536.0
```

---

## Mobile-First Approach

`TwBreakpoints` follows Tailwind's mobile-first convention. `labelForWidth` always returns the **largest breakpoint that the current width meets or exceeds**:

```dart
// labelForWidth always returns the "most specific" label:
labelForWidth(500)    // xs  (below sm)
labelForWidth(640)    // sm  (exactly at sm)
labelForWidth(900)    // md  (above md, below lg)
labelForWidth(1600)   // xl2 (at or above xl2)
```

This mirrors how Tailwind classes work: `md:` applies to `≥768 px` and above.
