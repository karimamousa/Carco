import 'package:flutter/material.dart';
import 'availablecar_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatelessWidget {
  const home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 99, 124)),
        useMaterial3: true,
      ),
      home: AvailableCarScreenn(),
    );
  }
}