import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart';
import 'package:vibration/vibration.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  bool _hasVibrator = false;
  _init() async {
    _hasVibrator = (await Vibration.hasVibrator())!;
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFE7ECEF),
          title: const Text('سبحة'),
        ),
        backgroundColor: const Color(0xFFE7ECEF),
        body: Center(
          child: GestureDetector(
            onTap: () async {
              if (_hasVibrator) {
                Vibration.vibrate(duration: 50);
              }
              setState(() {
                _counter++;
              });
            },
            child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xFFE7ECEF),
                  // borderRadius: BorderRadius.circular(30),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: Offset(-20, -20),
                      color: Colors.white,
                    ),
                    BoxShadow(
                      blurRadius: 30,
                      offset: Offset(20, 20),
                      color: Color(0xFFA7A9AF),
                    )
                  ]),
              child: AnimatedSlideOdometerNumber(
                numberTextStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                duration: const Duration(seconds: 1),
                odometerNumber: OdometerNumber(_counter),
                letterWidth: 13,
              ),
            ),
          ),
        ));
  }
}
