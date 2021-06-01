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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:20),
                  Center(
                    child: Text(
                      'Contact Us ',
                      style: TextStyle(
                          color: Color(0xffF9A559),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height:40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: ListTile(leading:Image.asset('Images/messenger.png',height: 35,) ,title: Text('ActHub',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),horizontalTitleGap: 100,),),
                  ),
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                        child: ListTile(leading:Image.asset('Images/IconInstagram.png',height: 40,) ,title: Text('ActHub',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),horizontalTitleGap: 100,),),
                  ),
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: ListTile(leading:Image.asset('Images/IconGmail.png',height: 35,) ,title: Text('ActHub@gmail.com',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),horizontalTitleGap: 50,),),
                  ),
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: ListTile(leading:Image.asset('Images/IconWhatsApp.png',height: 40,) ,title: Text('+970599845646',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),horizontalTitleGap: 65,),),
                  ),
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: ListTile(leading:Image.asset('Images/call.png',height: 30,) ,title: Text('0599845646',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),horizontalTitleGap: 75,),),
                  ),



                ],
              ),
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
