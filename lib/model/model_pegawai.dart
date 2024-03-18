// To parse this JSON data, do
//
//     final modelPegawai = modelPegawaiFromJson(jsonString);

import 'dart:convert';

ModelPegawai modelPegawaiFromJson(String str) =>
    ModelPegawai.fromJson(json.decode(str));

String modelPegawaiToJson(ModelPegawai data) => json.encode(data.toJson());

class ModelPegawai {
  List<Datum> data;

  ModelPegawai({
    required this.data,
  });

  factory ModelPegawai.fromJson(Map<String, dynamic> json) => ModelPegawai(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String nama;
  String noBp;
  String noHp;
  String email;
  DateTime tanggalInput;

  Datum({
    required this.id,
    required this.nama,
    required this.noBp,
    required this.noHp,
    required this.email,
    required this.tanggalInput,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        noBp: json["no_bp"],
        noHp: json["no_hp"],
        email: json["email"],
        tanggalInput: DateTime.parse(json["tanggal_input"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "no_bp": noBp,
        "no_hp": noHp,
        "email": email,
        "tanggal_input": tanggalInput.toIso8601String(),
      };
}
