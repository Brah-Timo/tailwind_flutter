# Colors — `TwColors` & `TwColor`

> **Source:** `lib/src/tokens/tw_colors.dart`

---

## Overview

`TwColors` provides the complete **Tailwind CSS v4** color palette as compile-time constants:

- **22 color families**, each with **11 shades** (50 → 900, plus the new `950`)
- `TwColor` — a custom subclass of `MaterialColor` that adds the `shade950` field
- `white`, `black`, `transparent`, and `current` convenience constants

All values are `const` — zero runtime allocation.

---

## `TwColor` Class

```dart
class TwColor extends MaterialColor {
  final Color shade950;
  const TwColor(int primary, Map<int, Color> swatch, {required this.shade950});
}
```

`TwColor` extends Flutter's `MaterialColor`, so it works everywhere `MaterialColor` is expected:
- `shade50` through `shade900` via the inherited named getters
- `shade950` via the new typed field (Tailwind v4 extra-deep shade)
- Direct `Color` usage (the primary value is the `500` shade)

```dart
// All of these work:
TwColors.blue.shade500         // primary (Color)
TwColors.blue.shade50          // lightest (Color)
TwColors.blue.shade950         // extra deep (Color) — TwColor adds this
TwColors.blue[700]             // map access (Color?)
```

---

## Color Families

### 🌫️ Neutrals

| Family | 50 | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 | 950 |
|--------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| `slate` | `#F8FAFC` | `#F1F5F9` | `#E2E8F0` | `#CBD5E1` | `#94A3B8` | `#64748B` | `#475569` | `#334155` | `#1E293B` | `#0F172A` | `#020617` |
| `gray` | `#F9FAFB` | `#F3F4F6` | `#E5E7EB` | `#D1D5DB` | `#9CA3AF` | `#6B7280` | `#4B5563` | `#374151` | `#1F2937` | `#111827` | `#030712` |
| `zinc` | `#FAFAFA` | `#F4F4F5` | `#E4E4E7` | `#D4D4D8` | `#A1A1AA` | `#71717A` | `#52525B` | `#3F3F46` | `#27272A` | `#18181B` | `#09090B` |
| `neutral` | `#FAFAFA` | `#F5F5F5` | `#E5E5E5` | `#D4D4D4` | `#A3A3A3` | `#737373` | `#525252` | `#404040` | `#262626` | `#171717` | `#0A0A0A` |
| `stone` | `#FAFAF9` | `#F5F5F4` | `#E7E5E4` | `#D6D3D1` | `#A8A29E` | `#78716C` | `#57534E` | `#44403C` | `#292524` | `#1C1917` | `#0C0A09` |

### 🔴 Warm Colors

| Family | 50 | 100 | 500 | 600 | 700 | 900 | 950 |
|--------|-----|-----|-----|-----|-----|-----|-----|
| `red` | `#FEF2F2` | `#FEE2E2` | `#EF4444` | `#DC2626` | `#B91C1C` | `#7F1D1D` | `#450A0A` |
| `orange` | `#FFF7ED` | `#FFEDD5` | `#F97316` | `#EA580C` | `#C2410C` | `#7C2D12` | `#431407` |
| `amber` | `#FFFBEB` | `#FEF3C7` | `#F59E0B` | `#D97706` | `#B45309` | `#78350F` | `#451A03` |
| `yellow` | `#FEFF2` | `#FEF9C3` | `#EAB308` | `#CA8A04` | `#A16207` | `#713F12` | `#422006` |

### 🟢 Cool Colors

| Family | 50 | 100 | 500 | 600 | 700 | 900 | 950 |
|--------|-----|-----|-----|-----|-----|-----|-----|
| `lime` | `#F7FEE7` | `#ECFCCB` | `#84CC16` | `#65A30D` | `#4D7C0F` | `#365314` | `#1A2E05` |
| `green` | `#F0FDF4` | `#DCFCE7` | `#22C55E` | `#16A34A` | `#15803D` | `#14532D` | `#052E16` |
| `emerald` | `#ECFDF5` | `#D1FAE5` | `#10B981` | `#059669` | `#047857` | `#064E3B` | `#022C22` |
| `teal` | `#F0FDFA` | `#CCFBF1` | `#14B8A6` | `#0D9488` | `#0F766E` | `#134E4A` | `#042F2E` |

### 🔵 Blues

