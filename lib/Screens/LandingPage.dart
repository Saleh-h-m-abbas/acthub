import 'dart:async';

import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/EnableLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  static const String id = 'LandingPage';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => EnableLocation())));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Palette.white,
          body: SafeArea(
              child: Stack(
            children: [
              Image.asset('Images/LandingPage3.png'),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:90.0),
                    child: Image.asset('Images/LandingPage2.png'),
                  ),
                  Image.asset('Images/LandingPage1.png'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:300.0),
                child: Hero(
                  tag: 'logo',
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      child: Image.asset('Images/Logo.png'),
                    ),
                  ),
                ),
              ),

            ],
          )),
        ));
  }
}
