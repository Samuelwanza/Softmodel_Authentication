import 'package:flutter/material.dart';
import 'package:softmodel/home/screens/accountscreen.dart';
import 'package:softmodel/home/screens/homescreen.dart';
import 'package:softmodel/home/screens/settingscreen.dart';
import 'package:softmodel/onboarding/screens/onboardingscreen.dart';
import 'package:softmodel/regestration/screens/loginscreen.dart';
import 'package:softmodel/regestration/screens/regestrationscreen.dart';
import 'package:softmodel/regestration/screens/signupscreen.dart';
import 'modelselection/screens/buttonsquestion.dart';
import 'modelselection/screens/dropdownscreen.dart';
import 'modelselection/screens/openendscreen.dart';
import 'modelselection/screens/ratingscreen.dart';
import 'modelselection/screens/welcomescreen.dart';
import 'splashscreen/screens/animatedsplashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    routes: {'/home': (context) => const HomeScreen(),
              '/board': (context) => const OnBoardingScreen(),
              '/reg': (context) => const Regestration(),
              '/up': (context) => const SignupScreen(),
              '/log': (context) => const LoginScreen(),
              'acc':(context) => const AccountScreen(),
              'sett':(context) => const SettingsScreen(),
              'welcome':(context) => const ModelSelectionHomePage(),},
    title: 'Flutter Demo',
    home: const AnimatedSplash(
      bgcolor: 0xfffbc108,
      duration: 3000,
      iconsize: 150,
    ),
    // home: const HomeScreen(),
    // home: const QuestionnairePage4(),
    // home: const QuestionPage(question: "sakjlkj"),
  ));
}


