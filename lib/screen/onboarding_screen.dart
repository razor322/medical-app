import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/screen/login_screen.dart';
import 'package:medical_app/screen/register_screen.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        headerBackgroundColor: Color.fromARGB(255, 0, 170, 146),
        controllerColor: Color.fromARGB(255, 0, 170, 146),
        finishButtonText: 'REGISTER',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Color.fromARGB(255, 0, 170, 146),
        ),
        onFinish: (){
          Navigator.of(context).push(MaterialPageRoute
              (builder: (context) => RegisterScreen()));
        },
        skipTextButton: Text('SKIP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute
            (builder: (_) => LoginScreen()
            ));
          }, child: Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        background: [
          Image.asset('images/hospital.jpg'),
          Image.asset('images/medical-staff.png'),
        ],
        pageBackgroundColor: Colors.white,
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Selamat datang di aplikasi kesehatan kami, di mana kesehatan Anda menjadi prioritas utama!'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Dengan fitur-fitur inovatif, kami siap membantu Anda meraih kesehatan optimal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
