import 'package:flutter/material.dart';
import 'package:tailwind_ui_flutter/tailwind_ui_flutter.dart';
import '../widgets/color_swatch.dart';

/// Page 1 — Design Tokens showcase.
///
/// Displays every colour family, spacing scale, font-size scale, border-radius
/// scale, and shadow scale with their exact pixel values.
class TokensPage extends StatelessWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────────────
          Text('Design Tokens')
              .bold()
              .fontSize(TwFontSizes.xl2)
              .textColor(tw.colors.slate.shade900)
              .pb(TwSpacing.s2),

          Text('All 242 colours · 35 spacing values · 13 font sizes')
              .fontSize(TwFontSizes.sm)
              .textColor(tw.colors.slate.shade500)
              .pb(TwSpacing.s6),

          // ── Colour Families ──────────────────────────────────────────────
          _SectionHeader(title: 'Colors', tw: tw),
          _ColorSection(tw: tw),
          const SizedBox(height: 24),

          // ── Spacing Scale ────────────────────────────────────────────────
          _SectionHeader(title: 'Spacing Scale (1 unit = 4 px)', tw: tw),
          _SpacingSection(tw: tw),
          const SizedBox(height: 24),

          // ── Font Sizes ───────────────────────────────────────────────────
          _SectionHeader(title: 'Font Sizes', tw: tw),
          _FontSizeSection(tw: tw),
          const SizedBox(height: 24),

          // ── Border Radii ─────────────────────────────────────────────────
          _SectionHeader(title: 'Border Radius', tw: tw),
          _RadiiSection(tw: tw),
          const SizedBox(height: 24),

          // ── Shadows ──────────────────────────────────────────────────────
          _SectionHeader(title: 'Shadows', tw: tw),
          _ShadowSection(tw: tw),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section header
// ─────────────────────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final TwThemeData tw;
  const _SectionHeader({required this.title, required this.tw});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title)
            .semibold()
            .fontSize(TwFontSizes.lg)
            .textColor(tw.colors.slate.shade800),
        const Divider(height: 16),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Colour section
// ─────────────────────────────────────────────────────────────────────────────
class _ColorSection extends StatelessWidget {
  final TwThemeData tw;
  const _ColorSection({required this.tw});

  static const _families = [
    ('slate', TwColors.slate),
    ('gray', TwColors.gray),
    ('red', TwColors.red),
    ('orange', TwColors.orange),
    ('amber', TwColors.amber),
    ('yellow', TwColors.yellow),
    ('lime', TwColors.lime),
    ('green', TwColors.green),
    ('emerald', TwColors.emerald),
    ('teal', TwColors.teal),
    ('cyan', TwColors.cyan),
    ('sky', TwColors.sky),
    ('blue', TwColors.blue),
    ('indigo', TwColors.indigo),
    ('violet', TwColors.violet),
    ('purple', TwColors.purple),
    ('fuchsia', TwColors.fuchsia),
    ('pink', TwColors.pink),
    ('rose', TwColors.rose),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _families.map((f) {
        final (name, color) = f;
        return ColorSwatchRow(name: name, color: color);
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Spacing section
// ─────────────────────────────────────────────────────────────────────────────
class _SpacingSection extends StatelessWidget {
  final TwThemeData tw;
  const _SpacingSection({required this.tw});

  @override
  Widget build(BuildContext context) {
    final shown = [
      TwSpacing.s0_5, TwSpacing.s1, TwSpacing.s2, TwSpacing.s3,
      TwSpacing.s4, TwSpacing.s6, TwSpacing.s8, TwSpacing.s12,
      TwSpacing.s16, TwSpacing.s20, TwSpacing.s24, TwSpacing.s32,
    ];
    final labels = [
      's0_5', 's1', 's2', 's3', 's4', 's6', 's8', 's12', 's16', 's20',
      's24', 's32',
    ];

    return Column(
      children: List.generate(shown.length, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                child: Text(labels[i])
                    .fontSize(TwFontSizes.xs)
                    .textColor(tw.colors.slate.shade500),
              ),
              Container(
                width: shown[i].value,
                height: 20,
                color: tw.colors.blue.shade500,
              ),
              const SizedBox(width: 8),
              Text('${shown[i].value.toInt()} px')
                  .fontSize(TwFontSizes.xs)
                  .textColor(tw.colors.slate.shade400),
            ],
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Font size section
// ─────────────────────────────────────────────────────────────────────────────
class _FontSizeSection extends StatelessWidget {
  final TwThemeData tw;
  const _FontSizeSection({required this.tw});

  @override
  Widget build(BuildContext context) {
    final sizes = [
      ('xs', TwFontSizes.xs),
      ('sm', TwFontSizes.sm),
      ('base', TwFontSizes.base),
      ('lg', TwFontSizes.lg),
      ('xl', TwFontSizes.xl),
      ('2xl', TwFontSizes.xl2),
      ('3xl', TwFontSizes.xl3),
      ('4xl', TwFontSizes.xl4),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sizes.map((e) {
        final (label, size) = e;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              SizedBox(
                width: 48,
                child: Text(label)
                    .fontSize(TwFontSizes.xs)
                    .textColor(tw.colors.slate.shade400),
              ),
              Text('The quick brown fox')
                  .fontSize(size)
                  .textColor(tw.colors.slate.shade800),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Border radius section
// ─────────────────────────────────────────────────────────────────────────────
class _RadiiSection extends StatelessWidget {
  final TwThemeData tw;
  const _RadiiSection({required this.tw});

  @override
  Widget build(BuildContext context) {
    final radii = [
      ('none', TwRadii.none),
      ('sm', TwRadii.sm),
      ('base', TwRadii.base),
      ('md', TwRadii.md),
      ('lg', TwRadii.lg),
      ('xl', TwRadii.xl),
      ('2xl', TwRadii.xl2),
      ('3xl', TwRadii.xl3),
      ('full', TwRadii.full),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: radii.map((e) {
        final (label, r) = e;
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: tw.colors.blue.shade500,
                borderRadius: r.all,
              ),
            ),
            const SizedBox(height: 4),
            Text(label)
                .fontSize(TwFontSizes.xs)
                .textColor(tw.colors.slate.shade500),
            Text('${r.value == 9999 ? '∞' : r.value.toInt()} px')
                .fontSize(TwFontSizes.xs)
                .textColor(tw.colors.slate.shade400),
          ],
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shadow section
// ─────────────────────────────────────────────────────────────────────────────
class _ShadowSection extends StatelessWidget {
  final TwThemeData tw;
  const _ShadowSection({required this.tw});

  @override
  Widget build(BuildContext context) {
    final shadows = [
      ('sm', TwShadows.sm),
      ('base', TwShadows.base),
      ('md', TwShadows.md),
      ('lg', TwShadows.lg),
      ('xl', TwShadows.xl),
      ('2xl', TwShadows.xl2),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 24,
      children: shadows.map((e) {
        final (label, sh) = e;
        return Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: tw.colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: sh,
              ),
            ),
            const SizedBox(height: 8),
            Text('shadow-$label')
                .fontSize(TwFontSizes.xs)
                .textColor(tw.colors.slate.shade500),
          ],
        );
      }).toList(),
    );
  }
}
