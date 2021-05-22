import 'package:acthub/Screens/EnableLocation.dart';
import 'package:acthub/Screens/LandingPage.dart';
import 'package:acthub/Screens/PrivacyPolicy.dart';
import 'package:acthub/Screens/TermsAndConditions.dart';
import 'package:acthub/Screens/YourData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LandingPage.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        EnableLocation.id: (context) => EnableLocation(),
        PrivacyPolicy.id: (context) => PrivacyPolicy(),
        TermsAndConditions.id: (context) => TermsAndConditions(),
        YourData.id: (context) => YourData(),
      },
    );
  }
}
