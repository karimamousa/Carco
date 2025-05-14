import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'cardetails.dart';
import 'home.dart';
import 'faqs.dart';
import 'settings.dart';
import 'profile.dart';
import 'loginmain.dart';
import 'splash_screen.dart';
import 'addcar.dart';
import 'welcome.dart';
import 'navbar.dart';
import 'availablecar_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isLoggedIn = false; // بدل FirebaseAuth.instance.currentUser

  @override
  void initState() {
    // تم حذف FirebaseAuth.authStateChanges()
    super.initState();
  }

  final page = [home(), Profile(), HomePage2(), SettingPage()];
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home() ,
    );
  }}
// }: SplashScreen()