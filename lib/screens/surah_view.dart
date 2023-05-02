import 'package:flutter/material.dart';

import 'package:quran/quran.dart' as quran;

class SurahView extends StatelessWidget {
  final int surahNumber;
  const SurahView({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quran.getSurahNameArabic(surahNumber)),
      ),
      body: ListView(children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 18),
            children: List.generate(
              quran.getVerseCount(surahNumber),
              (index) {
                return TextSpan(
                  text:
                      '${quran.getVerse(surahNumber, index + 1, verseEndSymbol: true)} ',
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
