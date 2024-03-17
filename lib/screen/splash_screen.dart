import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
with SingleTickerProviderStateMixin{
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OnBoarding()));
    },);
  }

  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 170, 146), Color.fromARGB(255, 25, 241, 201)], 
            begin: Alignment.topRight,
            end: Alignment.bottomLeft, 
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/pharmacy.png",
              height: 100,
              ),
            SizedBox(height: 20),
            // Text(
            //   "Medical App", 
            //   style: TextStyle(
            //     fontStyle: FontStyle.normal,
            //     fontWeight: FontWeight.bold, 
            //     color: Colors.green, 
            //     fontSize: 32
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}