import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  String Gettext='this is conditons text'; //to get condition text from firebase
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),//contain Terms and condition picture
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Terms and Conditions ',
                style: TextStyle(
                    color: Color(0xffF9A559),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ), //contain Terms and Condition text
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(Gettext,
                      style: TextStyle(
                        fontSize: 13,
                      )),
                ),// contain text widget to get terms and condition text from firebase
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                    height: 50,
                    width: 130,
                    child: Image.asset('assets/ActHubPic.png')))//contain ACTHUB text picture
          ],
        ),
      ),
    );
  }
}
