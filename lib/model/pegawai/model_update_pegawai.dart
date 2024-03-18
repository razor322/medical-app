// To parse this JSON data, do
//
//     final modelUpdatePegawai = modelUpdatePegawaiFromJson(jsonString);

import 'dart:convert';

ModelUpdatePegawai modelUpdatePegawaiFromJson(String str) =>
    ModelUpdatePegawai.fromJson(json.decode(str));

String modelUpdatePegawaiToJson(ModelUpdatePegawai data) =>
    json.encode(data.toJson());

class ModelUpdatePegawai {
  int value;
  String message;

  ModelUpdatePegawai({
    required this.value,
    required this.message,
  });

  factory ModelUpdatePegawai.fromJson(Map<String, dynamic> json) =>
      ModelUpdatePegawai(
        value: json["value"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "message": message,
      };
}
