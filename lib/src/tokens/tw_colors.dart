import 'package:flutter/material.dart';

/// A [MaterialColor] subclass that adds the Tailwind v4 `shade950` extra-deep
/// shade which is not defined as a named getter on the standard [MaterialColor].
class TwColor extends MaterialColor {
  /// The colour value for the `950` shade key.
  final Color shade950;

  const TwColor(super.primary, super.swatch, {required this.shade950});
}

/// Tailwind CSS v4 complete color palette — 22 color families × 11 shades
/// plus white, black, and transparent constants.
///
/// Every family is a [TwColor] (extends [MaterialColor]) so you can access
/// `.shade50` → `.shade900` and `.shade950` (the extra deep Tailwind v4 shade).
///
/// Usage:
/// ```dart
/// .bg(TwColors.blue.shade500)
/// .textColor(TwColors.slate.shade700)
/// ```
class TwColors {
  TwColors._();

  // ─── Slate ──────────────────────────────────────────────────────────────
  static const TwColor slate = TwColor(0xFF64748B, <int, Color>{
    50: Color(0xFFF8FAFC),
    100: Color(0xFFF1F5F9),
    200: Color(0xFFE2E8F0),
    300: Color(0xFFCBD5E1),
    400: Color(0xFF94A3B8),
    500: Color(0xFF64748B),
    600: Color(0xFF475569),
    700: Color(0xFF334155),
    800: Color(0xFF1E293B),
    900: Color(0xFF0F172A),
    950: Color(0xFF020617),
  }, shade950: Color(0xFF020617));

