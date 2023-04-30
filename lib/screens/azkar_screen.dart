import 'dart:developer';

import 'package:flutter/material.dart';

import '../modules/zekr.dart';
import '../services/data.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final Services _services = Services();
  final List<Zekr> _azkar = [];
  _loadAzkar() async {
    Zekr newZekr;
    AZKAR.shuffle();
    for (var zekr in AZKAR) {
      newZekr = Zekr(zekr: zekr[1], category: zekr[0], reference: zekr[4]);
      _azkar.add(newZekr);
    }
    // await _services.loadAzkarData();
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            MaterialButton(
              onPressed: () {
                _loadAzkar();
              },
            )
          ],
          title: const Text('اذكار'),
          toolbarHeight: 0,
          bottom: const TabBar(tabs: [
            Tab(text: 'اذكار'),
            Tab(text: 'المفضلة'),
          ]),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: _azkar.length,
              itemBuilder: (context, index) {
                return ZekerCard(
                  zekr: _azkar[index],
                );
              },
              padding: const EdgeInsets.all(10),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
