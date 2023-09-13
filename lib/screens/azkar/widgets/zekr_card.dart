import 'package:flutter/material.dart';

import '../../../modules/zekr.dart';
import 'row_icon_buttons.dart';

class ZekrCard extends StatelessWidget {
  final Zekr zekr;
  const ZekrCard({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(zekr.category),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SelectableText(
                zekr.zekr,
                textAlign: TextAlign.center,
              ),
            ),
            if (zekr.reference.isNotEmpty)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '- ${zekr.reference}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            Divider(
              color: Colors.grey.shade400,
              height: 0,
            ),
            RowIconButtons(zekr: zekr),
          ],
        ),
      ),
    );
  }
}
