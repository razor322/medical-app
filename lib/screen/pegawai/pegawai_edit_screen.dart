// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/const.dart';
import 'package:medical_app/model/pegawai/model_pegawai.dart';
import 'package:medical_app/model/pegawai/model_update_pegawai.dart';
import 'package:medical_app/screen/pegawai/pegawai_screen.dart';

class PegawaiEditScreen extends StatefulWidget {
  final Datum? data;
  PegawaiEditScreen(this.data, {super.key});

  @override
  State<PegawaiEditScreen> createState() => _PegawaiEditScreenState();
}

class _PegawaiEditScreenState extends State<PegawaiEditScreen> {
  TextEditingController upnama = TextEditingController();
  TextEditingController upemail = TextEditingController();
  TextEditingController upnoHP = TextEditingController();
  TextEditingController upnoBP = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isLoading = false;
  String? id;
  Future<ModelUpdatePegawai?> editPegawai() async {
    try {
      setState(() {
        isLoading = true;
        print(id);
      });
      http.Response res =
          await http.post(Uri.parse('$url/update_pegawai.php'), body: {
        "id": id,
        "nama": upnama.text,
        "no_bp": upnoBP.text,
        "no_hp": upnoHP.text,
        "email": upemail.text
      });

      // Pastikan respons adalah JSON yang valid sebelum mengurai
      var jsonResponse = json.decode(res.body);
      ModelUpdatePegawai data = ModelUpdatePegawai.fromJson(jsonResponse);

      if (data.value == 1) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PegawaiScreen()),
            (route) => false);
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
        print(e.toString());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.data?.id;
    upnama = TextEditingController(text: widget.data?.nama);
    upemail = TextEditingController(text: widget.data?.email);
    upnoBP = TextEditingController(text: widget.data?.noBp);
    upnoHP = TextEditingController(text: widget.data?.noHp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data Pegawai"),
        backgroundColor: Colors.purple.shade200,
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: upnama,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "Nama",
                      hintText: "Nama",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue.shade300),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: upemail,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue.shade300),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: upnoBP,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "NIM",
                      hintText: "NIM",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue.shade300),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: upnoHP,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "No Hp",
                      hintText: "No Hp",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue.shade300),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    if (keyForm.currentState?.validate() == true) {
                      editPegawai();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("silahkan isi data terlebih dahulu")));
                    }
                  },
                  color: Colors.purple.shade400,
                  textColor: Colors.white,
                  height: 45,
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
