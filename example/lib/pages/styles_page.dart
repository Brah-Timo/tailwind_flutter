import 'package:flutter/material.dart';
import 'package:tailwind_ui_flutter/tailwind_ui_flutter.dart';

/// Page 3 — TwStyle: reusable styles, merge, dark mode variants.
class StylesPage extends StatelessWidget {
  const StylesPage({super.key});

  // ── Reusable style definitions (like CSS classes) ─────────────────────────

  static const TwStyle _cardBase = TwStyle(
    padding: EdgeInsets.all(16),
    backgroundColor: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    shadows: TwShadows.md,
    border: Border.fromBorderSide(BorderSide(color: Color(0xFFE5E7EB))),
  );

  static final TwStyle _cardPrimary = _cardBase.merge(const TwStyle(
    backgroundColor: Color(0xFFEFF6FF), // blue-50
    border: Border.fromBorderSide(BorderSide(color: Color(0xFFBFDBFE))), // blue-200
  ));

  static final TwStyle _cardSuccess = _cardBase.merge(const TwStyle(
    backgroundColor: Color(0xFFF0FDF4), // green-50
    border: Border.fromBorderSide(BorderSide(color: Color(0xFFBBF7D0))), // green-200
  ));

  static final TwStyle _cardDanger = _cardBase.merge(const TwStyle(
    backgroundColor: Color(0xFFFEF2F2), // red-50
    border: Border.fromBorderSide(BorderSide(color: Color(0xFFFECACA))), // red-200
  ));

  static const TwStyle _adaptiveCard = TwStyle(
    padding: EdgeInsets.all(16),
    backgroundColor: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    shadows: TwShadows.md,
    textStyle: TextStyle(color: Color(0xFF0F172A)),
    variants: {
      TwVariant.dark: TwStyle(
        backgroundColor: Color(0xFF1E293B), // slate-800
        shadows: TwShadows.none,
        border: Border.fromBorderSide(BorderSide(color: Color(0xFF334155))),
        textStyle: TextStyle(color: Color(0xFFF1F5F9)),
      ),
    },
  );

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('TwStyle System')
              .bold()
              .fontSize(TwFontSizes.xl2)
              .textColor(tw.colors.slate.shade900)
              .pb(TwSpacing.s2),

          Text('Reusable styles · merge() · dark mode variants')
              .fontSize(TwFontSizes.sm)
              .textColor(tw.colors.slate.shade500)
              .pb(TwSpacing.s6),

          // ── Style Variants ─────────────────────────────────────────────────
          _SectionLabel(label: 'Card Style Variants (via .merge())', tw: tw),
          const SizedBox(height: 12),

          _cardBase.apply(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Default Card')
                    .semibold()
                    .fontSize(TwFontSizes.base)
                    .textColor(tw.colors.slate.shade800),
                const SizedBox(height: 4),
                Text('TwStyle.card (base)')
                    .fontSize(TwFontSizes.sm)
                    .textColor(tw.colors.slate.shade500),
              ],
            ),
          ),
          const SizedBox(height: 12),

          _cardPrimary.apply(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Primary Card')
                    .semibold()
                    .fontSize(TwFontSizes.base)
                    .textColor(tw.colors.blue.shade800),
                const SizedBox(height: 4),
                Text('cardBase.merge(primaryOverride)')
                    .fontSize(TwFontSizes.sm)
                    .textColor(tw.colors.blue.shade500),
              ],
            ),
          ),
          const SizedBox(height: 12),

          _cardSuccess.apply(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Success Card')
                    .semibold()
                    .fontSize(TwFontSizes.base)
                    .textColor(tw.colors.green.shade800),
                const SizedBox(height: 4),
                Text('cardBase.merge(successOverride)')
                    .fontSize(TwFontSizes.sm)
                    .textColor(tw.colors.green.shade500),
              ],
            ),
          ),
          const SizedBox(height: 12),

          _cardDanger.apply(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Danger Card')
                    .semibold()
                    .fontSize(TwFontSizes.base)
                    .textColor(tw.colors.red.shade800),
                const SizedBox(height: 4),
                Text('cardBase.merge(dangerOverride)')
                    .fontSize(TwFontSizes.sm)
                    .textColor(tw.colors.red.shade500),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── Dark mode adaptive card ────────────────────────────────────────
          _SectionLabel(
              label: 'Adaptive Card (TwVariant.dark)', tw: tw),
          const SizedBox(height: 12),

          _adaptiveCard.resolve(context).apply(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Adaptive Card')
                    .semibold()
                    .fontSize(TwFontSizes.base),
                const SizedBox(height: 4),
                Text('Toggle dark mode in the top-right corner to see me change!')
                    .fontSize(TwFontSizes.sm)
                    .textColor(tw.colors.slate.shade500),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.dark_mode,
                      size: 16,
                      color: tw.colors.slate.shade400,
                    ),
                    const SizedBox(width: 4),
                    Text('Dark: bg-slate-800 · no shadow · border-slate-700')
                        .fontSize(TwFontSizes.xs)
                        .textColor(tw.colors.slate.shade400),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── TwStyleMerger ─────────────────────────────────────────────────
          _SectionLabel(label: 'TwStyleMerger.mergeAll()', tw: tw),
          const SizedBox(height: 12),

          TwStyleMerger.mergeAll([
            _cardBase,
            TwStyle(
              backgroundColor: tw.colors.indigo.shade50,
              border: Border.fromBorderSide(
                BorderSide(color: tw.colors.indigo.shade200),
              ),
            ),
          ]).apply(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Merged: base + indigo override')
                    .semibold()
                    .fontSize(TwFontSizes.base)
                    .textColor(tw.colors.indigo.shade800),
                const SizedBox(height: 4),
                Text('TwStyleMerger.mergeAll([base, indigoOverride])')
                    .fontSize(TwFontSizes.sm)
                    .textColor(tw.colors.indigo.shade400),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── Preset styles ─────────────────────────────────────────────────
          _SectionLabel(label: 'Built-in Presets', tw: tw),
          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              // TwStyle.card
              SizedBox(
                width: 140,
                child: TwStyle.card.apply(
                  child: Text('TwStyle.card')
                      .bold()
                      .fontSize(TwFontSizes.xs)
                      .textColor(tw.colors.slate.shade700)
                      .center(),
                ),
              ),
              // TwStyle.ghost
              SizedBox(
                width: 140,
                child: TwStyle.ghost.apply(
                  child: Text('TwStyle.ghost')
                      .bold()
                      .fontSize(TwFontSizes.xs)
                      .textColor(tw.colors.slate.shade600)
                      .center(),
                ),
              ),
              // TwStyle.badge
              TwStyle.badge
                  .merge(TwStyle(
                      backgroundColor: tw.colors.violet.shade100))
                  .apply(
                    child: Text('badge')
                        .bold()
                        .fontSize(TwFontSizes.xs)
                        .textColor(tw.colors.violet.shade700),
                  ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  final TwThemeData tw;
  const _SectionLabel({required this.label, required this.tw});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label)
            .semibold()
            .fontSize(TwFontSizes.base)
            .textColor(tw.colors.slate.shade700),
        const Divider(height: 16),
      ],
    );
  }
}
