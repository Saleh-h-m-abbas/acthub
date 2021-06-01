import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/PrivacyPolicy.dart';
import 'package:acthub/Screens/SignIn.dart';
import 'package:acthub/Screens/TermsAndConditions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourData extends StatefulWidget {
  static const String id = 'YourData';

  @override
  _YourDataState createState() => _YourDataState();
}

class _YourDataState extends State<YourData> {
  String Gettext = 'Data Text '; //to get Data Text from firebase
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
                fit: BoxFit.scaleDown,
              ),
              SafeArea(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  //onPressed:() => Navigator.pop(context, false),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ), // Back Arrow & Image

          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              'Your Data, Your Choice ',
              style: TextStyle(
                  color: Palette.lightOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ), // Your Data Your Choice Text
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
          ), // Terms and conditions ""LINKS"
          Container(

            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.065,
            child: ElevatedButton(
                child: Text('Accept',
                    style: TextStyle(
                      fontSize: 18,
                      color: Palette.actHubGreen,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () async {
                  final SharedPreferences prefs = await _prefs;
                  prefs.setBool("AcceptData", true);
                  Navigator.pushNamed(context, SignIn.id);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  // foreground
                )),
          ), //Accept Button
          Container(
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width*0.5,
              child: Image.asset('Images/ActHubOLogo.png'))  //ActHub Image
        ],
      ),
    );
  }
}
