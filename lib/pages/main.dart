import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:phase1/pages/welcome.dart';
import 'cardetails.dart';
import 'home.dart';
import 'faqs.dart';
import 'settings.dart';
import 'profile.dart';
import 'login.dart';
import 'loginmain.dart';
import 'splash_screen.dart';
import 'LoginSignup.dart';
import 'signup.dart';
import 'addcar.dart';
import 'welcome.dart';
import 'navbar.dart';
import 'availablecar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());



}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  final page = [home(),Profile(),HomePage2(),SettingPage()];
  int currentpage=0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser==null? SplashScreen():AvailableCarScreenn()
    );
  }
}
