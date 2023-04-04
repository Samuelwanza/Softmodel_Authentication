import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:softmodel/home/screens/homescreen.dart';
import 'package:softmodel/onboarding/screens/onboardingscreen.dart';
import 'package:softmodel/onboarding/widgets/onboardingbody.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../firebase_options.dart';
import '../widgets/animatedlogo.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class AnimatedSplash extends StatelessWidget {
  final int duration, bgcolor;
  final double iconsize;
  const AnimatedSplash(
      {super.key,
      required this.iconsize,
      required this.duration,
      required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
            child: AnimatedLogo(
                duration: 2,
                height: 125,
                width: 125,
                padding: 8.0,
                curveType: Curves.decelerate,
                imageWidget:
                    r'lib\splashscreen\assets\images\Logobluevert.png')),
        splashIconSize: iconsize,
        duration: duration,
        backgroundColor: Color(bgcolor),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: FutureBuilder(future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState){
                case ConnectionState.done:
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null){
                    return const HomeScreen();
                  }
                  else{
                    return const OnBoardingScreen();
                  }
                default:
                  return const AnimatedSplash(
                    bgcolor: 0xfffbc108,
                    duration: 3000,
                    iconsize: 150,
                  );
              }
            },
            ),
      ),
    );
  }
}
