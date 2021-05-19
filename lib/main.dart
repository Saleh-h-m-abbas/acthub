import 'package:acthub/Screens/EnableLocation.dart';
import 'package:acthub/Screens/PrivicyPolicy.dart';
import 'package:acthub/Screens/YourData.dart';
import 'package:flutter/material.dart';

import 'Screens/TermsAndConditions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YourData(),
    );
  }
}

