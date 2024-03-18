import 'package:flutter/material.dart';
import 'package:medical_app/const.dart';
import 'package:medical_app/main.dart';
import 'package:medical_app/model/model_login.dart';
import 'package:medical_app/screen/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/utils/cek_session.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isLoading = false;

  Future<RegisterScreen?> loginAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
        Uri.parse("$url/login.php"),
        body: {
          "username": username.text,
          "password": password.text,
          "email": email.text,
        },
      );
      ModelLogin data = modelLoginFromJson(res.body);
      if (data.value == 1) {
        setState(() {
          session.saveSession(data.value ?? 0, data.id ?? "", data.username ?? "", data.email ?? "");

          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${data.message}")),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavigationPage()),
            (route) => false,
          );
        });
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${data.message}")),
          );
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: username,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "USERNAME",
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ), 
                ), SizedBox(height: 16),
                TextFormField(
                  controller: email,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "E-MAIL",
                    prefixIcon: Icon(Icons.mail, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ), 
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: password,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                  },
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "PASSWORD",
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 32),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            if (keyForm.currentState!.validate()) {
                              loginAccount();
                            }
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 1, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
              (route) => false,
            );
          },
          color: Colors.white,
          textColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Anda Belum Punya Akun? Silahkan Daftar",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
