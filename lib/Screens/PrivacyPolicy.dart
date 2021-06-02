import 'package:acthub/Classes/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PrivacyPolicy extends StatefulWidget {
  static const String id = 'PrivacyPolicy';

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String Gettext = 'this is privacy text'; //to get privacy text from firebase
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
                fit: BoxFit.fitWidth,
              ),
              SafeArea(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  //onPressed:() => Navigator.pop(context, false),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ), //Stack to Put back arrow with image
          //contain privacy picture

          //contain our privacy policy text
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:25.0),
                    child: Text(
                      'Our Privacy policy ',
                      style: TextStyle(
                          color: Palette.lightOrange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(Gettext,
                      style: TextStyle(
                        fontSize: 13,
                      )),
                ),
              ],
            ),
          ),//Contain Column for two texts, expanded for actHub image
          // contain text widget to get privacy policy text from firebase
          Container(
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width*0.5,
              child: Image.asset('Images/ActHubOLogo.png')) //Acthub Image
        ],
      ),
    );
  }
}
