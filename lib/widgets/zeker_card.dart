import 'package:flutter/material.dart';

import '../res/res.dart';

class ZekerCard extends StatelessWidget {
  const ZekerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Column(
          children: [
            const Text(
              'abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd ',
              textAlign: TextAlign.center,
            ),
            Divider(color: Colors.grey.shade400),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  color: Constants.primaryColor,
                  icon: const Icon(Icons.copy),
                ),
                IconButton(
                  onPressed: () {},
                  color: Constants.primaryColor,
                  icon: const Icon(Icons.bookmark_outline),
                ),
                IconButton(
                  onPressed: () {},
                  color: Constants.primaryColor,
                  icon: const Icon(Icons.share_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
