import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 100000999;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE7ECEF),
        body: Center(
          child: GestureDetector(
            onTap: () {
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
              child: Text(
                '$_counter',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }
}
