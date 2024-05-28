
import "package:animated_splash_screen/animated_splash_screen.dart";
//import "package:carco/profile.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:phase1/pages/availablecar_screen.dart";
import 'navbar.dart';

class SplashScreen2 extends StatelessWidget{
  const SplashScreen2 ({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen (
      splash:
      Column(
        children: [
          Center(
            child: LottieBuilder.asset("assets/lottie/anim.json"),
          )

        ],
      ),
      nextScreen: const navbar(),
      splashIconSize:90,
      backgroundColor: Colors.white,
    );
  }
}

