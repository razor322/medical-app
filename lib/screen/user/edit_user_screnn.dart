// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/const.dart';
import 'package:medical_app/model/user/model_edit_user.dart';
import 'package:medical_app/screen/user/profil_screen.dart';
import 'package:medical_app/utils/cek_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  String? id, username;
  TextEditingController txtusername = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isLoading = false;
  Future getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      id = pref.getString("id") ?? '';
      username = pref.getString("username") ?? '';
      print("id $id");
      print("id $username");
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getSession();
    initializeData();

    // txtusername = TextEditingController(text: username ?? "kosong");

    print(id);
    print(username);
  }

  Future<void> initializeData() async {
    await getSession(); // tunggu sampai getSession selesai
    txtusername = TextEditingController(text: username ?? "kosong");
    print(id);
    print(username);
  }

  Future<void> editUser() async {
    try {
      setState(() {
        isLoading = true;
        print("id edit $id");
        print("username edit $username");
      });

      // Memastikan variabel id dan username sudah diinisialisasi
      if (id != null && username != null) {
        // await initializeData(); // tunggu hingga nilai-nilai diinisialisasi
        username = txtusername.text;
        http.Response res = await http.post(Uri.parse('$url/updateUser.php'),
            body: {"id": id, "username": username});
        ModelEditUser data = modelEditUserFromJson(res.body);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ProfilScreen()),
            (route) => false);
        if (data.value != null && data.value == 1) {
          setState(() {
            isLoading = false;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${data.message}')));
            print("data");
            print("id edit2 $id");
            print("username2 edit $username");
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ProfilScreen()),
              (route) => false);
        } else {
          setState(() {
            isLoading = false;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${data.message}')));
          });
        }
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("ID atau username belum diinisialisasi")));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(e.toString())));
        print(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            key: keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(username ?? ''),
                Text(id ?? ''),
                TextFormField(
                  controller: txtusername,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "username",
                      hintText: "username",
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
                      setState(() {
                        editUser();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilScreen()),
                            (route) => false);
                      });
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
