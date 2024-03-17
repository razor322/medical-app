// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/const.dart';
import 'package:medical_app/screen/pegawai/pegawai_create_screen.dart';

class PegawaiScreen extends StatefulWidget {
  const PegawaiScreen({super.key});

  @override
  State<PegawaiScreen> createState() => _PegawaiScreenState();
}

class _PegawaiScreenState extends State<PegawaiScreen> {
  TextEditingController txtcari = TextEditingController();
  bool isCari = false;
  bool isLoading = false;
  // List<Data?> listBerita = [];
  // List<Data?> listBerita = [];
  List<String> filterData = [];

  _PegawaiScreenState() {
    txtcari.addListener(() {
      if (txtcari.text.isEmpty) {
        setState(() {
          isCari = true;
          txtcari.text = "";
        });
      } else {
        setState(() {
          isCari = false;
          txtcari.text != "";
        });
      }
    });
  }

  Future getPegawai() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res =
          await http.get(Uri.parse('http://$url/kamusDb/getKamus.php'));
      var data = jsonDecode(res.body);
      setState(() {
        for (var i in data['data']) {
          // listBerita.add(listBerita.fromJson(i));
        }
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

  Future<void> deletePegawai() async {
    try {
      setState(() {
        isLoading = false;
      });
      http.Response res =
          await http.delete(Uri.parse('http://$url/kamusDb/getKamus.php'));
      var data = jsonDecode(res.body);
      setState(() {
        getPegawai();
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
        print(e.toString());
      });
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPegawai();
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
              controller: txtcari,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.search),
                ),
                suffixIcon: Tooltip(
                  message: "Clear search",
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: IconButton(
                      onPressed: () {
                        txtcari.clear();
                      },
                      icon: Icon(Icons.clear_outlined),
                    ),
                  ),
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
                      itemCount: 15,
                      itemBuilder: (context, index) {
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
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: "edit data",
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.yellow.shade800,
                                        size: 20,
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: "lihat data",
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.info_outline_rounded,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text("nama1"),
                                subtitle: Text("nama2"),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Widget createFilterList() {
  //   filterData = [];
  //   for (int i = 0; i < listKamus.length; i++) {
  //     var item = listKamus[i];
  //     if (item!.kataIndonesia
  //         .toLowerCase()
  //         .contains(txtcari.text.toLowerCase())) {
  //       filterData.add(item!.kataIndonesia);
  //     }
  //   }
  //   return HasilSearch();
  // }

  Widget HasilSearch() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.purple.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ListView.builder(
            itemCount: filterData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    // Datum? data = listKamus.firstWhere(
                    //   (element) => element?.kataIndonesia == filterData[index],
                    // );
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PageDetail(data)));
                  },
                  child: ListTile(
                    minLeadingWidth: 15,
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade200,
                      child: Icon(
                        Icons.person,
                        size: 25,
                      ),
                    ),
                    title: Text("nama1"),
                    subtitle: Text("nama2"),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
