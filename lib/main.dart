import 'package:acthub/Screens/EnableLocation.dart';
import 'package:acthub/Screens/LandingPage.dart';
import 'package:acthub/Screens/PrivacyPolicy.dart';
import 'package:acthub/Screens/TermsAndConditions.dart';
import 'package:acthub/Screens/YourData.dart';
import 'package:acthub/Screens/LogInPage.dart';
import 'package:acthub/Screens/SignUpAsPage.dart';
import 'package:acthub/Screens/SignUpFormPage.dart';
import 'package:flutter/material.dart';

import 'Screens/HomePage.dart';
import 'Screens/NavigationPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationPage.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        EnableLocation.id: (context) => EnableLocation(),
        PrivacyPolicy.id: (context) => PrivacyPolicy(),
        TermsAndConditions.id: (context) => TermsAndConditions(),
        YourData.id: (context) => YourData(),
        LogInPage.id:(context)=>LogInPage(),
        SignUpAsPage.id:(context)=>SignUpAsPage(),
        SignUpFormPage.id:(context)=>SignUpFormPage(),
        HomePage.id:(context)=>HomePage(),
        NavigationPage.id:(context)=>NavigationPage()

      },
    );
  }
}
