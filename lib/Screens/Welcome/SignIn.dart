import 'dart:async';

import 'package:acthub/Api/translation_widget.dart';
import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/NavigationPage.dart';
import 'package:acthub/Screens/Welcome/LogInPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  static const String id = 'SignIn';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  @override
  void initState() {
    Timer(Duration(seconds: 0), () => {});
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: ListView(children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'Images/HeaderLogo1.png',
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              child: Image.asset(
                'Images/finalLogoo.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                child: TranslationWidget(
                  message: "Login for full enjoyable experience.",
                  builder: (translatedMessage) => AutoSizeText(
                    translatedMessage,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 25,
                      color: const Color(0xff4d4f5c),
                      //fontWeight: FontWeight.w900,
                    ),
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: GestureDetector(
                  onTap: () {
                    _showButtonPressDialog(context, 'Google');
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 370.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child:
                        TranslationWidget(
                          message: "Sign in with Google",
                          builder: (translatedMessage) => AutoSizeText(
                            translatedMessage,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 16,
                              color: Colors.black,
                              //fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                      ),
                      Positioned(
                        left: 16.0,
                        child: Image.asset("Images/google.png",
                            width: 20, height: 20),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: GestureDetector(
                onTap: () {
                  _showButtonPressDialog(context, 'Apple');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 370.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, 3.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child:   TranslationWidget(
                        message: "Sign in with Apple",
                        builder: (translatedMessage) =>  Text(
                          translatedMessage,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),)
                    ),
                    Positioned(
                      left: 16.0,
                      child: Image.asset("Images/apple.png",
                          width: 18, height: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 370.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff3C79E6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child:   TranslationWidget(
                          message: "Sign in with Facebook",
                          builder: (translatedMessage) =>  Text(
                            translatedMessage,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),)
                      ),
                      Positioned(
                        left: 16.0,
                        child: Image.asset("Images/facebook.png",
                            width: 20, height: 20),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 370.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFF1DA1F2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child:    TranslationWidget(
                          message: "Sign in with Twitter",
                          builder: (translatedMessage) => Text(
                            translatedMessage,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),)
                      ),
                      Positioned(
                        left: 16.0,
                        child: Image.asset("Images/Twitter.png",
                            width: 20, height: 20),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 368.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xff475EEE),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, 3.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child:    TranslationWidget(
                        message: "SignIn",
                        builder: (translatedMessage) => Text(
                          translatedMessage,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),)
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Divider(
                        color: Palette.actHubGreen,
                        thickness: 1,
                      )),

                  TranslationWidget(
                    message: "Or",
                    builder: (translatedMessage) => AutoSizeText(
                      translatedMessage,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 16.0,
                      color: Palette.actHubGreen,
                    ),
                  ),),

                  Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Divider(
                        color: Palette.actHubGreen,
                        thickness: 1,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs = await _prefs;
                    prefs.setBool("Guest", true);
                    SetStringSharedPreferance("4");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationPage()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 370.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff566357).withOpacity(0.42),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child:   TranslationWidget(
                          message: "Join us as a Guest",
                          builder: (translatedMessage) =>  Text(
                            translatedMessage,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),)
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
          ],
        ),
      ]),
    );
  }

  Future<void> SetStringSharedPreferance(String Type) {
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        prefs.setString("UserType", Type);
      })();
    });
  }
}
