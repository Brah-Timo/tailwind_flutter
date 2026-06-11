import 'package:flutter/material.dart';
import 'package:tailwind_flutter/tailwind_flutter.dart';

/// Page 2 — Live before/after comparisons for every extension category.
class ExtensionsPage extends StatelessWidget {
  const ExtensionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Widget & Text Extensions')
              .bold()
              .fontSize(TwFontSizes.xl2)
              .textColor(tw.colors.slate.shade900)
              .pb(TwSpacing.s2),

          Text('Hover over the snippets to see before/after code')
              .fontSize(TwFontSizes.sm)
              .textColor(tw.colors.slate.shade500)
              .pb(TwSpacing.s6),

          // ── Product Card ──────────────────────────────────────────────────
          _ComparisonCard(
            title: 'Product Card',
            tailwindClasses: 'bg-white p-4 rounded-lg shadow-md border',
            demo: _ProductCardDemo(tw: tw),
          ),
          const SizedBox(height: 16),

          // ── Badge ─────────────────────────────────────────────────────────
          _ComparisonCard(
            title: 'Status Badge',
            tailwindClasses: 'bg-green-100 text-green-800 text-xs font-bold px-2 py-0.5 rounded-full',
            demo: _BadgeDemo(tw: tw),
          ),
          const SizedBox(height: 16),

          // ── Primary Button ────────────────────────────────────────────────
          _ComparisonCard(
            title: 'Primary Button',
            tailwindClasses: 'bg-blue-600 text-white font-bold px-6 py-3 rounded-lg shadow-md',
            demo: _ButtonDemo(tw: tw),
          ),
          const SizedBox(height: 16),

          // ── Avatar ────────────────────────────────────────────────────────
          _ComparisonCard(
            title: 'Circular Avatar',
            tailwindClasses: 'w-12 h-12 rounded-full border-2 border-white shadow-sm',
            demo: _AvatarDemo(tw: tw),
          ),
          const SizedBox(height: 16),

          // ── Text transforms ───────────────────────────────────────────────
          _ComparisonCard(
            title: 'Text Transforms',
            tailwindClasses: 'uppercase / lowercase / capitalize',
            demo: _TextTransformDemo(tw: tw),
          ),
          const SizedBox(height: 16),

          // ── Gradient ──────────────────────────────────────────────────────
          _ComparisonCard(
            title: 'Gradient Banner',
            tailwindClasses: 'bg-gradient-to-r from-blue-500 to-indigo-600 text-white p-6 rounded-xl',
            demo: _GradientDemo(tw: tw),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Comparison Card wrapper
// ─────────────────────────────────────────────────────────────────────────────
class _ComparisonCard extends StatelessWidget {
  final String title;
  final String tailwindClasses;
  final Widget demo;

  const _ComparisonCard({
    required this.title,
    required this.tailwindClasses,
    required this.demo,
  });

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return Container(
      decoration: BoxDecoration(
        color: tw.colors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: TwShadows.sm,
        border: Border.all(color: tw.colors.slate.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: tw.colors.slate.shade50,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(
                bottom: BorderSide(color: tw.colors.slate.shade200),
              ),
            ),
            child: Row(
              children: [
                Text(title)
                    .semibold()
                    .fontSize(TwFontSizes.sm)
                    .textColor(tw.colors.slate.shade700),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: tw.colors.slate.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(tailwindClasses)
                      .fontSize(TwFontSizes.xs)
                      .textColor(tw.colors.slate.shade500),
                ),
              ],
            ),
          ),
          // Demo area
          Padding(
            padding: const EdgeInsets.all(16),
            child: demo,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Demo widgets
// ─────────────────────────────────────────────────────────────────────────────

class _ProductCardDemo extends StatelessWidget {
  final TwThemeData tw;
  const _ProductCardDemo({required this.tw});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Wireless Headphones')
            .bold()
            .fontSize(TwFontSizes.lg)
            .textColor(tw.colors.slate.shade900),
        const SizedBox(height: 4),
        Text('Premium noise-cancelling audio experience')
            .fontSize(TwFontSizes.sm)
            .textColor(tw.colors.slate.shade500),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$299.00')
                .bold()
                .fontSize(TwFontSizes.xl)
                .textColor(tw.colors.blue.shade600),
            Text('In Stock')
                .bold()
                .fontSize(TwFontSizes.xs)
                .textColor(tw.colors.green.shade700)
                .px(TwSpacing.s2)
                .py(TwSpacing.s0_5)
                .bg(tw.colors.green.shade100)
                .rounded(TwRadii.full.value),
          ],
        ),
      ],
    )
        .p(TwSpacing.s4)
        .bg(tw.colors.white)
        .rounded(TwRadii.lg.value)
        .shadow(TwShadows.md)
        .border(color: tw.colors.slate.shade200);
  }
}

