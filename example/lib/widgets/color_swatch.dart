import 'package:flutter/material.dart';
import 'package:tailwind_ui_flutter/tailwind_ui_flutter.dart';

/// Displays a single Tailwind colour family as a horizontal swatch row
/// with shades from 50 to 900.
class ColorSwatchRow extends StatelessWidget {
  final String name;
  final MaterialColor color;

  const ColorSwatchRow({
    super.key,
    required this.name,
    required this.color,
  });

  static const _shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Text(name)
                .fontSize(TwFontSizes.xs)
                .textColor(TwColors.slate.shade600),
          ),
          Expanded(
            child: Row(
              children: _shades.map((shade) {
                final c = color[shade] ?? color;
                return Expanded(
                  child: Tooltip(
                    message: '$name-$shade\n#${c.value.toRadixString(16).substring(2).toUpperCase()}',
                    child: Container(
                      height: 28,
                      color: c,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
