import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:get/get.dart';

import '../../modules/zekr.dart';
import '../../utils/logger_utils.dart';
import 'widgets/zeker_content_viewer.dart';

class ZekerScreen extends StatefulWidget {
  final String category;
  final Zekr zekr;
  const ZekerScreen({super.key, required this.category, required this.zekr});

  @override
  State<ZekerScreen> createState() => _ZekerScreenState();
}

class _ZekerScreenState extends State<ZekerScreen> {
  int _zekerIndex = 1;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.category),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '$_zekerIndex/${widget.zekr.array.length}',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
          bottom: _steps(),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (pageIndex) {
            _zekerIndex = pageIndex + 1;
            setState(() {});
          },
          children: List.generate(
            widget.zekr.array.length,
            (index) => ZekerContentViewer(
              zekerContent: widget.zekr.array[index],
              onNext: () {
                if (_zekerIndex > widget.zekr.array.length) {
                  Logger.print('The end');
                  Get.back();
                  return;
                }
                int pageIndex = _zekerIndex;
                _pageController.animateToPage(
                  pageIndex,
                  duration: const Duration(microseconds: 250),
                  curve: Curves.fastOutSlowIn,
                );
                _zekerIndex = pageIndex + 1;
                setState(() {});
              },
            ),
          ),
        ));
  }

  PreferredSize _steps() {
    return PreferredSize(
      preferredSize: Size(Get.width, 20),
      child: SizedBox(
        width: double.maxFinite,
        height: 30,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: FlutterStepIndicator(
            height: 28,
            paddingLine: const EdgeInsets.symmetric(horizontal: 0),
            positiveColor: const Color(0xFF00B551),
            progressColor: const Color(0xFFEA9C00),
            negativeColor: const Color(0xFFD5D5D5),
            padding: const EdgeInsets.all(4),
            list: widget.zekr.array,
            onChange: (i) {},
            page: _zekerIndex,
          ),
        ),
      ),
    );
  }
}
