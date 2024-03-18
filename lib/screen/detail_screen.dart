import 'package:flutter/material.dart';
import 'package:medical_app/const.dart';
import 'package:medical_app/model/model_berita.dart';
import 'package:intl/intl.dart';

class PageDetailBerita extends StatelessWidget {
  final Datum? data;
  const PageDetailBerita(this.data ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 170, 146),
        title: Text(
          data!.judul
        ),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: Image.network('$url/gambar_berita/${data?.gambarBerita}', fit: BoxFit.fill,
            ),
          ),ListTile(
            title: Text(data?.judul ?? "", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),), 
            subtitle: Text(DateFormat().format(data?.tglBerita ?? DateTime.now())),
            trailing:  Icon(Icons.star, color: Color.fromARGB(255, 0, 170, 146),),
          ), 
          Container(
            margin: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
            child: Text(
              data?.isiBerita ?? "",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              // textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}