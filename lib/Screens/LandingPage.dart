import 'dart:async';

import 'package:acthub/Screens/NavigationPage.dart';
import 'package:acthub/Screens/Welcome/EnableLocation.dart';
import 'package:acthub/Screens/Welcome/SignIn.dart';
import 'package:acthub/Screens/Welcome/YourData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  static const String id = 'LandingPage';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String routePage = EnableLocation.id;
  landingPageMethod() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool('NotFirstTime') != null &&
        prefs.getBool('NotFirstTime') &&
        prefs.getBool('EnableLocation') != null &&
        prefs.getBool('EnableLocation')) {
      routePage = YourData.id;
    }
    if (prefs.getBool('AcceptData') != null && prefs.getBool('AcceptData')) {
      routePage = SignIn.id;
    }
    if (prefs.getBool('Guest') != null && prefs.getBool('Guest')) {
      routePage = NavigationPage.id;
    }
    Timer(Duration(seconds: 1), () => Navigator.pushNamed(context, routePage));
  }

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    landingPageMethod();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Color(0xFF566357),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Image.asset('Images/Logo.png')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Image.asset('Images/203.png', fit: BoxFit.fitWidth),
                        // Image.asset('Images/LandingPage1.png',
                        //     fit: BoxFit.fitWidth),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
