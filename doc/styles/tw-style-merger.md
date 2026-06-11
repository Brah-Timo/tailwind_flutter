# TwStyleMerger & TwStyleListExtension

> **Source:** `lib/src/styles/tw_style_merger.dart`

---

## Overview

`TwStyleMerger` provides static utility functions for merging **lists** of `TwStyle` objects. While `TwStyle.merge()` handles pairwise merging of two styles, `TwStyleMerger` handles the common pattern of composing many styles together — analogous to how a single HTML element can have many Tailwind class names.

`TwStyleListExtension` adds a `.merge()` method directly on `List<TwStyle>` for a fluent API.

---

## `TwStyleMerger` Class

```dart
class TwStyleMerger {
  TwStyleMerger._();    // not instantiable — static methods only
}
```

### `mergeAll(List<TwStyle> styles) → TwStyle`

Merges a list of styles **left-to-right** — each subsequent style's non-null properties overwrite those from the previous ones. Returns an empty `TwStyle()` when the list is empty.

```dart
final result = TwStyleMerger.mergeAll([
  TwStyle.card,
  TwStyle(backgroundColor: TwColors.blue.shade50),
  if (isPrimary) TwStyle(shadows: TwShadows.lg),
]);
```

**Merge semantics:** The last non-null value wins for each property:

```dart
TwStyleMerger.mergeAll([
  TwStyle(backgroundColor: Colors.white, shadows: TwShadows.sm),
  TwStyle(backgroundColor: TwColors.blue.shade50),            // overrides bg
  TwStyle(textStyle: TextStyle(fontWeight: FontWeight.bold)),  // new property
]);
// Result:
// backgroundColor: TwColors.blue.shade50
// shadows: TwShadows.sm           (from first — not overridden)
// textStyle: bold                 (from third)
```

---

### `when({base, condition, override}) → TwStyle`

Conditionally applies an override on top of a base style. Returns `base` unchanged when `condition` is `false`.

```dart
final cardStyle = TwStyleMerger.when(
  base: TwStyle.card,
  condition: isSelected,
  override: TwStyle(
    backgroundColor: TwColors.blue.shade50,
    border: Border.fromBorderSide(
      BorderSide(color: TwColors.blue.shade400, width: 2),
    ),
  ),
);
```

This is equivalent to:
```dart
final cardStyle = isSelected
    ? TwStyle.card.merge(selectedOverride)
    : TwStyle.card;
```

---

### `atIndex(TwStyle base, List<TwStyle> styles, int index) → TwStyle`

Applies the style at `index` from `styles` (index is **clamped** to a valid range) on top of `base`. Useful for severity/step-based styling:

```dart
final severityStyles = [
  TwStyle(backgroundColor: TwColors.green.shade50),    // 0: ok
  TwStyle(backgroundColor: TwColors.yellow.shade50),   // 1: warning
  TwStyle(backgroundColor: TwColors.red.shade50),      // 2: error
];

// Level may be 0, 1, or 2 — clamped if out of range
final style = TwStyleMerger.atIndex(TwStyle.card, severityStyles, alert.level);
style.apply(child: alertWidget)
```

If `styles` is empty, returns `base` unchanged.

---

## `TwStyleListExtension`

Extension on `List<TwStyle>` — adds a `.merge()` method for fluent chaining:

```dart
extension TwStyleListExtension on List<TwStyle> {
  TwStyle merge() => TwStyleMerger.mergeAll(this);
}
```

### Usage

```dart
[
  TwStyle.card,
  activeStyle,
  if (isPrimary) primaryOverride,
].merge().apply(child: content)
```

This is functionally identical to calling `TwStyleMerger.mergeAll(...)` but reads more naturally.

---

## Complete Examples

### State-driven card styling

```dart
Widget buildCard(bool isSelected, bool isDisabled) {
  final style = TwStyleMerger.mergeAll([
    TwStyle.card,
    if (isSelected) const TwStyle(
      backgroundColor: Color(0xFFEFF6FF),  // blue-50
      border: Border.fromBorderSide(
        BorderSide(color: Color(0xFF3B82F6), width: 2),  // blue-500
      ),
    ),
    if (isDisabled) const TwStyle(opacity: 0.4),
  ]);

  return style.apply(child: cardContent);
}
```

### List of styles with `.merge()`

```dart
List<TwStyle> buildStyles(AppState state) => [
  TwStyle.card,
  if (state.isPrimary) primaryStyle,
  if (state.isFocused) focusStyle,
  if (state.hasError)  errorStyle,
];

// In build():
buildStyles(state).merge().apply(child: myWidget)
```

### Dark-mode aware merge

```dart
final themedStyle = TwStyleMerger.mergeAll([
  TwStyle.card,
  TwStyle(
    variants: {
      TwVariant.dark: TwStyle(backgroundColor: const Color(0xFF1E293B)),
    },
  ),
]);

themedStyle.resolve(context).apply(child: content)
```

### Conditional feature highlight

```dart
final style = TwStyleMerger.when(
  base: const TwStyle(
    padding: EdgeInsets.all(12),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  condition: widget.isHighlighted,
  override: const TwStyle(
    backgroundColor: Color(0xFFFEFF2),   // yellow-50
    border: Border.fromBorderSide(
      BorderSide(color: Color(0xFFEAB308), width: 1),  // yellow-500
    ),
  ),
);
```

---

## `TwVariant` Enum

Used as keys in `TwStyle.variants`:

```dart
enum TwVariant { light, dark }
```

| Value | When applied by `TwStyle.resolve()` |
|-------|--------------------------------------|
| `TwVariant.light` | `Brightness.light` mode |
| `TwVariant.dark` | `Brightness.dark` mode |

Currently supports only `light` and `dark`. Additional variants (hover, focus, active) are a planned extension.
