import 'dart:async';
import'package:flutter/material.dart';
import 'package:phase1/pages/HomePage.dart';
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
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage())));
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