class _BadgeDemo extends StatelessWidget {
  final TwThemeData tw;
  const _BadgeDemo({required this.tw});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Text('Active')
            .bold()
            .fontSize(TwFontSizes.xs)
            .textColor(tw.colors.green.shade800)
            .px(TwSpacing.s2)
            .py(TwSpacing.s0_5)
            .bg(tw.colors.green.shade100)
            .rounded(TwRadii.full.value),
        Text('Pending')
            .bold()
            .fontSize(TwFontSizes.xs)
            .textColor(tw.colors.amber.shade800)
            .px(TwSpacing.s2)
            .py(TwSpacing.s0_5)
            .bg(tw.colors.amber.shade100)
            .rounded(TwRadii.full.value),
        Text('Archived')
            .bold()
            .fontSize(TwFontSizes.xs)
            .textColor(tw.colors.slate.shade600)
            .px(TwSpacing.s2)
            .py(TwSpacing.s0_5)
            .bg(tw.colors.slate.shade100)
            .rounded(TwRadii.full.value),
        Text('Error')
            .bold()
            .fontSize(TwFontSizes.xs)
            .textColor(tw.colors.red.shade800)
            .px(TwSpacing.s2)
            .py(TwSpacing.s0_5)
            .bg(tw.colors.red.shade100)
            .rounded(TwRadii.full.value),
      ],
    );
  }
}

class _ButtonDemo extends StatelessWidget {
  final TwThemeData tw;
  const _ButtonDemo({required this.tw});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        // Primary
        Text('Get Started')
            .bold()
            .fontSize(TwFontSizes.base)
            .textColor(tw.colors.white)
            .px(TwSpacing.s6)
            .py(TwSpacing.s3)
            .bg(tw.colors.blue.shade600)
            .rounded(TwRadii.lg.value)
            .shadow(TwShadows.md)
            .onTap(() {}),

        // Secondary
        Text('Learn more')
            .semibold()
            .fontSize(TwFontSizes.base)
            .textColor(tw.colors.blue.shade700)
            .px(TwSpacing.s6)
            .py(TwSpacing.s3)
            .bg(tw.colors.blue.shade50)
            .rounded(TwRadii.lg.value)
            .border(color: tw.colors.blue.shade200)
            .onTap(() {}),

        // Ghost
        Text('Cancel')
            .fontSize(TwFontSizes.base)
            .textColor(tw.colors.slate.shade600)
            .px(TwSpacing.s6)
            .py(TwSpacing.s3)
            .rounded(TwRadii.lg.value)
            .border(color: tw.colors.slate.shade300)
            .onTap(() {}),
      ],
    );
  }
}

class _AvatarDemo extends StatelessWidget {
  final TwThemeData tw;
  const _AvatarDemo({required this.tw});

  @override
  Widget build(BuildContext context) {
    final avatarColors = [
      tw.colors.blue.shade500,
      tw.colors.violet.shade500,
      tw.colors.emerald.shade500,
      tw.colors.rose.shade500,
    ];

    final initials = ['AB', 'CD', 'EF', 'GH'];

    return Row(
      children: List.generate(4, (i) {
        return Container(
          width: 44,
          height: 44,
          margin: EdgeInsets.only(right: i < 3 ? 8 : 0),
          decoration: BoxDecoration(
            color: avatarColors[i],
            shape: BoxShape.circle,
            border: Border.all(color: tw.colors.white, width: 2),
            boxShadow: TwShadows.sm,
          ),
          child: Center(
            child: Text(initials[i])
                .bold()
                .fontSize(TwFontSizes.xs)
                .textColor(tw.colors.white),
          ),
        );
      }),
    );
  }
}

class _TextTransformDemo extends StatelessWidget {
  final TwThemeData tw;
  const _TextTransformDemo({required this.tw});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text('uppercase: ')
              .fontSize(TwFontSizes.sm)
              .textColor(tw.colors.slate.shade500),
          Text('hello world').uppercase().bold().textColor(tw.colors.slate.shade800),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Text('lowercase: ')
              .fontSize(TwFontSizes.sm)
              .textColor(tw.colors.slate.shade500),
          Text('HELLO WORLD').lowercase().bold().textColor(tw.colors.slate.shade800),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Text('capitalize: ')
              .fontSize(TwFontSizes.sm)
              .textColor(tw.colors.slate.shade500),
          Text('hello world dart').capitalize().bold().textColor(tw.colors.slate.shade800),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Text('ellipsis: ')
              .fontSize(TwFontSizes.sm)
              .textColor(tw.colors.slate.shade500),
          Expanded(
            child: Text('A very long text that should be truncated with an ellipsis')
                .ellipsis()
                .textColor(tw.colors.slate.shade800),
          ),
        ]),
      ],
    );
  }
}

class _GradientDemo extends StatelessWidget {
  final TwThemeData tw;
  const _GradientDemo({required this.tw});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pro Plan')
            .bold()
            .fontSize(TwFontSizes.xl2)
            .textColor(tw.colors.white),
        const SizedBox(height: 4),
        Text('Everything you need to ship faster')
            .fontSize(TwFontSizes.sm)
            .textColor(tw.colors.blue.shade200),
        const SizedBox(height: 16),
        Text('\$29 / month')
            .bold()
            .fontSize(TwFontSizes.xl3)
            .textColor(tw.colors.white),
      ],
    )
        .p(TwSpacing.s6)
        .gradient(LinearGradient(
          colors: [tw.colors.blue.shade500, tw.colors.indigo.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ))
        .rounded(TwRadii.xl.value)
        .fullWidth();
  }
}
