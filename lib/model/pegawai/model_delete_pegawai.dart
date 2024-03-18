// To parse this JSON data, do
//
//     final modelDeletePegawai = modelDeletePegawaiFromJson(jsonString);

import 'dart:convert';

ModelDeletePegawai modelDeletePegawaiFromJson(String str) =>
    ModelDeletePegawai.fromJson(json.decode(str));

String modelDeletePegawaiToJson(ModelDeletePegawai data) =>
    json.encode(data.toJson());

class ModelDeletePegawai {
  int value;
  String message;

  ModelDeletePegawai({
    required this.value,
    required this.message,
  });

  factory ModelDeletePegawai.fromJson(Map<String, dynamic> json) =>
      ModelDeletePegawai(
        value: json["value"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "message": message,
      };
}
