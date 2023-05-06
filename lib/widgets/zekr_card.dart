import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../modules/zekr.dart';
import '../res/res.dart';
import '../services/shared_preferences_data.dart';

class ZekerCard extends StatelessWidget {
  final Zekr zekr;
  ZekerCard({super.key, required this.zekr});
  final SharedPreferencesData _sharedPreferencesData = SharedPreferencesData();
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
                    Clipboard.setData(ClipboardData(text: zekr.zekr));
                  },
                  color: Constants.primaryColor,
                  icon: const Icon(Icons.copy),
                ),
                // IconButton(
                //   onPressed: () {
                //     _sharedPreferencesData.saveZekr(zekr);
                //   },
                //   color: Constants.primaryColor,
                //   icon: const Icon(Icons.bookmark_outline),
                // ),
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
