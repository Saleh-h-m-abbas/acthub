import 'dart:io';
import 'package:acthub/Api/translation_widget.dart';
import 'package:acthub/Api/translations.dart';
import 'package:acthub/Design/Button.dart';
import 'package:acthub/Screens/Nested/Email_Password_Signin_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String defaultLocale;
  var fromLanguageCode;
  var toLanguageCode;

  @override
  void initState() {
    checkDeviceLanguage();
    super.initState();
  }

  checkDeviceLanguage() async {
    defaultLocale = Platform.localeName;
    print(defaultLocale);
    var arr = defaultLocale.split("_");
    String deviceLang = arr[0];
    print(deviceLang);
    fromLanguageCode = Translations.getLanguageFromCode(
        "en"); //todo: DEVICE LANGUGE language from code
    print(fromLanguageCode);
    toLanguageCode = Translations.getLanguageFromCode(
        "ar"); //todo: get language from code that will be convert to it by setting or by device origial language  also Shared Preferance
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            TranslationWidget(
              message: "مرحبا",
              fromLanguage: fromLanguageCode,
              toLanguage: toLanguageCode,
              builder: (translatedMessage) => Text(
                translatedMessage,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                    height: 50,
                    width: 130,
                    child: Image.asset('assets/acthublogo.png'))),
            SizedBox(
              height: 5,
            ),
            TranslationWidget(
              message: "Login for full enjoyable experience",
              fromLanguage: fromLanguageCode,
              toLanguage: toLanguageCode,
              builder: (translatedMessage) => Text(
                translatedMessage,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GoogleSignInButton(),
            SizedBox(
              height: 10,
            ),
            AppleSignInButton(),
            SizedBox(
              height: 10,
            ),
            FacebookSignInButton(),
            SizedBox(
              height: 10,
            ),
            TwitterSignInButton(),
            SizedBox(
              height: 10,
            ),
            SignIn(context),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 351.0,
              height: 21.0,
              child: Row(
                children: <Widget>[
                  Align(
                      alignment: Alignment(0.0, 0.3),
                      child: SvgPicture.asset("assets/Component 34 – 1.svg")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            anonymousSignInButton(),
          ],
        ),
      ),
    ));
  }

  Padding SignIn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: GestureDetector(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Email_Password_Signin_Page()),
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
              child: transMetod("SignIn"),
            ),
          ],
        ),
      ),
    );
  }

  Widget transMetod(message) {
   return TranslationWidget(
        message: message,
        fromLanguage: fromLanguageCode,
        toLanguage: toLanguageCode,
        builder: (translatedMessage) => Text(
              translatedMessage,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16.0,
                color: Colors.black,
              ),
            ));
  }
}
