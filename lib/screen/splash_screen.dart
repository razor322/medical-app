import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  //   Future.delayed(Duration(seconds: 2), () {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DashBoard()
  //     ));
  //   });
  // }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}