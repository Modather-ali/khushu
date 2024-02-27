import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../modules/zekr.dart';
import '../../../../res/data.dart';
import 'widgets/zeker_category_widget.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final List<Zekr> _azkar = [];
  _loadAzkar() async {
    Zekr newZekr;
    for (var zekrData in AZKAR) {
      newZekr = Zekr.fromJson(zekrData);
      _azkar.add(newZekr);
    }
    log(_azkar.length.toString());
    setState(() {});
  }

  @override
  void initState() {
    _loadAzkar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('خشوع'), actions: const [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.menu),
        // ),
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZekerCategoryWidget(
                zekr: _azkar[0],
                category: 'اذكار الصباح',
                image: 'assets/icons/sun.png',
              ),
              ZekerCategoryWidget(
                zekr: _azkar[0],
                category: 'اذكار المساء',
                image: 'assets/icons/half-moon.png',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZekerCategoryWidget(
                zekr: _azkar[1],
                category: 'اذكار النوم',
                image: 'assets/icons/sleep.png',
              ),
              ZekerCategoryWidget(
                zekr: _azkar[2],
                category: 'اذكار الاستيغاظ',
                image: 'assets/icons/awaken.png',
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     ZekerCategoryWidget(
          //       zekr: _azkar[0],
          //       category: 'اذكار قبل الصلاة',
          //       image: 'assets/icons/praying.png',
          //     ),
          //     ZekerCategoryWidget(
          //       zekr: _azkar[0],
          //       category: 'اذكار بعد الصلاة',
          //       image: 'assets/icons/praying.png',
          //     ),
          //   ],
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZekerCategoryWidget(
                zekr: _azkar[3],
                category: 'اذكار الخروج من المنزل',
                image: 'assets/icons/door.png',
              ),
              ZekerCategoryWidget(
                zekr: _azkar[4],
                category: 'اذكار دخول المنزل',
                image: 'assets/icons/door.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
