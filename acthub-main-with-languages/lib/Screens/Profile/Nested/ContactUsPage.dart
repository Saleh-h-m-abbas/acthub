import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.85;
}

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
      appBar: AppBar(
        leading: Container(
          height: allHeight(context) * 0.08,
          width: allWidth(context) * 0.15,
          child: FittedBox(
            fit: BoxFit.fill,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Palette.actHubGreen,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: AutoSizeText(
          'Contact Us',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Palette.social),
          maxLines: 1,
        ),
        centerTitle: true,
        backgroundColor: Palette.scaffold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(allHeight(context) * 0.02),
              bottomRight:
                  Radius.circular(allHeight(context) * 0.02)),
        ),
        toolbarHeight: allHeight(context) * 0.1,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
              children: [
                Container(
                  height: allHeight(context)*0.75,
                  width: allWidth(context),
                  child: Column(
                    children: [
                      cardDesign('Images/messenger.png', 'ActHub'),
                      SizedBox(height: allHeight(context)*0.01,),
                      cardDesign('Images/IconInstagram.png', 'ActHub'),
                      SizedBox(height: allHeight(context)*0.01,),
                      cardDesign('Images/IconGmail.png', 'ActHub@gmaile.com'),
                      SizedBox(height: allHeight(context)*0.01,),
                      cardDesign('Images/IconWhatsApp.png', '+970599845646'),
                      SizedBox(height: allHeight(context)*0.01,),
                      cardDesign('Images/call.png', '+970599845646'),
                    ],
                  ),
                ),
                // contain text widget to get privacy policy text from firebase
                SafeArea(child: Container(
                    height: allHeight(context)*0.06,
                    width: allWidth(context)*0.4,
                    child: Image.asset('Images/ActHubOLogo.png',fit: BoxFit.contain,)), )
              ],
            ),


      ),
    );
  }

  Widget cardDesign(String imgURL, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: allWidth(context) * 0.03),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: ListTile(
            leading: Image.asset(
              imgURL,
              height: allHeight(context) * 0.03,
            ),
            title: Container(
                height: allHeight(context) * 0.03,
                child: AutoSizeText(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  maxLines: 1,
                )),
            horizontalTitleGap: allWidth(context) * 0.1),
      ),
    );
  }
}
