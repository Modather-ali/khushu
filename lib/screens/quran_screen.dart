import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

import 'package:quran/quran.dart' as quran;

import 'screens.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 114,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SurahView(surahNumber: index + 1),
            ));
          },
          leading: const Icon(FlutterIslamicIcons.solidQuran2),
          title: Text(
            quran.getSurahNameArabic(index + 1),
          ),
          trailing: Text('${index + 1}'),
        );
      },
    );
  }
}
