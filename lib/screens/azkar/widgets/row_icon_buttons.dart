import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../modules/zekr.dart';
import '../../../res/constants.dart';

class RowIconButtons extends StatelessWidget {
  const RowIconButtons({
    super.key,
    required this.zekr,
  });

  final Zekr zekr;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        IconButton(
          onPressed: () {},
          color: Constants.primaryColor,
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
