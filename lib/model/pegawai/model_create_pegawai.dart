// To parse this JSON data, do
//
//     final modelAddPegawai = modelAddPegawaiFromJson(jsonString);

import 'dart:convert';

ModelAddPegawai modelAddPegawaiFromJson(String str) =>
    ModelAddPegawai.fromJson(json.decode(str));

String modelAddPegawaiToJson(ModelAddPegawai data) =>
    json.encode(data.toJson());

class ModelAddPegawai {
  int value;
  String message;

  ModelAddPegawai({
    required this.value,
    required this.message,
  });

  factory ModelAddPegawai.fromJson(Map<String, dynamic> json) =>
      ModelAddPegawai(
        value: json["value"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "message": message,
      };
}
