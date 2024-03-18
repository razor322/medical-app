import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  int? value;
  String? idUser, username; 

  Future<void> saveSession(int val, String id, String username, String email) async { 
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("value", val); 
    pref.setString("id", id);
    pref.setString("username", username);
    pref.setString("email", email);
  }

  Future getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    pref.getInt("value"); 
    pref.getString("id"); 
    pref.getString("username");
    pref.getString("email");
    return value;
  }

  Future clearSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    pref.clear();
  }
}

SessionManager session = SessionManager();