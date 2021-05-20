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
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/HeaderLogoB.png',
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
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            child: Image.asset(
              'Images/ActHubG.png',

            ),
          ),


        ],
      ),
    );
  }
}
