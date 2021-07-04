import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.85;
}
class AboutUsScreen extends StatelessWidget {
  static const String id = 'AboutUsScreen';
  String Gettext = 'We collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read ourWe collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read ourWe collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read ourWe collect information on how and when you use our app. this allows us, and our trusted third parties, to personalize what you see, improve  your experience and  show ads that are relevant to you .for more information please  read our We collect information on how and when you use our app. this allows us, and our trustedthird parties, to personalize what you see, improve your experience and  show ads that are relevant to you .for more information please  read our'; //to get privacy text from firebase
  //to get condition text from firebase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Palette.scaffold,
      appBar:  AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
        backgroundColor: Palette.scaffold,
        elevation: 0,
        title: AutoSizeText(
          'About Us',
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
          style: TextStyle(
            color: Palette.orange,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        leading:  Container(
          height: MediaQuery.of(context).size.height* 0.05,
          width:  MediaQuery.of(context).size.width* 0.15,
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
      ) ,
      body: MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              height: allHeight(context)*0.76,
              width: allWidth(context)*0.75,
              child: SingleChildScrollView(
                child: AutoSizeText(
                  Gettext,
                  textAlign: TextAlign.justify,
                  style: TextStyle(wordSpacing: 0.06,fontSize: 20),
                  overflow: TextOverflow.visible,
                ),
              ),
            ),

            SafeArea(child: Container(
                height: allHeight(context)*0.06,
                width: allWidth(context)*0.4,
                child: Image.asset('Images/ActHubOLogo.png',fit: BoxFit.contain,)), )
          ],
        ),
      ):SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                height: allHeight(context)*0.76,
                width: allWidth(context)*0.6,
                child: SingleChildScrollView(
                  child: AutoSizeText(
                    Gettext,
                    textAlign: TextAlign.justify,
                    style: TextStyle(wordSpacing: 0.06,fontSize: 20),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),

              SafeArea(child: Container(
                  height: allHeight(context)*0.06,
                  width: allWidth(context)*0.4,
                  child: Image.asset('Images/ActHubOLogo.png',fit: BoxFit.contain,)), )
            ],
          ),
        ),
      ),
    );
  }
}

