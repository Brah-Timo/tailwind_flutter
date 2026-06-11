import 'package:flutter/widgets.dart';

/// 7 shadow presets matching Tailwind CSS v4's `shadow-*` utilities.
///
/// Each preset is a `const List<BoxShadow>` so it can be used directly
/// anywhere Flutter expects a list of box shadows:
///
/// ```dart
/// // In a DecoratedBox
/// BoxDecoration(boxShadow: TwShadows.lg)
///
/// // Via extension
/// myWidget.shadow(TwShadows.md)
/// ```
///
/// Shadow levels:
///
/// | Token | CSS equivalent | Description          |
/// |-------|----------------|----------------------|
/// | none  | shadow-none    | No shadow            |
/// | sm    | shadow-sm      | Subtle 1-layer       |
/// | base  | shadow         | Default 2-layer      |
/// | md    | shadow-md      | Medium 2-layer       |
/// | lg    | shadow-lg      | Large 2-layer        |
/// | xl    | shadow-xl      | XL 2-layer           |
/// | xl2   | shadow-2xl     | Heavy 1-layer        |
///
/// All colours use `Color(0xXX000000)` (black with alpha) to exactly replicate
/// Tailwind v4's shadow colour system.
class TwShadows {
  TwShadows._();

  /// shadow-none — removes all shadows.
  static const List<BoxShadow> none = [];

  /// shadow-sm — 1-layer, very subtle elevation.
  ///
  /// Tailwind: `0 1px 2px 0 rgb(0 0 0 / 0.05)`
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0D000000), // black / 5%
      blurRadius: 2,
      spreadRadius: 0,
      offset: Offset(0, 1),
    ),
  ];

  /// shadow — 2-layer default shadow.
  ///
  /// Tailwind: `0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)`
  static const List<BoxShadow> base = [
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 3,
      spreadRadius: 0,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 2,
      spreadRadius: -1,
      offset: Offset(0, 1),
    ),
  ];

  /// shadow-md — medium elevation, cards and dropdowns.
  ///
  /// Tailwind: `0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)`
  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 6,
      spreadRadius: -1,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 4,
      spreadRadius: -2,
      offset: Offset(0, 2),
    ),
  ];

  /// shadow-lg — large elevation, modals and popovers.
  ///
  /// Tailwind: `0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)`
  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 15,
      spreadRadius: -3,
      offset: Offset(0, 10),
    ),
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 6,
      spreadRadius: -4,
      offset: Offset(0, 4),
    ),
  ];

  /// shadow-xl — extra-large elevation, drawers and overlays.
  ///
  /// Tailwind: `0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1)`
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 25,
      spreadRadius: -5,
      offset: Offset(0, 20),
    ),
    BoxShadow(
      color: Color(0x1A000000), // black / 10%
      blurRadius: 10,
      spreadRadius: -6,
      offset: Offset(0, 8),
    ),
  ];

  /// shadow-2xl — maximum elevation, full-screen dialogs.
  ///
  /// Tailwind: `0 25px 50px -12px rgb(0 0 0 / 0.25)`
  static const List<BoxShadow> xl2 = [
    BoxShadow(
      color: Color(0x40000000), // black / 25%
      blurRadius: 50,
      spreadRadius: -12,
      offset: Offset(0, 25),
    ),
  ];

  /// Convenience map — look up a shadow by its Tailwind name.
  static const Map<String, List<BoxShadow>> byName = {
    'none': none,
    'sm': sm,
    'base': base,
    'md': md,
    'lg': lg,
    'xl': xl,
    '2xl': xl2,
  };
}
