# tailwind_flutter

**Utility-first widgets for Flutter.** Stop nesting six widgets to style one card.

[![pub package](https://img.shields.io/pub/v/tailwind_flutter.svg)](https://pub.dev/packages/tailwind_flutter)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-≥3.10-02569B?logo=flutter)](https://flutter.dev)

Tailwind CSS v4 design tokens + chainable widget extensions for Flutter.

```dart
// Before — 18 lines of nested widgets
Padding(
  padding: const EdgeInsets.all(16),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [...],
        border: Border(...),
      ),
      child: Text(
        'Hello',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  ),
)

// After — 1 readable chain
Text('Hello')
    .bold()
    .fontSize(TwFontSizes.lg)
    .p(TwSpacing.s4)
    .bg(TwColors.white)
    .rounded(TwRadii.lg.value)
    .shadow(TwShadows.md)
```

---

## Features

| Feature | Details |
|---------|---------|
| 🎨 **242 colors** | All 22 Tailwind v4 families × 11 shades (50 → 950) |
| 📐 **35 spacing values** | s0 → s96 on the 4 px scale, with EdgeInsets getters |
| 🔤 **13 font sizes** | Paired with correct Tailwind line-heights |
| 🔘 **10 border radii** | none → full, with per-corner BorderRadius getters |
| 🌑 **7 shadow presets** | sm, base, md, lg, xl, 2xl, none |
| 💧 **21 opacity steps** | o0 → o100 |
| 📱 **5 breakpoints** | sm, md, lg, xl, 2xl with responsive helpers |
| ⚡ **Widget extensions** | 70+ chainable methods on any Widget |
| ✍️ **Text extensions** | 50+ chainable methods on Text |
| 🧩 **TwStyle** | Reusable styles with merge(), dark variants, apply() |
| 🌙 **Dark mode** | TwVariant.dark + TwTheme adaptive presets |
| 🎭 **ThemeData integration** | 4 ThemeExtension classes |
| **Zero dependencies** | Flutter SDK only |

---

## Installation

```yaml
dependencies:
  tailwind_flutter: ^0.2.0
```

```bash
flutter pub get
```

```dart
import 'package:tailwind_flutter/tailwind_flutter.dart';
```

---

## Quick Start

```dart
import 'package:flutter/material.dart';
import 'package:tailwind_flutter/tailwind_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TwTheme(
        data: TwThemeData.light(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello, Tailwind Flutter!')
            .bold()
            .fontSize(TwFontSizes.xl2)
            .textColor(TwColors.blue.shade600)
            .p(TwSpacing.s6)
            .bg(TwColors.blue.shade50)
            .rounded(TwRadii.xl.value)
            .shadow(TwShadows.lg),
      ),
    );
  }
}
```

---

## Design Tokens

### Colors — `TwColors`

```dart
TwColors.blue.shade500     // #3B82F6
TwColors.slate.shade900    // #0F172A
TwColors.emerald.shade500  // #10B981
TwColors.white             // #FFFFFF
TwColors.black             // #000000
TwColors.transparent       // #00000000
```

All 22 families: `slate`, `gray`, `zinc`, `neutral`, `stone`, `red`, `orange`,
`amber`, `yellow`, `lime`, `green`, `emerald`, `teal`, `cyan`, `sky`, `blue`,
`indigo`, `violet`, `purple`, `fuchsia`, `pink`, `rose`.

### Spacing — `TwSpacing`

```dart
TwSpacing.s4.value   // 16.0 px  (space-4)
TwSpacing.s4.all     // EdgeInsets.all(16)
TwSpacing.s6.x       // EdgeInsets.symmetric(horizontal: 24)
TwSpacing.s4.top     // EdgeInsets.only(top: 16)
```

### Font Sizes — `TwFontSizes`

```dart
TwFontSizes.lg.size        // 18.0 px
TwFontSizes.lg.lineHeight  // 28.0 px
TwFontSizes.lg.textStyle   // TextStyle(fontSize: 18, height: 1.556)
```

### Border Radius — `TwRadii`

```dart
TwRadii.lg.value   // 8.0 px
TwRadii.lg.all     // BorderRadius.circular(8)
TwRadii.lg.top     // BorderRadius.vertical(top: Radius.circular(8))
TwRadii.full.value // 9999.0 px
```

### Shadows — `TwShadows`

```dart
TwShadows.sm    // subtle 1-layer
TwShadows.md    // medium elevation (cards)
TwShadows.lg    // large (modals)
TwShadows.xl2   // maximum elevation
TwShadows.none  // []
```

### Opacity — `TwOpacity`

```dart
TwOpacity.o50  // 0.50
TwOpacity.o75  // 0.75
TwOpacity.o0   // 0.00 (fully transparent)
```

---

## Widget Extensions

> ⚠️ **Order rule**: Apply [Text extensions](#text-extensions) **before** widget extensions.
> Once you call `.p()`, `.bg()`, etc. the type becomes `Widget` and text-specific
> methods are no longer available.

### Padding

```dart
widget.p(TwSpacing.s4)    // p-4  → EdgeInsets.all(16)
widget.px(TwSpacing.s6)   // px-6 → horizontal 24
widget.py(TwSpacing.s2)   // py-2 → vertical 8
widget.pt(TwSpacing.s4)   // pt-4 → top only
widget.pb(TwSpacing.s4)   // pb-4 → bottom only
widget.pl(TwSpacing.s4)   // pl-4 → left only
widget.pr(TwSpacing.s4)   // pr-4 → right only
widget.padding(const EdgeInsets.fromLTRB(4, 8, 4, 12)) // custom
```

### Margin

```dart
widget.m(TwSpacing.s4)    // m-4
widget.mx(TwSpacing.s8)   // mx-8
widget.my(TwSpacing.s4)   // my-4
widget.mt / mb / ml / mr  // individual sides
```

### Background

```dart
widget.bg(TwColors.blue.shade500)           // solid colour
widget.gradient(LinearGradient(...))         // gradient
```

### Border Radius

```dart
widget.rounded()                       // rounded (4 px)
widget.rounded(TwRadii.lg.value)       // rounded-lg (8 px)
widget.rounded(TwRadii.full.value)     // rounded-full (pill)
widget.roundedWith(TwRadii.xl.top)     // top corners only
widget.clipOval()                      // circular clip
```

### Shadows

```dart
widget.shadow()                 // default shadow
widget.shadow(TwShadows.lg)     // shadow-lg
widget.shadow(TwShadows.none)   // remove shadow
```

### Borders

```dart
widget.border()                                          // 1px gray-200
widget.border(color: TwColors.blue.shade500, width: 2)  // custom
widget.borderTop()   // border-t
widget.borderBottom() // border-b
widget.borderLeft()  // border-l
widget.borderRight() // border-r
widget.borderX()     // border-x
widget.borderY()     // border-y
```

### Opacity

```dart
widget.opacity(TwOpacity.o50)   // opacity-50
widget.opacity(0.75)            // any value (auto-clamped)
```

### Sizing

```dart
widget.width(256)          // w-64
widget.height(128)         // h-32
widget.fullWidth()         // w-full
widget.fullHeight()        // h-full
widget.square(48)          // w-12 h-12
widget.size(200, 100)      // w + h together
widget.aspectRatio(16/9)   // aspect-video
```

### Visibility

```dart
widget.invisible()                   // visibility: hidden (keeps space)
widget.visible(isVisible: false)     // hide but keep space
widget.hidden(show: false)           // display: none
```

### Layout

```dart
widget.center()                // mx-auto equivalent
widget.align(Alignment.topRight)
widget.flexible()              // flex-1
widget.expanded()              // flex-grow fill
```

### Interaction

```dart
widget.onTap(() {})
widget.onLongPress(() {})
widget.tooltip('This is a tooltip')
```

### Transform

```dart
widget.scale(1.1)
widget.rotate(0.1)   // radians
widget.translate(dx: 10, dy: 0)
```

---

## Text Extensions

```dart
Text('Hello')
  // Weight
  .bold()          // font-bold
  .semibold()      // font-semibold
  .medium()        // font-medium
  .light()         // font-light
  .thin()          // font-thin

  // Size (with paired line-height)
  .fontSize(TwFontSizes.xl3)    // text-3xl

  // Color
  .textColor(TwColors.blue.shade600)

  // Style
  .italic()
  .underline()         // text-decoration: underline
  .lineThrough()       // text-decoration: line-through

  // Transform
  .uppercase()         // text-transform: uppercase
  .lowercase()
  .capitalize()        // first letter of each word

  // Alignment
  .center()            // text-center
  .start()             // text-left (RTL-aware)
  .end()               // text-right (RTL-aware)
  .justify()

  // Overflow
  .ellipsis()          // truncate (1 line)
  .ellipsis(maxLines: 2)
  .maxLines(3)
  .noWrap()            // whitespace-nowrap

  // Spacing
  .letterSpacing(0.05)
  .lineHeight(1.75)
```

---

## TwStyle — Reusable Styles

```dart
// Define once (like a CSS class)
const cardStyle = TwStyle(
  padding: EdgeInsets.all(16),       // p-4
  backgroundColor: Color(0xFFFFFFFF), // bg-white
  borderRadius: BorderRadius.all(Radius.circular(8)), // rounded-lg
  shadows: TwShadows.md,
  border: Border.fromBorderSide(BorderSide(color: Color(0xFFE5E7EB))),
);

// Apply anywhere
cardStyle.apply(child: myWidget)

// Merge (right wins)
final primaryCard = cardStyle.merge(TwStyle(
  backgroundColor: TwColors.blue.shade50,
  shadows: TwShadows.lg,
));

// Dark mode
const themedCard = TwStyle(
  backgroundColor: Color(0xFFFFFFFF),
  variants: {
    TwVariant.dark: TwStyle(
      backgroundColor: Color(0xFF1E293B),
    ),
  },
);

// Resolve in build()
themedCard.resolve(context).apply(child: myWidget)
```

### TwStyleMerger

```dart
// Merge a list of styles (last wins)
final result = TwStyleMerger.mergeAll([base, hover, active]);

// Conditional merge
final style = TwStyleMerger.when(
  base: cardStyle,
  condition: isSelected,
  override: selectedStyle,
);

// Extension on List<TwStyle>
final merged = [s1, s2, s3].merge();
```

### Built-in presets

```dart
TwStyle.card   // white card, rounded-lg, shadow-md, border
TwStyle.ghost  // transparent, rounded-lg, border-only
TwStyle.badge  // pill shape, no shadow, tight padding
```

---

## Theme System

```dart
// Wrap app
TwTheme(
  data: TwThemeData.light(),
  child: MyApp(),
)

// Adaptive (follows system)
TwTheme(
  data: TwThemeData.fromBrightness(
    MediaQuery.platformBrightnessOf(context),
  ),
  child: MyApp(),
)

// Read in build()
final tw = context.tw;               // TwThemeData accessor
final blue = tw.colors.blue.shade500;
final gap  = tw.spacing.s4.px;
final br   = tw.radii.lg.all;

// Responsive helpers
context.isMobile    // < 640 px
context.isTablet    // ≥ 768 px
context.isDesktop   // ≥ 1024 px
context.isDarkMode  // true when Brightness.dark
context.breakpoint  // TwBreakpointLabel enum
```

### Integration with Material ThemeData

```dart
MaterialApp(
  theme: ThemeData(
    extensions: TwThemeExtensions.all(data: TwThemeData.light()),
  ),
  darkTheme: ThemeData(
    extensions: TwThemeExtensions.all(data: TwThemeData.dark()),
  ),
)

// Read
final colors = Theme.of(context).extension<TwColorExtension>()!;
final primary = colors.primary.shade500;
```

---

## Tailwind CSS → tailwind_flutter Cheatsheet

| Tailwind CSS | tailwind_flutter |
|---|---|
| `bg-blue-500` | `.bg(TwColors.blue.shade500)` |
| `p-4` | `.p(TwSpacing.s4)` |
| `px-6 py-3` | `.px(TwSpacing.s6).py(TwSpacing.s3)` |
| `rounded-lg` | `.rounded(TwRadii.lg.value)` |
| `rounded-full` | `.rounded(TwRadii.full.value)` |
| `shadow-md` | `.shadow(TwShadows.md)` |
| `border` | `.border()` |
| `border-b` | `.borderBottom()` |
| `opacity-50` | `.opacity(TwOpacity.o50)` |
| `w-full` | `.fullWidth()` |
| `text-lg` | `.fontSize(TwFontSizes.lg)` |
| `font-bold` | `.bold()` |
| `font-semibold` | `.semibold()` |
| `text-slate-700` | `.textColor(TwColors.slate.shade700)` |
| `text-center` | `.center()` |
| `uppercase` | `.uppercase()` |
| `line-through` | `.lineThrough()` |
| `invisible` | `.invisible()` |
| `aspect-video` | `.aspectRatio(16/9)` |
| `dark:bg-slate-800` | `TwVariant.dark` in `TwStyle.variants` |

---

## Architecture

```
tailwind_flutter/
├── lib/
│   ├── tailwind_flutter.dart          ← Single import barrel
│   └── src/
│       ├── tokens/                    ← Design tokens (all const)
│       │   ├── tw_colors.dart         ← 242 colors
│       │   ├── tw_spacing.dart        ← 35 spacing values
│       │   ├── tw_font_sizes.dart     ← 13 sizes + line-heights
│       │   ├── tw_font_weights.dart   ← 9 weights
│       │   ├── tw_radii.dart          ← 10 radii
│       │   ├── tw_shadows.dart        ← 7 shadow presets
│       │   ├── tw_opacity.dart        ← 21 opacity steps
│       │   └── tw_breakpoints.dart    ← 5 breakpoints
│       ├── extensions/                ← Extension methods
│       │   ├── widget_extensions.dart ← 70+ methods on Widget
│       │   └── text_extensions.dart   ← 50+ methods on Text
│       ├── styles/                    ← TwStyle system
│       │   ├── tw_style.dart          ← Composable style objects
│       │   ├── tw_variant.dart        ← light / dark enum
│       │   └── tw_style_merger.dart   ← mergeAll / when helpers
│       └── theme/                     ← Theme layer
│           ├── tw_theme_data.dart     ← 7 token sub-classes
│           ├── tw_theme.dart          ← InheritedWidget
│           ├── tw_theme_extension.dart← 4 ThemeExtension classes
│           └── tw_context_extension.dart ← context.tw accessor
└── test/                              ← 90%+ coverage test suite
```

---

## Performance

Every extension method returns the same Flutter widget you would have written
manually — no intermediate objects, no Builder allocations, no runtime parsing.

`TwStyle.apply()` goes further: it combines `backgroundColor`, `borderRadius`,
`shadows`, and `border` into **a single `DecoratedBox`**, producing a shallower
widget tree than chaining individual extensions.

---

## Roadmap

- [ ] Responsive extensions (`.sm()`, `.md()`, `.lg()` variants per breakpoint)
- [ ] Interactive variants (`TwVariant.hover`, `.focus`, `.disabled`)
- [ ] Animation tokens (`.transition()`, `.animate()`)
- [ ] Full typography system (font-family tokens, tracking scale)
- [ ] Directional support improvements (RTL-aware margins)

---

## License

MIT — see [LICENSE](LICENSE).

---

Made for Flutter developers who love Tailwind CSS. ⚡
