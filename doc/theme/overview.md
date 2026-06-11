# Theme Overview

> **Sources:** `lib/src/theme/tw_theme.dart` · `lib/src/theme/tw_context_extension.dart`

---

## Architecture

The theming system has two layers:

```
┌─────────────────────────────────────────────────────┐
│  Layer 1 — TwTheme (InheritedWidget)                │
│  Injects TwThemeData into the widget tree.          │
│  Access via TwTheme.of(context) or context.tw       │
└────────────────────┬────────────────────────────────┘
                     │ contains
┌────────────────────▼────────────────────────────────┐
│  Layer 2 — TwThemeData                              │
│  Aggregates all token groups:                       │
│    colors · spacing · typography · shadows          │
│    radii · opacity · breakpoints                    │
└─────────────────────────────────────────────────────┘

Optional Bridge:
┌─────────────────────────────────────────────────────┐
│  Flutter ThemeData.extensions                       │
│  TwColorExtension, TwSpacingExtension,              │
│  TwRadiiExtension, TwShadowExtension                │
└─────────────────────────────────────────────────────┘
```

---

## Setup Options

### Option A — `TwTheme` (Recommended)

Wrap your app (or a subtree) with `TwTheme`:

```dart
MaterialApp(
  home: TwTheme(
    data: TwThemeData.light(),
    child: const MyHomePage(),
  ),
)
```

**Pros:**
- Enables `context.tw` shortcut
- Supports `TwStyle.resolve(context)` for dark/light variant merging
- No dependency on Flutter's own `ThemeData`

---

### Option B — Flutter `ThemeData.extensions`

Register Tailwind tokens into Flutter's built-in theme system:

```dart
MaterialApp(
  theme: ThemeData(
    extensions: TwThemeExtensions.all(),
  ),
)
```

**Pros:**
- Works in codebases already using `Theme.of(context)`
- Integrates with `ThemeData.lerp()` for theme animations

**Reading:**

```dart
final colors = Theme.of(context).extension<TwColorExtension>()!;
final primary = colors.primary.shade500;
```

---

### Option C — Direct Token Access (No Setup)

For simple use cases, skip all theme setup and use tokens directly as constants:

```dart
Text('Hello').bold().textColor(TwColors.blue.shade600).p(TwSpacing.s4)
```

**Pros:** Zero boilerplate  
**Cons:** No dark mode support via `TwStyle.resolve()`; no `context.tw` shortcut

---

## `TwTheme` Widget

```dart
class TwTheme extends InheritedWidget {
  final TwThemeData data;

  const TwTheme({
    super.key,
    required this.data,
    required super.child,
  });

  static TwThemeData of(BuildContext context);       // throws in debug if missing
  static TwThemeData? maybeOf(BuildContext context); // returns null if missing
}
```

### `TwTheme.of(context)`

Returns the nearest `TwThemeData`. In debug mode, throws an `AssertionError` with a helpful message if no `TwTheme` is found in the tree. In release mode, falls back to `TwThemeData.light()`.

```dart
final tw = TwTheme.of(context);
```

### `TwTheme.maybeOf(context)`

Returns `null` if no `TwTheme` ancestor exists. Use in widgets that can work with or without a theme:

```dart
final tw = TwTheme.maybeOf(context) ?? TwThemeData.light();
```

### `updateShouldNotify`

Rebuilds dependents when `data` changes (reference inequality):

```dart
@override
bool updateShouldNotify(TwTheme oldWidget) => data != oldWidget.data;
```

---

## Light / Dark Mode

### Static presets

```dart
TwThemeData.light()  // white surfaces, standard shadows, gray-50 background
TwThemeData.dark()   // slate-800 surface, slate-900 background, reduced shadows
```

### Adaptive (follows system)

```dart
Builder(
  builder: (context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    return TwTheme(
      data: TwThemeData.fromBrightness(brightness),
      child: child,
    );
  },
)
```

### Manual toggle

```dart
// In a StatefulWidget:
Brightness _brightness = Brightness.light;

TwTheme(
  data: TwThemeData.fromBrightness(_brightness),
  child: child,
)

// Toggle:
setState(() => _brightness = _brightness == Brightness.light
    ? Brightness.dark
    : Brightness.light);
```

---

## `TwContextExtension`

The context extension eliminates verbose `TwTheme.of(context)` calls:

```dart
extension TwContextExtension on BuildContext {
  TwThemeData get tw      => TwTheme.of(this);
  TwThemeData? get twOrNull => TwTheme.maybeOf(this);

  // Responsive
  TwBreakpointLabel get breakpoint => TwBreakpoints.of(this);
  bool get isMobile    => TwBreakpoints.isMobile(this);
  bool get isTablet    => TwBreakpoints.isTablet(this);
  bool get isDesktop   => TwBreakpoints.isDesktop(this);

  // Dark mode
  bool get isDarkMode  => MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  bool get isLightMode => !isDarkMode;
}
```

### Usage

```dart
// Tokens
final primaryColor = context.tw.colors.primary.shade500;
final gap          = context.tw.spacing.s4.px;
final radius       = context.tw.radii.lg.all;

// Responsive
if (context.isDesktop) { /* ... */ }
if (context.isMobile)  { /* ... */ }
switch (context.breakpoint) {
  case TwBreakpointLabel.xs => ...
  case TwBreakpointLabel.lg => ...
}

// Dark mode
if (context.isDarkMode) { /* ... */ }
```

> **Note:** `isDarkMode` reads from `MediaQuery.platformBrightnessOf(context)`, not from `TwTheme`. This means it reflects the system preference even when `TwTheme` uses a different brightness.

---

## Custom Theme

Override individual token groups:

```dart
TwThemeData.light(
  colors: TwColorTokens(
    primary: TwColors.violet,    // brand override
    secondary: TwColors.purple,
  ),
)
```

Or build from scratch:

```dart
TwThemeData(
  colors: const TwColorTokens(
    primary: TwColors.rose,
    surface: Color(0xFFFDF2F8),   // rose-50
  ),
  spacing: const TwSpacingTokens(),       // default
  typography: const TwTypographyTokens(), // default
  shadows: const TwShadowTokens(),        // default
  radii: const TwRadiiTokens(),           // default
  opacity: const TwOpacityTokens(),       // default
  breakpoints: const TwBreakpointTokens(), // default
)
```

---

## Full Setup Example

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
      // Optional: also register as Flutter ThemeExtensions
      theme: ThemeData(
        extensions: TwThemeExtensions.all(),
      ),
      // Recommended: TwTheme wrapper
      home: Builder(
        builder: (ctx) {
          final brightness = MediaQuery.platformBrightnessOf(ctx);
          return TwTheme(
            data: TwThemeData.fromBrightness(brightness),
            child: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return Scaffold(
      backgroundColor: tw.colors.background,
      body: Center(
        child: Text('Hello Tailwind!')
            .bold()
            .fontSize(TwFontSizes.xl2)
            .textColor(tw.colors.primary.shade700)
            .p(tw.spacing.s4)
            .bg(tw.colors.surface)
            .rounded(tw.radii.xl.value)
            .shadow(tw.shadows.md),
      ),
    );
  }
}
```
