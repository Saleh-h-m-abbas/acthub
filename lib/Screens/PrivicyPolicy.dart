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
  String Gettext='this is privacy text';
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
                'assets/Group 4750.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Our Privacy policy ',
                style: TextStyle(
                    color: Color(0xffF9A559),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                    height: 50,
                    width: 130,
                    child: Image.asset('assets/ActHubPic.png')))
          ],
        ),
      ),
    );
  }
}
