import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'pages/home_page.dart';
import 'pages/jadwal_page.dart';
import 'pages/profil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: MainScaffold(onThemeToggle: toggleTheme),
    );
  }
}

class MainScaffold extends StatefulWidget {
  final void Function(bool) onThemeToggle;

  const MainScaffold({super.key, required this.onThemeToggle});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const JadwalPage(),
      ProfilPage(onThemeToggle: widget.onThemeToggle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('primary-body-small'),
            builder: (_) => _pages[_selectedIndex],
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('primary-body-large'),
            builder: (_) => _pages[_selectedIndex],
          ),
        },
      ),
      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('bottom-nav'),
            builder:
                (_) => BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.schedule),
                      label: 'Jadwal',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Akun',
                    ),
                  ],
                ),
          ),
        },
      ),
    );
  }
}
