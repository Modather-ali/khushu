// To parse this JSON data, do
//
//     final zekr = zekrFromJson(jsonString);

import 'dart:convert';

Zekr zekrFromJson(String str) => Zekr.fromJson(json.decode(str));

String zekrToJson(Zekr data) => json.encode(data.toJson());

class Zekr {
  final String zekr;
  final String category;
  final String reference;

  Zekr({
    required this.zekr,
    required this.category,
    required this.reference,
  });

  Zekr copyWith({
    String? zekr,
    String? category,
    String? reference,
  }) =>
      Zekr(
        zekr: zekr ?? this.zekr,
        category: category ?? this.category,
        reference: reference ?? this.reference,
      );

  factory Zekr.fromJson(Map<String, dynamic> json) => Zekr(
        zekr: json["zekr"],
        category: json["category"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "zekr": zekr,
        "category": category,
        "reference": reference,
      };
}
