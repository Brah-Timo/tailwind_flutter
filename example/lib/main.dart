import 'package:flutter/material.dart';
import 'package:tailwind_flutter/tailwind_flutter.dart';

import 'pages/tokens_page.dart';
import 'pages/extensions_page.dart';
import 'pages/styles_page.dart';

void main() {
  runApp(const TailwindFlutterApp());
}

class TailwindFlutterApp extends StatefulWidget {
  const TailwindFlutterApp({super.key});

  @override
  State<TailwindFlutterApp> createState() => _TailwindFlutterAppState();
}

class _TailwindFlutterAppState extends State<TailwindFlutterApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tailwind_flutter showcase',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TwColors.blue),
        useMaterial3: true,
        extensions: TwThemeExtensions.all(data: TwThemeData.light()),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: TwColors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        extensions: TwThemeExtensions.all(data: TwThemeData.dark()),
      ),
      home: Builder(
        builder: (context) {
          final brightness = Theme.of(context).brightness;
          return TwTheme(
            data: TwThemeData.fromBrightness(brightness),
            child: ShowcaseShell(onToggleTheme: _toggleTheme),
          );
        },
      ),
    );
  }
}

// ─── Shell ────────────────────────────────────────────────────────────────────

class ShowcaseShell extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const ShowcaseShell({super.key, required this.onToggleTheme});

  @override
  State<ShowcaseShell> createState() => _ShowcaseShellState();
}

class _ShowcaseShellState extends State<ShowcaseShell> {
  int _selectedIndex = 0;

  static const _pages = [
    TokensPage(),
    ExtensionsPage(),
    StylesPage(),
  ];

  static const _labels = ['Tokens', 'Extensions', 'Styles'];
  static const _icons  = [Icons.palette, Icons.extension, Icons.style];

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final isDark = context.isDarkMode;

    return Scaffold(
      backgroundColor: tw.colors.background,
      appBar: AppBar(
        backgroundColor: tw.colors.surface,
        elevation: 0,
        title: Row(
          children: [
            Text('tailwind')
                .bold()
                .fontSize(TwFontSizes.lg)
                .textColor(tw.colors.slate.shade900),
            Text('_flutter')
                .fontSize(TwFontSizes.lg)
                .textColor(tw.colors.blue.shade500),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onToggleTheme,
            tooltip: 'Toggle dark mode',
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        backgroundColor: tw.colors.surface,
        selectedItemColor: tw.colors.blue.shade600,
        unselectedItemColor: tw.colors.slate.shade400,
        items: List.generate(
          _labels.length,
          (i) => BottomNavigationBarItem(
            icon: Icon(_icons[i]),
            label: _labels[i],
          ),
        ),
      ),
    );
  }
}
