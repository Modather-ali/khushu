import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
    // _circularMenuState.currentState!.reverseAnimation();
    setState(() => _screenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(FlutterIslamicIcons.solidPrayer),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'اذكار',
            onTap: () {
              _changeScreen(0);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.access_alarm),
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            label: 'مواعيد الإذان',
            onTap: () {
              _changeScreen(1);
            },
          ),
          SpeedDialChild(
            child: const Icon(FlutterIslamicIcons.solidQibla),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            label: 'القبله',
            onTap: () {
              _changeScreen(2);
            },
          ),
          SpeedDialChild(
            child: const Icon(FlutterIslamicIcons.solidTasbih2),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: 'سبحة',
            onTap: () {
              _changeScreen(3);
            },
          ),
          SpeedDialChild(
            child: const Icon(FlutterIslamicIcons.solidQuran),
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            label: 'القرءان الكريم',
            onTap: () {
              _changeScreen(4);
            },
          ),
        ],
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
