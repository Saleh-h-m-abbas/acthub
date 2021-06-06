import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/PrivacyPolicy.dart';
import 'package:acthub/Screens/SignIn.dart';
import 'package:acthub/Screens/TermsAndConditions.dart';
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
  String Gettext = 'We collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve your experience and  show ads that are relevant to you .for more information please  read our'; //to get Data Text from firebase
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/YourData.png',
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top:MediaQuery.of(context).size.height*0.07,
                child: Container(
                  height: MediaQuery.of(context).size.width*0.1,
                  width:MediaQuery.of(context).size.width*0.1,

                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios,size: 30,),
                      onPressed: () => Navigator.pop(context),

                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15,
                vertical: MediaQuery.of(context).size.height*0.02),
            child: Expanded(
              child: Container(
                child: AutoSizeText(
                  'Your Data, Your Choice',
                  maxFontSize: 25,
                  minFontSize: 18,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Palette.lightOrange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.0125,
                horizontal: MediaQuery.of(context).size.width*0.1 ),
            child: SingleChildScrollView(
              child: AutoSizeText(
                Gettext,
                minFontSize: 18,
                maxFontSize: 25,
                textAlign: TextAlign.justify,
                style: TextStyle(wordSpacing: 0.1),
              ),
            ),
          ),
          Center(
            child: new RichText(
              text: new TextSpan(
                children: [
                  TextSpan(
                    text: 'Terms And Conditions',
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
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025,bottom: MediaQuery.of(context).size.height*0.05),
            child: Container(
              width: MediaQuery.of(context).size.width*0.75,
              height: MediaQuery.of(context).size.height*0.055,
              child: ElevatedButton(
                  child: Padding(
                    padding:  EdgeInsets.all(8),
                    child: Text('Accept',
                        style: TextStyle(
                          fontSize: 18,
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
          ),
          SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height*0.05,
                width: MediaQuery.of(context).size.width*0.3,
                child: Image.asset('Images/ActHubOLogo.png')),
          ),
        ],
      ),
    );
  }
}
