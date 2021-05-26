import 'package:acthub/Screens/EnableLocation.dart';
import 'package:acthub/Screens/HomePage.dart';
import 'package:acthub/Screens/LandingPage.dart';
import 'package:acthub/Screens/LogInPage.dart';
import 'package:acthub/Screens/ManagementPage.dart';
import 'package:acthub/Screens/MapPage.dart';
import 'package:acthub/Screens/NavigationPage.dart';
import 'package:acthub/Screens/PrivacyPolicy.dart';
import 'package:acthub/Screens/SearchPage.dart';
import 'package:acthub/Screens/SignIn.dart';
import 'package:acthub/Screens/SignUpAsPage.dart';
import 'package:acthub/Screens/SignUpFormPage.dart';
import 'package:acthub/Screens/TermsAndConditions.dart';
import 'package:acthub/Screens/YourData.dart';
import 'package:flutter/material.dart';
import 'package:acthub/Screens/SubCategoryPage.dart';

import 'Screens/ActivityPage.dart';

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
        SignUpAsPage.id: (context) => SignUpAsPage(),
        SignUpFormPage.id: (context) => SignUpFormPage(),
        LogInPage.id: (context) => LogInPage(),
        SignIn.id: (context) => SignIn(),
        HomePage.id: (context) => HomePage(),
        NavigationPage.id: (context) => NavigationPage(),
        MapPage.id: (context) => MapPage(),
        ManagementPage.id: (context) => ManagementPage(),
        SearchPage.id: (context) => SearchPage(),
        SubCategoryPage.id:(context)=>SubCategoryPage(),
        ActivityPage.id:(context)=>ActivityPage()
      },
    );
  }
}
