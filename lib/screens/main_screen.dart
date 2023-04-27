import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<CircularMenuState> _circularMenuState =
      GlobalKey<CircularMenuState>();

  int _screenIndex = 0;
  _changeScreen(int index) {
    _circularMenuState.currentState!.reverseAnimation();
    setState(() => _screenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: CircularMenu(key: _circularMenuState, items: [
        CircularMenuItem(
          icon: Icons.home,
          onTap: () {
            _changeScreen(0);
          },
        ),
        CircularMenuItem(
          icon: Icons.search,
          onTap: () {
            _changeScreen(1);
          },
        ),
        CircularMenuItem(
          icon: Icons.settings,
          onTap: () {
            _changeScreen(2);
          },
        ),
        CircularMenuItem(
          icon: Icons.star,
          onTap: () {
            _changeScreen(3);
          },
        ),
        CircularMenuItem(
          icon: Icons.settings,
          onTap: () {
            _changeScreen(4);
          },
        ),
      ]),
      appBar: AppBar(
        title: const Text('خشوع'),
      ),
      body: IndexedStack(
        index: _screenIndex,
        children: [
          const AzkarScreen(),
          const AzanTimesScreen(),
          QiblaScreen(),
          const SebhaScreen(),
        ],
      ),
    );
  }
}
