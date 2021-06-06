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
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/HeaderLogoA.png',
                fit: BoxFit.fitWidth
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
          ), //Stack to Put back arrow with image
          //contain privacy picture
          //contain our privacy policy text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15,
                vertical: MediaQuery.of(context).size.height*0.02),
            child: Expanded(
              child: Container(
                child: AutoSizeText(
                  'Our Privacy Policy ',
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.0125,
                  horizontal: MediaQuery.of(context).size.width*0.05  ),

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
          ),//Contain Column for two texts, expanded for actHub image
          // contain text widget to get privacy policy text from firebase
          Container(
              height: MediaQuery.of(context).size.height*0.09,
              width: MediaQuery.of(context).size.width*0.55,
              child: Image.asset('Images/ActHubOLogo.png')) //Acthub Image
        ],
      ),
    );
  }
}
