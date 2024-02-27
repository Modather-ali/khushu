import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:get/get.dart';
import 'package:khushu/utils/logger_utils.dart';

class ZekerScreen extends StatefulWidget {
  final String category;
  const ZekerScreen({super.key, required this.category});

  @override
  State<ZekerScreen> createState() => _ZekerScreenState();
}

class _ZekerScreenState extends State<ZekerScreen> {
  int page = 1;
  int counter = 4;
  List list = [0, 1, 2, 3, 4, 5];
  final PageController _pageController = PageController();
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
          bottom: _steps(),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (pageIndex) {
            // _pageController.animateTo(pageIndex.toDouble(),
            //     duration: const Duration(microseconds: 200),
            //     curve: Curves.easeInToLinear);
            page = pageIndex + 1;
            setState(() {});
          },
          children: List.generate(
              list.length,
              (index) => Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SelectableText(
                              'نص الذكر ' * 70 + list[index].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 20,
                        child: SizedBox(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {},
                                heroTag: 'repeat',
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('التكرار'),
                                    Text('1/3'),
                                  ],
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (page > list.length) {
                                    Logger.print('The end');
                                    Get.back();
                                    return;
                                  }
                                  int pageIndex = page;
                                  _pageController.animateToPage(
                                    pageIndex,
                                    duration: const Duration(microseconds: 250),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                  page = pageIndex + 1;
                                  setState(() {});
                                },
                                heroTag: 'next',
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('التالي'),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
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
            list: list,
            onChange: (i) {
              // _pageController.animateTo(i.toDouble(),
              //     duration: const Duration(microseconds: 200),
              //     curve: Curves.easeInToLinear);
              // page = i;
              // setState(() {});
            },
            page: page,
            // onClickItem: (p0) {
            //   page = p0;

            //   setState(() {});
            // },
          ),
        ),
      ),
    );
  }
}
