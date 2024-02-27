import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../zeker_screen.dart';

class ZekerCategoryWidget extends StatelessWidget {
  final String category;
  final String image;
  const ZekerCategoryWidget({
    super.key,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ZekerScreen(
              category: category,
            ));
      },
      child: Card(
        child: SizedBox(
            height: 100,
            width: 150,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        image,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ],
            )),
      ),
    );
  }
}