  // ─── Gray ───────────────────────────────────────────────────────────────
  static const TwColor gray = TwColor(0xFF6B7280, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(0xFF6B7280),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
    950: Color(0xFF030712),
  }, shade950: Color(0xFF030712));

  // ─── Zinc ───────────────────────────────────────────────────────────────
  static const TwColor zinc = TwColor(0xFF71717A, <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF4F4F5),
    200: Color(0xFFE4E4E7),
    300: Color(0xFFD4D4D8),
    400: Color(0xFFA1A1AA),
    500: Color(0xFF71717A),
    600: Color(0xFF52525B),
    700: Color(0xFF3F3F46),
    800: Color(0xFF27272A),
    900: Color(0xFF18181B),
    950: Color(0xFF09090B),
  }, shade950: Color(0xFF09090B));

  // ─── Neutral ────────────────────────────────────────────────────────────
  static const TwColor neutral = TwColor(0xFF737373, <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFE5E5E5),
    300: Color(0xFFD4D4D4),
    400: Color(0xFFA3A3A3),
    500: Color(0xFF737373),
    600: Color(0xFF525252),
    700: Color(0xFF404040),
    800: Color(0xFF262626),
    900: Color(0xFF171717),
    950: Color(0xFF0A0A0A),
  }, shade950: Color(0xFF0A0A0A));

  // ─── Stone ──────────────────────────────────────────────────────────────
  static const TwColor stone = TwColor(0xFF78716C, <int, Color>{
    50: Color(0xFFFAFAF9),
    100: Color(0xFFF5F5F4),
    200: Color(0xFFE7E5E4),
    300: Color(0xFFD6D3D1),
    400: Color(0xFFA8A29E),
    500: Color(0xFF78716C),
    600: Color(0xFF57534E),
    700: Color(0xFF44403C),
    800: Color(0xFF292524),
    900: Color(0xFF1C1917),
    950: Color(0xFF0C0A09),
  }, shade950: Color(0xFF0C0A09));

  // ─── Red ────────────────────────────────────────────────────────────────
  static const TwColor red = TwColor(0xFFEF4444, <int, Color>{
    50: Color(0xFFFEF2F2),
    100: Color(0xFFFEE2E2),
    200: Color(0xFFFECACA),
    300: Color(0xFFFCA5A5),
    400: Color(0xFFF87171),
    500: Color(0xFFEF4444),
    600: Color(0xFFDC2626),
    700: Color(0xFFB91C1C),
    800: Color(0xFF991B1B),
    900: Color(0xFF7F1D1D),
    950: Color(0xFF450A0A),
  }, shade950: Color(0xFF450A0A));

  // ─── Orange ─────────────────────────────────────────────────────────────
  static const TwColor orange = TwColor(0xFFF97316, <int, Color>{
    50: Color(0xFFFFF7ED),
    100: Color(0xFFFFEDD5),
    200: Color(0xFFFED7AA),
    300: Color(0xFFFDBA74),
    400: Color(0xFFFB923C),
    500: Color(0xFFF97316),
    600: Color(0xFFEA580C),
    700: Color(0xFFC2410C),
    800: Color(0xFF9A3412),
    900: Color(0xFF7C2D12),
    950: Color(0xFF431407),
  }, shade950: Color(0xFF431407));

  // ─── Amber ──────────────────────────────────────────────────────────────
  static const TwColor amber = TwColor(0xFFF59E0B, <int, Color>{
    50: Color(0xFFFFFBEB),
    100: Color(0xFFFEF3C7),
    200: Color(0xFFFDE68A),
    300: Color(0xFFFCD34D),
    400: Color(0xFFFBBF24),
    500: Color(0xFFF59E0B),
    600: Color(0xFFD97706),
    700: Color(0xFFB45309),
    800: Color(0xFF92400E),
    900: Color(0xFF78350F),
    950: Color(0xFF451A03),
  }, shade950: Color(0xFF451A03));

  // ─── Yellow ─────────────────────────────────────────────────────────────
  static const TwColor yellow = TwColor(0xFFEAB308, <int, Color>{
    50: Color(0xFFFEFF2),
    100: Color(0xFFFEF9C3),
    200: Color(0xFFFEF08A),
    300: Color(0xFFFDE047),
    400: Color(0xFFFACC15),
    500: Color(0xFFEAB308),
    600: Color(0xFFCA8A04),
    700: Color(0xFFA16207),
    800: Color(0xFF854D0E),
    900: Color(0xFF713F12),
    950: Color(0xFF422006),
  }, shade950: Color(0xFF422006));

  // ─── Lime ───────────────────────────────────────────────────────────────
  static const TwColor lime = TwColor(0xFF84CC16, <int, Color>{
    50: Color(0xFFF7FEE7),
    100: Color(0xFFECFCCB),
    200: Color(0xFFD9F99D),
    300: Color(0xFFBEF264),
    400: Color(0xFFA3E635),
    500: Color(0xFF84CC16),
    600: Color(0xFF65A30D),
    700: Color(0xFF4D7C0F),
    800: Color(0xFF3F6212),
    900: Color(0xFF365314),
    950: Color(0xFF1A2E05),
  }, shade950: Color(0xFF1A2E05));

  // ─── Green ──────────────────────────────────────────────────────────────
  static const TwColor green = TwColor(0xFF22C55E, <int, Color>{
    50: Color(0xFFF0FDF4),
    100: Color(0xFFDCFCE7),
    200: Color(0xFFBBF7D0),
    300: Color(0xFF86EFAC),
    400: Color(0xFF4ADE80),
    500: Color(0xFF22C55E),
    600: Color(0xFF16A34A),
    700: Color(0xFF15803D),
    800: Color(0xFF166534),
    900: Color(0xFF14532D),
    950: Color(0xFF052E16),
  }, shade950: Color(0xFF052E16));

  // ─── Emerald ────────────────────────────────────────────────────────────
  static const TwColor emerald = TwColor(0xFF10B981, <int, Color>{
    50: Color(0xFFECFDF5),
    100: Color(0xFFD1FAE5),
    200: Color(0xFFA7F3D0),
    300: Color(0xFF6EE7B7),
    400: Color(0xFF34D399),
    500: Color(0xFF10B981),
    600: Color(0xFF059669),
    700: Color(0xFF047857),
    800: Color(0xFF065F46),
    900: Color(0xFF064E3B),
    950: Color(0xFF022C22),
  }, shade950: Color(0xFF022C22));

  // ─── Teal ───────────────────────────────────────────────────────────────
  static const TwColor teal = TwColor(0xFF14B8A6, <int, Color>{
    50: Color(0xFFF0FDFA),
    100: Color(0xFFCCFBF1),
    200: Color(0xFF99F6E4),
    300: Color(0xFF5EEAD4),
    400: Color(0xFF2DD4BF),
    500: Color(0xFF14B8A6),
    600: Color(0xFF0D9488),
    700: Color(0xFF0F766E),
    800: Color(0xFF115E59),
    900: Color(0xFF134E4A),
    950: Color(0xFF042F2E),
  }, shade950: Color(0xFF042F2E));

  // ─── Cyan ───────────────────────────────────────────────────────────────
  static const TwColor cyan = TwColor(0xFF06B6D4, <int, Color>{
    50: Color(0xFFECFEFF),
    100: Color(0xFFCFFAFE),
    200: Color(0xFFA5F3FC),
    300: Color(0xFF67E8F9),
    400: Color(0xFF22D3EE),
    500: Color(0xFF06B6D4),
    600: Color(0xFF0891B2),
    700: Color(0xFF0E7490),
    800: Color(0xFF155E75),
    900: Color(0xFF164E63),
    950: Color(0xFF083344),
  }, shade950: Color(0xFF083344));

  // ─── Sky ────────────────────────────────────────────────────────────────
  static const TwColor sky = TwColor(0xFF0EA5E9, <int, Color>{
    50: Color(0xFFF0F9FF),
    100: Color(0xFFE0F2FE),
    200: Color(0xFFBAE6FD),
    300: Color(0xFF7DD3FC),
    400: Color(0xFF38BDF8),
    500: Color(0xFF0EA5E9),
    600: Color(0xFF0284C7),
    700: Color(0xFF0369A1),
    800: Color(0xFF075985),
    900: Color(0xFF0C4A6E),
    950: Color(0xFF082F49),
  }, shade950: Color(0xFF082F49));

  // ─── Blue ───────────────────────────────────────────────────────────────
  static const TwColor blue = TwColor(0xFF3B82F6, <int, Color>{
    50: Color(0xFFEFF6FF),
    100: Color(0xFFDBEAFE),
    200: Color(0xFFBFDBFE),
    300: Color(0xFF93C5FD),
    400: Color(0xFF60A5FA),
    500: Color(0xFF3B82F6),
    600: Color(0xFF2563EB),
    700: Color(0xFF1D4ED8),
    800: Color(0xFF1E40AF),
    900: Color(0xFF1E3A8A),
    950: Color(0xFF172554),
  }, shade950: Color(0xFF172554));

  // ─── Indigo ─────────────────────────────────────────────────────────────
  static const TwColor indigo = TwColor(0xFF6366F1, <int, Color>{
    50: Color(0xFFEEF2FF),
    100: Color(0xFFE0E7FF),
    200: Color(0xFFC7D2FE),
    300: Color(0xFFA5B4FC),
    400: Color(0xFF818CF8),
    500: Color(0xFF6366F1),
    600: Color(0xFF4F46E5),
    700: Color(0xFF4338CA),
    800: Color(0xFF3730A3),
    900: Color(0xFF312E81),
    950: Color(0xFF1E1B4B),
  }, shade950: Color(0xFF1E1B4B));

  // ─── Violet ─────────────────────────────────────────────────────────────
  static const TwColor violet = TwColor(0xFF8B5CF6, <int, Color>{
    50: Color(0xFFF5F3FF),
    100: Color(0xFFEDE9FE),
    200: Color(0xFFDDD6FE),
    300: Color(0xFFC4B5FD),
    400: Color(0xFFA78BFA),
    500: Color(0xFF8B5CF6),
    600: Color(0xFF7C3AED),
    700: Color(0xFF6D28D9),
    800: Color(0xFF5B21B6),
    900: Color(0xFF4C1D95),
    950: Color(0xFF2E1065),
  }, shade950: Color(0xFF2E1065));

  // ─── Purple ─────────────────────────────────────────────────────────────
  static const TwColor purple = TwColor(0xFFA855F7, <int, Color>{
    50: Color(0xFFFAF5FF),
    100: Color(0xFFF3E8FF),
    200: Color(0xFFE9D5FF),
    300: Color(0xFFD8B4FE),
    400: Color(0xFFC084FC),
    500: Color(0xFFA855F7),
    600: Color(0xFF9333EA),
    700: Color(0xFF7E22CE),
    800: Color(0xFF6B21A8),
    900: Color(0xFF581C87),
    950: Color(0xFF3B0764),
  }, shade950: Color(0xFF3B0764));

  // ─── Fuchsia ────────────────────────────────────────────────────────────
  static const TwColor fuchsia = TwColor(0xFFD946EF, <int, Color>{
    50: Color(0xFFFDF4FF),
    100: Color(0xFFFAE8FF),
    200: Color(0xFFF5D0FE),
    300: Color(0xFFF0ABFC),
    400: Color(0xFFE879F9),
    500: Color(0xFFD946EF),
    600: Color(0xFFC026D3),
    700: Color(0xFFA21CAF),
    800: Color(0xFF86198F),
    900: Color(0xFF701A75),
    950: Color(0xFF4A044E),
  }, shade950: Color(0xFF4A044E));

  // ─── Pink ───────────────────────────────────────────────────────────────
  static const TwColor pink = TwColor(0xFFEC4899, <int, Color>{
    50: Color(0xFFFDF2F8),
    100: Color(0xFFFCE7F3),
    200: Color(0xFFFBCFE8),
    300: Color(0xFFF9A8D4),
    400: Color(0xFFF472B6),
    500: Color(0xFFEC4899),
    600: Color(0xFFDB2777),
    700: Color(0xFFBE185D),
    800: Color(0xFF9D174D),
    900: Color(0xFF831843),
    950: Color(0xFF500724),
  }, shade950: Color(0xFF500724));

  // ─── Rose ───────────────────────────────────────────────────────────────
  static const TwColor rose = TwColor(0xFFF43F5E, <int, Color>{
    50: Color(0xFFFFF1F2),
    100: Color(0xFFFFE4E6),
    200: Color(0xFFFFCDD2),
    300: Color(0xFFFDA4AF),
    400: Color(0xFFFB7185),
    500: Color(0xFFF43F5E),
    600: Color(0xFFE11D48),
    700: Color(0xFFBE123C),
    800: Color(0xFF9F1239),
    900: Color(0xFF881337),
    950: Color(0xFF4C0519),
  }, shade950: Color(0xFF4C0519));

  // ─── Special ────────────────────────────────────────────────────────────
  /// Pure white — equivalent to Tailwind `white`.
  static const Color white = Color(0xFFFFFFFF);

  /// Pure black — equivalent to Tailwind `black`.
  static const Color black = Color(0xFF000000);

  /// Fully transparent — equivalent to Tailwind `transparent`.
  static const Color transparent = Color(0x00000000);

  /// Current colour (inherits from parent) — equivalent to Tailwind `currentColor`.
  static const Color current = Color(0x00000000); // placeholder; handled by context
}
