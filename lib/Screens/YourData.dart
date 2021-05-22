import 'package:acthub/Screens/PrivacyPolicy.dart';
import 'package:acthub/Screens/SignUpAsPage.dart';
import 'package:acthub/Screens/TermsAndConditions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class YourData extends StatefulWidget {
  static const String id = 'YourData';

  @override
  _YourDataState createState() => _YourDataState();
}

class _YourDataState extends State<YourData> {
  String Gettext = 'Data Text '; //to get Data Text from firebase
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Your Data, Your Choice ',
              style: TextStyle(
                  color: Color(0xffF9A559),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
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
          Column(
            children: [
              Container(
                width: 351,
                height: 46,
                child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Accept',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff566357),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpAsPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      // foreground
                    )),
              ),
            ],
          ),
          SafeArea(
            child: Container(
                height: 50,
                width: 130,
                child: Image.asset('Images/ActHubOLogo.png')),
          )
        ],
      ),
    );
  }
}
