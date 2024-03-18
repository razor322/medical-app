import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/const.dart';
import 'package:medical_app/model/pegawai/model_create_pegawai.dart';
import 'package:medical_app/screen/pegawai/pegawai_screen.dart';

class PegawaiCreateScreen extends StatefulWidget {
  const PegawaiCreateScreen({super.key});

  @override
  State<PegawaiCreateScreen> createState() => _PegawaiCreateScreenState();
}

class _PegawaiCreateScreenState extends State<PegawaiCreateScreen> {
  TextEditingController nama = TextEditingController();
  TextEditingController noBP = TextEditingController();
  TextEditingController noHP = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isLoading = false;

// <modelTambahPegawai>
  Future<ModelAddPegawai?> tambahPegawai() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res =
          await http.post(Uri.parse('$url/create_pegawai.php'), body: {
        "nama": nama.text,
        "no_bp": noBP.text,
        "no_hp": noHP.text,
        "email": email.text,
      });
      ModelAddPegawai data = modelAddPegawaiFromJson(res.body);

      if (data.value == 1 && data.value != null) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PegawaiScreen()),
            (route) => false);
      } else if (data.value == 2 && data.value != null) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
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
    tambahPegawai();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Pegawai",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Form(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nama,
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
                  controller: email,
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
                  controller: noBP,
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
                  controller: noHP,
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
                      tambahPegawai();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("silahkan isi data terlebih dahulu")));
                    }
                  },
                  color: Colors.blue,
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
