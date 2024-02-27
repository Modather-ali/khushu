import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khushu/modules/zekr.dart';

class ZekerContentViewer extends StatelessWidget {
  final Array zekerContent;
  final void Function()? onNext;
  const ZekerContentViewer(
      {super.key, required this.zekerContent, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(
                zekerContent.text,
                style: const TextStyle(
                  fontSize: 20,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('التكرار'),
                      Text(zekerContent.count.toString()),
                    ],
                  ),
                ),
                FloatingActionButton(
                  onPressed: onNext,
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
    );
  }
}
