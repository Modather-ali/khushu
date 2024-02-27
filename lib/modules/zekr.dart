// To parse this JSON data, do
//
//     final zekr = zekrFromJson(jsonString);

import 'dart:convert';

Zekr zekrFromJson(String str) => Zekr.fromJson(json.decode(str));

String zekrToJson(Zekr data) => json.encode(data.toJson());

class Zekr {
  int id;
  String category;
  String audio;
  String filename;
  List<Array> array;

  Zekr({
    required this.id,
    required this.category,
    required this.audio,
    required this.filename,
    required this.array,
  });

  Zekr copyWith({
    int? id,
    String? category,
    String? audio,
    String? filename,
    List<Array>? array,
  }) =>
      Zekr(
        id: id ?? this.id,
        category: category ?? this.category,
        audio: audio ?? this.audio,
        filename: filename ?? this.filename,
        array: array ?? this.array,
      );

  factory Zekr.fromJson(Map<String, dynamic> json) => Zekr(
        id: json["id"],
        category: json["category"],
        audio: json["audio"],
        filename: json["filename"],
        array: List<Array>.from(json["array"].map((x) => Array.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "audio": audio,
        "filename": filename,
        "array": List<dynamic>.from(array.map((x) => x.toJson())),
      };
}

class Array {
  int id;
  String text;
  int count;
  String audio;
  String filename;

  Array({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
  });

  Array copyWith({
    int? id,
    String? text,
    int? count,
    String? audio,
    String? filename,
  }) =>
      Array(
        id: id ?? this.id,
        text: text ?? this.text,
        count: count ?? this.count,
        audio: audio ?? this.audio,
        filename: filename ?? this.filename,
      );

  factory Array.fromJson(Map<String, dynamic> json) => Array(
        id: json["id"],
        text: json["text"],
        count: json["count"],
        audio: json["audio"],
        filename: json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "count": count,
        "audio": audio,
        "filename": filename,
      };
}
