import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class PrivicyPolicy extends StatefulWidget {
  const PrivicyPolicy({Key key}) : super(key: key);

  @override
  _PrivicyPolicyState createState() => _PrivicyPolicyState();
}

final Widget svg = SvgPicture.asset('assets/Group 4766.svg');

class _PrivicyPolicyState extends State<PrivicyPolicy> {
  String Gettext='this is privacy text'; //to get privacy text from firebase
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
            ),//contain privacy picture
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Our Privacy policy ',
                style: TextStyle(
                    color: Color(0xffF9A559),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),//contain our privacy policy text
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(Gettext,
                      style: TextStyle(
                        fontSize: 13,
                      )),
                ),
              ],
            ),// contain text widget to get privacy policy text from firebase
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
