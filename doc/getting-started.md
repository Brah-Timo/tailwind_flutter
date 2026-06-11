# Getting Started

> **tailwind_ui_flutter** v0.2.0 — Tailwind CSS design tokens and utility extensions for Flutter.

---

## 1. Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  tailwind_ui_flutter: ^0.2.0
```

Then fetch it:

```sh
flutter pub get
```

### Requirements

| Dependency | Minimum |
|------------|---------|
| Dart SDK | `>=3.0.0 <4.0.0` |
| Flutter | `>=3.10.0` |

---

## 2. Import

A single barrel import exposes every public symbol:

```dart
import 'package:tailwind_ui_flutter/tailwind_ui_flutter.dart';
```

Everything lives under this one import — tokens, extensions, styles, and theme classes.

---

## 3. Minimal Setup — No Theme Required

For simple projects you can use tokens and extensions directly with **no theme setup**:

```dart
import 'package:flutter/material.dart';
import 'package:tailwind_ui_flutter/tailwind_ui_flutter.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello Tailwind Flutter')
        .bold()
        .fontSize(TwFontSizes.xl)
        .textColor(TwColors.slate.shade800)
        .p(TwSpacing.s4)
        .bg(TwColors.white)
        .rounded(TwRadii.lg.value)
        .shadow(TwShadows.md);
  }
}
```

All tokens are `const` — they carry **zero runtime overhead**.

---

## 4. Recommended Setup — With TwTheme

Wrap your app (or a subtree) with `TwTheme` to inject `TwThemeData` into the widget tree. This enables:

- `context.tw` shortcut for accessing all token groups
- Automatic light / dark mode switching
- `TwStyle.resolve(context)` for variant-aware styles

```dart
import 'package:flutter/material.dart';
import 'package:tailwind_ui_flutter/tailwind_ui_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: TwTheme(
        data: TwThemeData.light(),  // or TwThemeData.dark()
        child: const MyHomePage(),
      ),
    );
  }
}
```

### Adaptive (follows system brightness)

```dart
Builder(
  builder: (context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    return TwTheme(
      data: TwThemeData.fromBrightness(brightness),
      child: const MyApp(),
    );
  },
)
```

---

## 5. Accessing Tokens

### Direct access (no context)

```dart
// Colors
TwColors.blue.shade500          // Color
TwColors.slate.shade700         // Color
TwColors.white                  // Color (0xFFFFFFFF)
TwColors.blue.shade950          // Color — Tailwind v4 extra-deep shade

// Spacing
TwSpacing.s4.px                 // 16.0 (double)
TwSpacing.s4.all                // EdgeInsets.all(16)
TwSpacing.s6.x                  // EdgeInsets.symmetric(horizontal: 24)

// Typography
TwFontSizes.lg.size             // 18.0
TwFontSizes.lg.lineHeight       // 28.0
TwFontSizes.lg.textStyle        // TextStyle(fontSize: 18, height: 1.555)
TwFontWeights.semibold          // FontWeight.w600

// Radii
TwRadii.lg.value                // 8.0
TwRadii.xl.all                  // BorderRadius.circular(12)
TwRadii.xl.top                  // BorderRadius.vertical(top: Radius.circular(12))

// Shadows
TwShadows.md                    // List<BoxShadow>
TwShadows.xl2                   // List<BoxShadow>

// Opacity
TwOpacity.o50                   // 0.5
TwOpacity.o75                   // 0.75

// Breakpoints
TwBreakpoints.md                // 768.0
```

### Via context (requires TwTheme ancestor)

```dart
// In a build method
final tw = context.tw;              // TwThemeData
final tw = TwTheme.of(context);     // equivalent

final primaryColor  = tw.colors.primary.shade500;
final gap           = tw.spacing.s6.px;
final cardRadius    = tw.radii.lg.all;
final cardShadow    = tw.shadows.md;

// Breakpoint shortcuts
if (context.isMobile)   { /* < 640 px */ }
if (context.isTablet)   { /* ≥ 768 px */ }
if (context.isDesktop)  { /* ≥ 1024 px */ }
if (context.isDarkMode) { /* dark scheme */ }
```

---

## 6. Extension Methods

### Text extensions

Apply **all** text extensions **before** any widget extensions:

```dart
Text('Dashboard')
    .bold()                               // font-bold
    .fontSize(TwFontSizes.xl2)            // text-2xl (24 px / lh 32 px)
    .textColor(TwColors.slate.shade900)   // text-slate-900
    .letterSpacing(0.5)                   // tracking-wide
    // ↓ pivot to Widget extensions here
    .p(TwSpacing.s2)
    .bg(TwColors.transparent)
