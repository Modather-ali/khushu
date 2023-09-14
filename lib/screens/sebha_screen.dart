import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart';
import 'package:vibration/vibration.dart';

// import '../../services/shared_preferences_data.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  bool _hasVibrator = false;
  final bool _editCounter = false;
  final TextEditingController _textEditingController = TextEditingController();
  // final SharedPreferencesData _sharedPreferencesData = SharedPreferencesData();

  _init() async {
    _hasVibrator = (await Vibration.hasVibrator())!;
    // await _sharedPreferencesData.init();
    // _counter = _sharedPreferencesData.sebhaCounter;
    setState(() {});
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
          title: const Text('(سبح بإسم ربك الاعلى)'),
        ),
        backgroundColor: const Color(0xFFE7ECEF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'إستغفر الله',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () async {
                  if (_hasVibrator) {
                    Vibration.vibrate(duration: 50);
                  }
                  setState(() {
                    _counter++;
                  });
                  // _sharedPreferencesData.increaseSebhaCounter(_counter);
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
                    numberTextStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                    duration: const Duration(seconds: 1),
                    odometerNumber: OdometerNumber(_counter),
                    letterWidth: 13,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
