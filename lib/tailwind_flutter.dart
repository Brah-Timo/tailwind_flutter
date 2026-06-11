/// tailwind_flutter — Utility-first widgets for Flutter.
///
/// Import this single file to access every token, extension, and style
/// utility the package provides:
///
/// ```dart
/// import 'package:tailwind_flutter/tailwind_flutter.dart';
/// ```
library tailwind_flutter;

// ─── Design Tokens ───────────────────────────────────────────────────────────
export 'src/tokens/tw_breakpoints.dart';
export 'src/tokens/tw_colors.dart';
export 'src/tokens/tw_font_sizes.dart';
export 'src/tokens/tw_font_weights.dart';
export 'src/tokens/tw_opacity.dart';
export 'src/tokens/tw_radii.dart';
export 'src/tokens/tw_shadows.dart';
export 'src/tokens/tw_spacing.dart';

// ─── Extensions ──────────────────────────────────────────────────────────────
export 'src/extensions/text_extensions.dart';
export 'src/extensions/widget_extensions.dart';

// ─── Styles ──────────────────────────────────────────────────────────────────
export 'src/styles/tw_style.dart';
export 'src/styles/tw_style_merger.dart';
export 'src/styles/tw_variant.dart';

// ─── Theme ───────────────────────────────────────────────────────────────────
export 'src/theme/tw_context_extension.dart';
export 'src/theme/tw_theme.dart';
export 'src/theme/tw_theme_data.dart';
export 'src/theme/tw_theme_extension.dart';
