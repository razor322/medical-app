import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/screen/user/edit_user_screnn.dart';
import 'package:medical_app/screen/login_screen.dart';
import 'package:medical_app/utils/cek_session.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  String? id, username;

  @override
  void initState() {
    super.initState();
    getSession();
  }

  Future<void> getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      id = pref.getString("id");
      username = pref.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(
              16.0), // Tambahkan padding di sini jika diperlukan
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 170, 146),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profil User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'images/medical-staff.png'), // Ganti dengan gambar avatar pengguna
              ),
              SizedBox(height: 20),
              Text(
                'Nama Pengguna', //$username
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'kelompok7@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditUser()));
                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    session.clearSession();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade100,
                ),
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
