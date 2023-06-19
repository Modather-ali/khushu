import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../modules/zekr.dart';
import '../res/res.dart';

class ZekerCard extends StatelessWidget {
  final Zekr zekr;
  const ZekerCard({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(zekr.category)),
            Text(
              zekr.zekr,
              textAlign: TextAlign.center,
            ),
            if (zekr.reference.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '${zekr.reference} -',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            Divider(color: Colors.grey.shade400),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم النسخ')),
                    );
                    Clipboard.setData(ClipboardData(text: zekr.zekr));
                  },
                  color: Constants.primaryColor,
                  icon: const Icon(Icons.copy),
                ),
                IconButton(
                  onPressed: () {
                    Share.share(zekr.zekr);
                  },
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
