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
          ),
          //contain privacy picture

          //contain our privacy policy text
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Our Privacy policy ',
                    style: TextStyle(
                        color: Color(0xffF9A559),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(Gettext,
                      style: TextStyle(
                        fontSize: 13,
                      )),
                ),
              ],
            ),
          ),
          // contain text widget to get privacy policy text from firebase
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