```

> **Rule:** Once `.p()`, `.bg()`, `.rounded()`, etc. are called, the expression type becomes `Widget` and text-specific methods like `.bold()` are no longer available.

### Widget extensions

```dart
myWidget
    .p(TwSpacing.s4)                     // padding: all 16 px
    .px(TwSpacing.s6)                    // padding: left/right 24 px
    .bg(TwColors.blue.shade600)          // background color
    .rounded(TwRadii.xl.value)           // clip rounded 12 px
    .shadow(TwShadows.lg)               // box shadow
    .border(color: TwColors.blue.shade200, width: 2)
    .opacity(TwOpacity.o90)             // 90% opaque
    .width(TwSpacing.s64.px)            // 256 px wide
    .center()                           // Center widget
    .onTap(() => print('tapped'))       // GestureDetector
```

---

## 7. TwStyle — Reusable Styles

Define styles once and apply them anywhere:

```dart
// Define once (const — zero runtime cost)
const cardStyle = TwStyle(
  padding:         EdgeInsets.all(16),
  backgroundColor: Color(0xFFFFFFFF),
  borderRadius:    BorderRadius.all(Radius.circular(8)),
  shadows:         TwShadows.md,
  border:          Border.fromBorderSide(BorderSide(color: Color(0xFFE5E7EB))),
);

// Apply
cardStyle.apply(child: Text('Hello'))

// Extend with merge
final featuredCard = cardStyle.merge(TwStyle(
  backgroundColor: TwColors.blue.shade50,
  shadows:         TwShadows.lg,
));
```

### Dark mode variants

```dart
const themedCard = TwStyle(
  backgroundColor: Color(0xFFFFFFFF),
  variants: {
    TwVariant.dark: TwStyle(backgroundColor: Color(0xFF1E293B)),
  },
);

// In build() — auto-selects variant
themedCard.resolve(context).apply(child: myWidget)
```

### Built-in presets

```dart
TwStyle.card   // white, rounded-lg, shadow-md, border-gray-200
TwStyle.ghost  // transparent, rounded-lg, border-gray-200
TwStyle.badge  // inline pill (px-2 py-0.5, rounded-full)
```

---

## 8. Flutter ThemeData Integration

Bridge into Flutter's native theme system with `TwThemeExtensions`:

```dart
MaterialApp(
  theme: ThemeData(
    extensions: TwThemeExtensions.all(),                 // light preset
    // or:
    extensions: TwThemeExtensions.all(data: TwThemeData.dark()),
  ),
)

// Reading in a widget
final colors = Theme.of(context).extension<TwColorExtension>()!;
final primary = colors.primary.shade500;
```

---

## 9. Common Patterns

### Card widget

```dart
Container(
  child: Text('Card content')
      .fontSize(TwFontSizes.base)
      .textColor(TwColors.slate.shade700)
      .p(TwSpacing.s4)
      .bg(TwColors.white)
      .rounded(TwRadii.xl.value)
      .shadow(TwShadows.md),
)
```

### Responsive layout

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final isWide = constraints.maxWidth >= TwBreakpoints.md;
    return Row(
      children: [
        Text('Label')
            .semibold()
            .fontSize(isWide ? TwFontSizes.lg : TwFontSizes.base)
            .p(TwSpacing.s4),
      ],
    );
  },
)
```

### Conditional styling with TwStyleMerger

```dart
final style = TwStyleMerger.when(
  base: TwStyle.card,
  condition: isSelected,
  override: TwStyle(
    backgroundColor: TwColors.blue.shade50,
    border: Border.all(color: TwColors.blue.shade300, width: 2),
  ),
);
style.apply(child: myCard)
```

---

## 10. Next Steps

- [Colors](tokens/colors.md) — Full palette reference with all hex values
- [Spacing](tokens/spacing.md) — All 35 spacing tokens and EdgeInsets helpers
- [Typography](tokens/typography.md) — Font sizes, weights, and line-heights
- [Text Extensions](extensions/text-extensions.md) — Every method on `Text`
- [Widget Extensions](extensions/widget-extensions.md) — Every method on `Widget`
- [TwStyle](styles/tw-style.md) — Composable styles in depth
- [Theme Overview](theme/overview.md) — Full theme architecture
- [API Reference](api-reference.md) — Complete symbol listing
