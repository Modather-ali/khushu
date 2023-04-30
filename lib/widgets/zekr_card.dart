import 'package:flutter/material.dart';

import '../modules/zekr.dart';
import '../res/res.dart';

class ZekerCard extends StatelessWidget {
  final Zekr zekr;
  const ZekerCard({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              zekr.zekr,
              textAlign: TextAlign.center,
            ),
            if (zekr.reference.isNotEmpty) Text('- ${zekr.reference}'),
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
