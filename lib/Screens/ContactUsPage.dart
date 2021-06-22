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
      appBar:AppBar(
        leading: Container(
          height: MediaQuery.of(context).size.width*0.05,
          width:MediaQuery.of(context).size.width*0.15,

          child: FittedBox(
            fit: BoxFit.fill,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,size: 15,color: Palette.actHubGreen,),
              onPressed: () => Navigator.pop(context),

            ),
          ),
        ),
        title: AutoSizeText(
          'Contact Us',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Palette.social),
          maxLines: 1,
        ),
        centerTitle:true ,

        backgroundColor: Palette.scaffold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.02),
              bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.02)
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
     elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
            //contain privacy picture
              Container(
                height:MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?MediaQuery.of(context).size.height*0.8:
                MediaQuery.of(context).size.height*0.7,
                child: SingleChildScrollView(
                  child: Column(  

                    mainAxisSize: MainAxisSize.min,
                    children: [

                      cardDesign('Images/messenger.png', 'ActHub'),
                      SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
                      cardDesign('Images/IconInstagram.png', 'ActHub'),
                      SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
                      cardDesign('Images/IconGmail.png', 'ActHub@gmaile.com'),
                      SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
                      cardDesign('Images/IconWhatsApp.png','+970599845646' ),
                      SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
                      cardDesign('Images/call.png','+970599845646'),
                    ],
                  ),
                ),
              ),
              // contain text widget to get privacy policy text from firebase
              Container(
                  height: MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
                  MediaQuery.of(context).size.height*0.06:MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Image.asset('Images/ActHubOLogo.png',fit: BoxFit.contain,)),
            ],
            
          ),
        ),
      ),
    );

}
Widget cardDesign(String imgURL, String text){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.03),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: ListTile(
          leading:Image.asset(
            imgURL,
            height: MediaQuery.of(context).size.height*0.04,
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
       horizontalTitleGap: MediaQuery.of(context).size.width*0.1
          ),
      ),
    );
}
}