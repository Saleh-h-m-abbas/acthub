import 'dart:async';

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
          backgroundColor: Color(0xFF566357),
          body: SafeArea(
              child: Column(
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: MediaQuery.of(context).size.height * .7,
                    child: Image.asset('Images/Logo.png'),
                  ),
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('Images/LandingPage1.png')),
                        Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('Images/LandingPage2.png')),
                      ],
                    ),
                    Container(
                        width: 200,
                        height: 200,
                        child: Image.asset('Images/LandingPage3.png')),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
