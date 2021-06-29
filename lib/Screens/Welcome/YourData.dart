import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/Welcome/PrivacyPolicy.dart';
import 'package:acthub/Screens/Welcome/SignIn.dart';
import 'package:acthub/Screens/Welcome/TermsAndConditions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourData extends StatefulWidget {
  static const String id = 'YourData';

  @override
  _YourDataState createState() => _YourDataState();
}

class _YourDataState extends State<YourData> {
  String Gettext =
      'We collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve your experience and  show ads that are relevant to you .for more information please  read our '; //to get Data Text from firebase
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/YourData.png',
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.55,
            child: AutoSizeText(
              'Your Data, Your Choice',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Palette.lightOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.topCenter,
            child: new AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: Gettext,
                    style: new TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nTerms And Conditions',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsAndConditions()));
                      },
                  ),
                  TextSpan(
                    text: ' And ',
                    style: new TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'PrivacyPolicy',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicy()));
                      },
                  )
                ],
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.055,
            child: ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.height * 0.009,
                  ),
                  child: AutoSizeText('Accept',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 20,
                        color: Palette.actHubGreen,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                onPressed: () async {
                  final SharedPreferences prefs = await _prefs;
                  prefs.setBool("AcceptData", true);
                  Navigator.pushNamed(context, SignIn.id);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  // foreground
                )),
          ),
          SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset(
                  'Images/ActHubOLogo.png',
                  fit: BoxFit.contain,
                )),
          ),
        ],
      ),
    );
  }
}
