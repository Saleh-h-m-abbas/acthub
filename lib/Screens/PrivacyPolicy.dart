import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PrivacyPolicy extends StatefulWidget {
  static const String id = 'PrivacyPolicy';

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String Gettext = 'We collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read ourWe collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read ourWe collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read ourWe collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read our We collect information on how and when you use our app. this allows us, and our trustedthird parties, to personalize what you see, improve your experience and  show ads that are relevant to you .for more information please  read our'; //to get privacy text from firebase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Palette.scaffold,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/HeaderLogoA.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.26,
              ),
              Image.asset(
                'Images/HeaderLogoA.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.26,
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
          Container(
            height: MediaQuery.of(context).size.height*0.05,
            width: MediaQuery.of(context).size.width*0.55,
            child: Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.015,
              ),
              child: Center(
                child: AutoSizeText(
                  'Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Palette.lightOrange,
                      fontWeight: FontWeight.bold,fontSize: 30),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.0125,
                horizontal: MediaQuery.of(context).size.width*0.05  ),

            child: AutoSizeText(
              Gettext,
              textAlign: TextAlign.center,
              style: TextStyle(wordSpacing: 0.1,fontSize: 20),
              overflow: TextOverflow.visible,
            ),

          ),//Contain Column for two texts, expanded for actHub image
          // contain text widget to get privacy policy text from firebase
          Container(
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width*0.4,
              child: Image.asset('Images/ActHubOLogo.png',fit: BoxFit.contain,)), //contain ACTHUB text picture
        ],
      ),
    );
  }
}
