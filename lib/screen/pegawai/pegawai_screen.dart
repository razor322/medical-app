// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/const.dart';
import 'package:medical_app/model/pegawai/model_delete_pegawai.dart';
import 'package:medical_app/model/pegawai/model_pegawai.dart';
import 'package:medical_app/screen/pegawai/pegawai_create_screen.dart';
import 'package:medical_app/screen/pegawai/pegawai_detail_screen.dart';
import 'package:medical_app/screen/pegawai/pegawai_edit_screen.dart';

class PegawaiScreen extends StatefulWidget {
  const PegawaiScreen({super.key});

  @override
  State<PegawaiScreen> createState() => _PegawaiScreenState();
}

class _PegawaiScreenState extends State<PegawaiScreen> {
  TextEditingController txtcari = TextEditingController();
  bool isCari = false;
  bool isLoading = false;
  late List<Datum> _allPegawai = [];
  late List<Datum> _searchResult = [];

  @override
  void initState() {
    // TODO: implement initState
    getPegawai();
    super.initState();
  }

  Future<List<Datum>?> getPegawai() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.get(Uri.parse('$url/read_pegawai.php'));
      List<Datum> data = modelPegawaiFromJson(res.body).data ?? [];
      setState(() {
        _allPegawai = data;
        _searchResult = data;
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
        print(e.toString());
      });
    }
  }

  Future<void> deletePegawai(int id) async {
    try {
      setState(() {
        isLoading = false;
      });

      http.Response res =
          await http.delete(Uri.parse('$url/delete_pegawai.php?id=$id'));

      // Periksa apakah permintaan berhasil (status kode 200)
      if (res.statusCode == 200) {
        // Parsing respon dari JSON ke objek ModelDeletePegawai
        ModelDeletePegawai data = modelDeletePegawaiFromJson(res.body);

        if (data.value == 1) {
          setState(() {
            // Hapus pegawai dari _searchResult berdasarkan ID
            _searchResult.removeWhere((pegawai) => pegawai.id == id.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${data.message}')),
            );
          });

          // Panggil kembali _filterBerita untuk memperbarui tampilan berdasarkan pencarian yang saat ini ada
          _filterBerita(txtcari.text);
          setState(() {
            getPegawai();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${data.message}')),
          );
        }
      } else {
        // Menampilkan pesan kesalahan jika permintaan tidak berhasil
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menghapus pegawai')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _filterBerita(String query) {
    List<Datum> filteredBerita = _allPegawai
        .where((pegawai) =>
            pegawai.nama!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _searchResult = filteredBerita;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.blue.shade300,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PegawaiCreateScreen()));
        },
        tooltip: "tambah pegawai",
        child: Icon(
          Icons.add,
          size: 25,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              onChanged: _filterBerita,
              controller: txtcari,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.deepPurple.shade100,
                hintText: "Search",
                hintStyle: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("List Pegawai")
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (context, index) {
                        Datum data = _searchResult[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Card(
                              child: ListTile(
                                minLeadingWidth: 15,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue.shade200,
                                  child: Icon(
                                    Icons.person,
                                    size: 25,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      tooltip: "hapus data",
                                      onPressed: () {
                                        // Mengonversi ID dari string ke integer
                                        int idToDelete =
                                            int.parse(_searchResult[index].id);
                                        // Panggil fungsi deletePegawai dengan ID pegawai
                                        deletePegawai(idToDelete);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: "edit data",
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PegawaiEditScreen(data)));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.yellow.shade800,
                                        size: 20,
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: "lihat data",
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PegawaiDetail(data)));
                                      },
                                      icon: Icon(
                                        Icons.info_outline_rounded,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text("${data.nama}"),
                                subtitle: Text("${data.email}"),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
