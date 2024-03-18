// To parse this JSON data, do
//
//     final modelBerita = modelBeritaFromJson(jsonString);

import 'dart:convert';

ModelBerita modelBeritaFromJson(String str) => ModelBerita.fromJson(json.decode(str));

String modelBeritaToJson(ModelBerita data) => json.encode(data.toJson());

class ModelBerita {
    bool isSuccess;
    String message;
    List<Datum> data;

    ModelBerita({
        required this.isSuccess,
        required this.message,
        required this.data,
    });

    factory ModelBerita.fromJson(Map<String, dynamic> json) => ModelBerita(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String judul;
    String isiBerita;
    String gambarBerita;
    DateTime tglBerita;

    Datum({
        required this.id,
        required this.judul,
        required this.isiBerita,
        required this.gambarBerita,
        required this.tglBerita,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        judul: json["judul"],
        isiBerita: json["isi_berita"],
        gambarBerita: json["gambar_berita"],
        tglBerita: DateTime.parse(json["tgl_berita"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "isi_berita": isiBerita,
        "gambar_berita": gambarBerita,
        "tgl_berita": tglBerita.toIso8601String(),
    };
}
