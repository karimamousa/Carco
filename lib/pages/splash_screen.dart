import 'dart:async';
import 'LoginSignup.dart';
import 'login.dart';
import'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:2 ),
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginSignup())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(color: Colors.white,
          child: Center(
              child: Image.asset('assets/images/car logo.jpeg',height:300.0,width:300.0,)),
        ));
  }
}
