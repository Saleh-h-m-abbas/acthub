import 'package:flutter/material.dart';
class AboutUsScreen extends StatelessWidget {
  static const String id = 'AboutUsScreen';

  String Gettext =
      'this is about us text'; //to get condition text from firebase
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Text(
                    'About Us ',
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
          SafeArea(
            child: Container(
                height: 50,
                width: 130,
                child: Image.asset('Images/ActHubOLogo.png')),
          ) //contain ACTHUB text picture
        ],
      ),
    );
  }
}