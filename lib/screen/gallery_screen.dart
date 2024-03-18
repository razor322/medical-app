import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medical_app/const.dart';
import 'package:medical_app/model/berita/model_berita.dart';
import 'package:http/http.dart' as http;
import 'package:insta_image_viewer/insta_image_viewer.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late List<Datum?> listImage = [];

  Future<List<Datum>?> getGambar() async {
    try {
      http.Response res = await http.get(Uri.parse('$url/getBerita.php'));
      var data = jsonDecode(res.body);
      setState(() {
        for (var i in data['data']) {
          listImage.add(Datum.fromJson(i));
        }
      });
      print('berhasil');
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      });
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getGambar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
          centerTitle: true,
          backgroundColor: Colors.green.shade200,
        ),
        body: GridView.builder(
            itemCount: listImage.length,
            padding: EdgeInsets.all(5),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              Datum? data = listImage[index];
              return Card(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          // width: 100,
                          // height: 140,
                          child: InstaImageViewer(
                            child: Image(
                              image: Image.network(
                                '$url/gambar_berita/${data?.gambarBerita}',
                                fit: BoxFit.fill,
                                scale: 0.3,
                                height: 180,
                                width: double.infinity,
                              ).image,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '${data?.judul}, ',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
