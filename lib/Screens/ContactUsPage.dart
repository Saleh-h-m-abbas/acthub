import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SignIn.dart';

class ContactUsPage extends StatefulWidget {
  static const String id = 'ContactUsPage';

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: AutoSizeText(
                    'Contact Us ',
                    style: TextStyle(
                        color: Color(0xffF9A559),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  width: MediaQuery.of(context).size.width*0.29,
                  height: MediaQuery.of(context).size.height*0.032,
                ),
                cardDesign('Images/messenger.png', 'ActHub'),
                cardDesign('Images/IconInstagram.png', 'ActHub'),
                cardDesign('Images/IconGmail.png', 'ActHub@gmaile.com'),
                cardDesign('Images/IconWhatsApp.png','+970599845646' ),
                cardDesign('Images/call.png','+970599845646'),
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
Widget cardDesign(String imgURL, String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: ListTile(
          leading:Image.asset(
            imgURL,
            height: 30,
          ) ,
          title: Container(
              height: MediaQuery.of(context).size.height*0.03,
              child: AutoSizeText(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                maxLines: 1,
              )
          ),
          horizontalTitleGap: MediaQuery.of(context).size.width*0.18
          ,),
      ),
    );
}
}