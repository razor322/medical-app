import 'package:flutter/material.dart';

class PageDetailBerita extends StatefulWidget {
  // final Datum? data;
  const PageDetailBerita({super.key}); //this.data

  @override
  State<PageDetailBerita> createState() => _PageDetailBeritaState();
}

class _PageDetailBeritaState extends State<PageDetailBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 170, 146),
        // title: Text(
        //   data!.judul
        // ),
      ),
      // body: ListView(
      //   children: [
      //     Padding(padding: EdgeInsets.all(10),
      //     child: Image.network('http://localhost/beritadb/gambar_berita/${data?.gambarBerita}', fit: BoxFit.fill,
      //       ),
      //     ),ListTile(
      //       title: Text(data?.judul ?? "", 
      //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),), 
      //       subtitle: Text(DateFormat().format(data?.tglBerita ?? DateTime.now())),
      //       trailing:  Icon(Icons.star, color: Colors.orange,),
      //     ), 
      //     Container(
      //       margin: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
      //       child: Text(
      //         data?.isiBerita ?? "",
      //         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      //         // textAlign: TextAlign.justify,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}