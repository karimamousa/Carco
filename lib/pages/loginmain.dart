import 'splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class loginmain extends StatelessWidget {
  const loginmain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rent',
      home: SplashScreen(),
    );
  }
}
