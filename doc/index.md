# tailwind_ui_flutter — Documentation Index

> **v0.2.0** · Dart SDK `>=3.0.0 <4.0.0` · Flutter `>=3.10.0`

`tailwind_ui_flutter` brings the complete [Tailwind CSS v4](https://tailwindcss.com) design system into Flutter. Every color family, spacing step, typography token, shadow preset, and breakpoint is available as a compile-time constant — and every styling operation is available as a fluent Dart extension method on `Text` and `Widget`.

---

## Table of Contents

### 📚 Guides
| File | Description |
|------|-------------|
| [Getting Started](getting-started.md) | Installation, minimal setup, first widget |
| [Performance](performance.md) | Widget-tree depth, const usage, best practices |

### 🎨 Design Tokens
| File | Token class | What it covers |
|------|-------------|----------------|
| [Colors](tokens/colors.md) | `TwColors`, `TwColor` | 22 families × 11 shades (50–950) + white/black/transparent |
| [Spacing](tokens/spacing.md) | `TwSpacing`, `TwSpacingValue` | 35 spacing steps (0–384 px) with EdgeInsets getters |
| [Typography](tokens/typography.md) | `TwFontSizes`, `TwFontWeights`, `TwFontSizeValue` | 13 font sizes + 9 weights with paired line-heights |
| [Radii](tokens/radii.md) | `TwRadii`, `TwRadiiValue` | 10 border-radius tokens with per-corner BorderRadius getters |
| [Shadows](tokens/shadows.md) | `TwShadows` | 7 `List<BoxShadow>` shadow presets |
| [Opacity](tokens/opacity.md) | `TwOpacity` | 21 opacity steps (0.0–1.0) |
| [Breakpoints](tokens/breakpoints.md) | `TwBreakpoints`, `TwBreakpointLabel` | 5 screen-width thresholds + helpers |

### 🔧 Extension Methods
| File | Extension | Target type | # Methods |
|------|-----------|-------------|-----------|
| [Text Extensions](extensions/text-extensions.md) | `TwTextExtensions` | `Text` | 30+ |
| [Widget Extensions](extensions/widget-extensions.md) | `TwWidgetExtensions` | `Widget` | 50+ |

### 🧩 Styles
| File | Class | Description |
|------|-------|-------------|
| [TwStyle](styles/tw-style.md) | `TwStyle` | Composable immutable style object with merge/resolve/apply |
| [TwStyleMerger](styles/tw-style-merger.md) | `TwStyleMerger`, `TwStyleListExtension` | Helpers for merging lists of styles |

### 🌗 Theme
| File | Class | Description |
|------|-------|-------------|
| [Theme Overview](theme/overview.md) | — | Architecture, setup, light/dark mode, context shortcuts |
| [TwThemeData](theme/tw-theme-data.md) | `TwThemeData` + token group classes | Aggregated token container |
| [ThemeExtensions](theme/tw-theme-extension.md) | `TwColorExtension` etc. | Bridge to Flutter's native `ThemeData.extensions` |

### 📖 Reference
| File | Description |
|------|-------------|
| [API Reference](api-reference.md) | Full flat listing of every public symbol |

---

## Quick Example

```dart
import 'package:tailwind_ui_flutter/tailwind_ui_flutter.dart';

// Wrap once at app root
MaterialApp(
  home: TwTheme(
    data: TwThemeData.light(),
    child: MyHomePage(),
  ),
)

// Style anywhere — chain Text extensions then Widget extensions
Text('Sign in')
  .bold()
  .fontSize(TwFontSizes.lg)
  .textColor(TwColors.white)
  .p(TwSpacing.s4)
  .px(TwSpacing.s8)
  .bg(TwColors.blue.shade600)
  .rounded(TwRadii.lg.value)
  .shadow(TwShadows.md)
```

---

## Architecture at a Glance

```
tailwind_ui_flutter/
├── lib/
│   ├── tailwind_ui_flutter.dart          ← single barrel export
│   └── src/
│       ├── tokens/                    ← compile-time design constants
│       │   ├── tw_colors.dart         (TwColor, TwColors)
│       │   ├── tw_spacing.dart        (TwSpacingValue, TwSpacing)
│       │   ├── tw_font_sizes.dart     (TwFontSizeValue, TwFontSizes)
│       │   ├── tw_font_weights.dart   (TwFontWeights)
│       │   ├── tw_radii.dart          (TwRadiiValue, TwRadii)
│       │   ├── tw_shadows.dart        (TwShadows)
│       │   ├── tw_opacity.dart        (TwOpacity)
│       │   └── tw_breakpoints.dart    (TwBreakpoints, TwBreakpointLabel)
│       ├── extensions/                ← fluent chaining on Text / Widget
│       │   ├── text_extensions.dart   (TwTextExtensions)
│       │   └── widget_extensions.dart (TwWidgetExtensions)
│       ├── styles/                    ← composable style objects
│       │   ├── tw_style.dart          (TwStyle)
│       │   ├── tw_style_merger.dart   (TwStyleMerger, TwStyleListExtension)
│       │   └── tw_variant.dart        (TwVariant)
│       └── theme/                     ← InheritedWidget + ThemeExtension bridge
│           ├── tw_theme.dart          (TwTheme)
│           ├── tw_theme_data.dart     (TwThemeData + token group classes)
│           ├── tw_theme_extension.dart (TwColorExtension etc.)
│           └── tw_context_extension.dart (context.tw, context.breakpoint…)
└── doc/                               ← you are here
```

---

## Design Philosophy

| Principle | How it's implemented |
|-----------|---------------------|
| **Zero runtime cost** | All tokens are `const` — resolved at compile-time |
| **Utility-first** | Extension methods mirror Tailwind class names exactly |
| **Composable** | `TwStyle.merge()` lets you combine styles like CSS classes |
| **Theme-aware** | `TwStyle.resolve(context)` auto-selects light/dark variants |
| **Flutter-native** | `TwThemeExtension` bridges into Flutter's own `ThemeData` |
| **Type-safe** | `TwColor` (extends `MaterialColor`) carries `shade950` field |