| Family | 50 | 100 | 500 | 600 | 700 | 900 | 950 |
|--------|-----|-----|-----|-----|-----|-----|-----|
| `cyan` | `#ECFEFF` | `#CFFAFE` | `#06B6D4` | `#0891B2` | `#0E7490` | `#164E63` | `#083344` |
| `sky` | `#F0F9FF` | `#E0F2FE` | `#0EA5E9` | `#0284C7` | `#0369A1` | `#0C4A6E` | `#082F49` |
| `blue` | `#EFF6FF` | `#DBEAFE` | `#3B82F6` | `#2563EB` | `#1D4ED8` | `#1E3A8A` | `#172554` |
| `indigo` | `#EEF2FF` | `#E0E7FF` | `#6366F1` | `#4F46E5` | `#4338CA` | `#312E81` | `#1E1B4B` |

### 🟣 Purples & Pinks

| Family | 50 | 100 | 500 | 600 | 700 | 900 | 950 |
|--------|-----|-----|-----|-----|-----|-----|-----|
| `violet` | `#F5F3FF` | `#EDE9FE` | `#8B5CF6` | `#7C3AED` | `#6D28D9` | `#4C1D95` | `#2E1065` |
| `purple` | `#FAF5FF` | `#F3E8FF` | `#A855F7` | `#9333EA` | `#7E22CE` | `#581C87` | `#3B0764` |
| `fuchsia` | `#FDF4FF` | `#FAE8FF` | `#D946EF` | `#C026D3` | `#A21CAF` | `#701A75` | `#4A044E` |
| `pink` | `#FDF2F8` | `#FCE7F3` | `#EC4899` | `#DB2777` | `#BE185D` | `#831843` | `#500724` |
| `rose` | `#FFF1F2` | `#FFE4E6` | `#F43F5E` | `#E11D48` | `#BE123C` | `#881337` | `#4C0519` |

---

## Special Constants

```dart
TwColors.white       // Color(0xFFFFFFFF) — pure white
TwColors.black       // Color(0xFF000000) — pure black
TwColors.transparent // Color(0x00000000) — fully transparent
TwColors.current     // Color(0x00000000) — context-inherited (placeholder)
```

---

## Usage Patterns

### In extension methods

```dart
Text('Hello')
    .textColor(TwColors.slate.shade700)
    .p(TwSpacing.s4)
    .bg(TwColors.blue.shade50)
    .border(color: TwColors.blue.shade200)
```

### In TwStyle

```dart
const heroStyle = TwStyle(
  backgroundColor: Color(0xFF3B82F6), // blue-500
  // or:
  backgroundColor: TwColors.blue.shade500,
);
```

### As MaterialColor

```dart
// In Flutter ThemeData — TwColor works as MaterialColor
ThemeData(
  primarySwatch: TwColors.blue,       // works! TwColor extends MaterialColor
  colorScheme: ColorScheme.fromSeed(seedColor: TwColors.violet.shade500),
)
```

### In BoxDecoration

```dart
BoxDecoration(
  gradient: LinearGradient(
    colors: [TwColors.blue.shade400, TwColors.indigo.shade600],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
)
```

---

## Shade Reference Table

All 11 shades across all families follow this lightness ladder:

| Key | Typical use |
|-----|-------------|
| `shade50` | Tint backgrounds, hover states |
| `shade100` | Light badges, input backgrounds |
| `shade200` | Border colors, dividers |
| `shade300` | Disabled states, placeholders |
| `shade400` | Secondary text on light |
| `shade500` | **Primary brand shade** (the MaterialColor primary) |
| `shade600` | Button backgrounds, interactive default |
| `shade700` | Button hover, prominent text |
| `shade800` | Dark text on light surfaces |
| `shade900` | Near-black text, dark headers |
| `shade950` | Extra deep (Tailwind v4 only) — darkest |

---

## Technical Notes

### Why `TwColor` instead of `MaterialColor`?

Flutter's `MaterialColor` only defines named getters up to `shade900`. Tailwind v4 adds a `950` shade. `TwColor` adds a typed `final Color shade950` field while remaining fully compatible with `MaterialColor`.

```dart
class TwColor extends MaterialColor {
  final Color shade950;
  const TwColor(super.primary, super.swatch, {required this.shade950});
}
```

Because `TwColor extends MaterialColor`, you can:
- Use `TwColors.blue` anywhere `MaterialColor` is expected
- Access `.shade950` with full type safety (no `?` cast required)
- Use `TwColors.blue[950]` for dynamic key lookup (returns `Color?`)

### Const guarantee

Every `TwColor` instance is `static const` on `TwColors`. The entire palette costs **zero heap allocations** at runtime.
