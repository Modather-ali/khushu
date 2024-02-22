import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

import 'azan_times_screen.dart';
import 'azkar/azkar_screen.dart';
import 'qibla/qibla_screen.dart';
import 'sebha_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _screenIndex = 0;

  final List<Widget> _screens = [
    const AzkarScreen(),
    const AzanTimesScreen(),
    QiblaScreen(),
    const SebhaScreen(),
    // Container(color: Colors.pink),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_screenIndex],
      appBar: AppBar(
        title: const Text('خشوع'),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.settings),
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _screenIndex,
        onTap: (value) {
          setState(() {
            _screenIndex = value;
          });
        },
        items: [
          _bnbItem(
            label: 'اذكار',
            icon: FlutterIslamicIcons.solidPrayer,
          ),
          _bnbItem(
            label: 'مواعيد الإذان',
            icon: Icons.access_alarm,
          ),
          _bnbItem(icon: FlutterIslamicIcons.solidQibla, label: 'القبله'),
          _bnbItem(icon: FlutterIslamicIcons.solidTasbih2, label: 'سبحة'),
          // _bnbItem(
          //     icon: FlutterIslamicIcons.solidQuran, label: 'القرءان الكريم'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bnbItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
