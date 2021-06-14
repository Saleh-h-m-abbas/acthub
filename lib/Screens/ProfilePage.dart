import 'dart:math';

import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/ActLink.dart';
import 'package:acthub/Screens/EditProfileScreen.dart';
import 'package:acthub/Screens/LanguageScreen.dart';
import 'package:acthub/Screens/ManagementPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AboutUsScreen.dart';
import 'ContactUsPage.dart';
import 'PrivacyPolicy.dart';
import 'SignIn.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'ProfilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isGuest = false;
  bool isGuide=true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: MaterialApp(
        home: Scaffold(
            appBar:  AppBar(
              centerTitle: false,
              toolbarHeight: MediaQuery.of(context).size.height*0.1,
              elevation: 0,
              backgroundColor: Palette.scaffold,
              title: Container(
                width: MediaQuery.of(context).size.width*0.25,
                height: MediaQuery.of(context).size.height*0.05,
                child: AutoSizeText(
                  'Profile',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Palette.orange),
                  maxLines: 1,
                ),
              ),),
            backgroundColor: Palette.scaffold,
            body: isGuest ? guestUI(context) : isGuide?guideUI(context): loggedInUI(context)),
      ),
    );
  }

 loggedInUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  buttonCard(
                      context, "Rate this App", 'Images/star.png', ManagementPage.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                  buttonCard(context, "Language", 'Images/language.png',
                      LanguageScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                  buttonCard(context, "Contact Us", 'Images/contact.png',
                      ContactUsPage.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                ],
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.06),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 5,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                height: MediaQuery.of(context).size.height * 0.33,
                                width: MediaQuery.of(context).size.width * 0.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width*0.095,
                        child: Stack(
                          alignment:Alignment.bottomLeft,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width>500
                                        ?MediaQuery.of(context).size.width*0.1:
                                    MediaQuery.of(context).size.width*0.12),
                              ),
                              elevation: 10,
                              child: CircleAvatar(
                                 radius:    MediaQuery.of(context).size.width>500
                                     ?
                                 MediaQuery.of(context).size.width*0.1:
                                 MediaQuery.of(context).size.width*0.12,
                                backgroundImage: NetworkImage(
                                    'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width>500
                                  ?MediaQuery.of(context).size.width*0.05:MediaQuery.of(context).size.width*0.06,
                              width:  MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width*0.07:MediaQuery.of(context).size.width*0.09,
                              decoration: BoxDecoration(
                                  color: Palette.online,
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 2.0, color: Palette.white)),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.02,
                        top: MediaQuery.of(context).size.height * 0.12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02,),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.height * 0.04,
                                child: AutoSizeText.rich(TextSpan(
                                  children: [
                                    TextSpan(text:'Lara ',style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.orange), ),
                                    TextSpan(text:'Giovani',style: TextStyle(
                                        color: Palette.orange, fontSize: 16), )
                                  ]
                                ),
                                overflow: TextOverflow.visible,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02,),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: AutoSizeText(
                                  'Country :  Palestine \n'
                                      'City :         Ramallah\n'
                                      'Age :        25 years old \n',
                                  style: TextStyle(
                                    color: Palette.orange,
                                    fontSize: 20,
                                  ),
                                  maxLines: 6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  buttonCard(
                      context, "About Us", 'Images/act.png', AboutUsScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                ],
              ),
            ],
          ),
         horizontalButton(context,
           image_Path: 'Images/privacy_policy.png',
           width:MediaQuery.of(context).size.width * .92,
           height:MediaQuery.of(context).size.height * 0.1,
           text: 'Privacy Policy',route: PrivacyPolicy.id,gap:MediaQuery.of(context).size.width*0.18),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              horizontalButton(context,
                image_Path: 'Images/edit.png',
                width:MediaQuery.of(context).size.width * .46,
                height:MediaQuery.of(context).size.height * 0.1,
                text: 'Edit Profile',route:EditProfileScreen.id,gap:MediaQuery.of(context).size.width*0.1),
                  horizontalButton(context,
                  image_Path: 'Images/logout.png',
                  width:MediaQuery.of(context).size.width * .46,
                  height:MediaQuery.of(context).size.height * 0.1,
                  text: 'Logout',gap:MediaQuery.of(context).size.width*0.1),

            ],
          ),
        ],
      ),
    );
  }
Widget guideUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  buttonCard(
                      context, "Billing", 'Images/billing.png', ManagementPage.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                  buttonCard(context, "Language", 'Images/language.png',
                      LanguageScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                  buttonCard(context, "Contact Us", 'Images/contact.png',
                      ContactUsPage.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                ],
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.06),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 5,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                height: MediaQuery.of(context).size.height * 0.33,
                                width: MediaQuery.of(context).size.width * 0.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width*0.095,
                        child: Stack(
                          alignment:Alignment.bottomLeft,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width>500
                                        ?MediaQuery.of(context).size.width*0.1:
                                    MediaQuery.of(context).size.width*0.12),
                              ),
                              elevation: 10,
                              child: CircleAvatar(
                                radius:    MediaQuery.of(context).size.width>500
                                    ?
                                MediaQuery.of(context).size.width*0.1:
                                MediaQuery.of(context).size.width*0.12,
                                backgroundImage: NetworkImage(
                                    'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width>500
                                  ?MediaQuery.of(context).size.width*0.05:MediaQuery.of(context).size.width*0.06,
                              width:  MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width*0.07:MediaQuery.of(context).size.width*0.09,
                              decoration: BoxDecoration(
                                  color: Palette.online,
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 2.0, color: Palette.white)),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.02,
                        top: MediaQuery.of(context).size.height * 0.12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02,),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.height * 0.04,
                                child: AutoSizeText.rich(TextSpan(
                                    children: [
                                      TextSpan(text:'Lara ',style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.orange), ),
                                      TextSpan(text:'Giovani',style: TextStyle(
                                          color: Palette.orange, fontSize: 16), )
                                    ]
                                ),
                                  overflow: TextOverflow.visible,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02,),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: AutoSizeText(
                                  'Country :      Palestine \n'
                                      'City :             Ramallah\n'
                                      'Company :    Sky \n',
                                  style: TextStyle(
                                    color: Palette.orange,
                                    fontSize: 16,
                                  ),
                                  maxLines: 6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  buttonCard(
                      context, "About Us", 'Images/act.png', AboutUsScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              horizontalButton(context,
                  image_Path: 'Images/privacy_policy.png',
                  width:MediaQuery.of(context).size.width * .46,
                  height:MediaQuery.of(context).size.height * 0.1,
                  text: 'Privacy Policy',route:EditProfileScreen.id,gap:MediaQuery.of(context).size.width*0.1),
              horizontalButton(context,
                  image_Path: 'Images/link.png',
                  width:MediaQuery.of(context).size.width * .46,
                  height:MediaQuery.of(context).size.height * 0.1,
                  text: 'Act Link',gap:MediaQuery.of(context).size.width*0.1,
              route: ActLink.id),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              horizontalButton(context,
                  image_Path: 'Images/edit.png',
                  width:MediaQuery.of(context).size.width * .46,
                  height:MediaQuery.of(context).size.height * 0.1,
                  text: 'Edit Profile',route:EditProfileScreen.id,gap:MediaQuery.of(context).size.width*0.1),
              horizontalButton(context,
                  image_Path: 'Images/logout.png',
                  width:MediaQuery.of(context).size.width * .46,
                  height:MediaQuery.of(context).size.height * 0.1,
                  text: 'Logout',gap:MediaQuery.of(context).size.width*0.1),

            ],
          ),
        ],
      ),
    );
  }
  Widget guestUI(BuildContext context){
    return LayoutBuilder(

      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        height:MediaQuery.of(context).size.height*0.35,
                        width:MediaQuery.of(context).size.width*0.9,
                        decoration: const BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03
                                  , left:MediaQuery.of(context).size.width*0.06),
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.05,
                                width: MediaQuery.of(context).size.width*0.35,
                                child: AutoSizeText(
                                  'Welcome',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.orange),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06,
                                        left:MediaQuery.of(context).size.width*0.03,
                                        right:MediaQuery.of(context).size.width*0.03,
                                        bottom: MediaQuery.of(context).size.height*0.01),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.1,
                                      width: MediaQuery.of(context).size.width*0.6,
                                      child: AutoSizeText.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Sgined in first to mange your profile.\n',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.actHubGreen.withOpacity(0.33),
                                              ),

                                            ),

                                            TextSpan(
                                              text: "you haven't signed in yet. Please sign in to access full experience",
                                              style: TextStyle(
                                                fontSize: 16,

                                                color: Palette.actHubGreen.withOpacity(0.33),
                                              ),

                                            ),
                                          ]
                                        ),

                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.05,
                                      width: MediaQuery.of(context).size.width*0.7,
                                      child: ElevatedButton(
                                          onPressed: (){
                                            Navigator.pushNamed(context, SignIn.id);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.003),
                                            child: AutoSizeText('Signin',style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),),
                                          ),
                                        style:  ElevatedButton.styleFrom(
                                          primary: Palette.blue, // background
                                          // foreground
                                        ),
                                           ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: constraints.maxWidth*0.58,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(constraints.maxWidth*0.12,),
                      ),
                      child: CircleAvatar(
                        radius: constraints.maxWidth*0.12,
                        backgroundColor: Palette.white,
                        backgroundImage: AssetImage('Images/gusetProfilepic.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonCard(context, 'Contact us','Images/contact.png', ContactUsPage.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                  buttonCard(context, 'About Us', 'Images/act.png', AboutUsScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonCard(context, 'Privacy Policy','Images/privacy_policy.png', PrivacyPolicy.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                  buttonCard(context, 'Languge', 'Images/language.png', LanguageScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                ],
              ),
            ],
          ),
        );
      }
    );
  }




  buttonCard(
      BuildContext context,
      String text,
      String image_Path,
      String route,
      double height,
      double width) {
    return GestureDetector(
      child: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.0009),
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(17),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.16,
              ),
            ),
            Container(

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                         Image.asset(image_Path),
                    AutoSizeText(
                      '$text',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.actHubGrey,
                          fontSize:20),
                    ),
                  ],
                ),
              ),
              width: width,
              height: height,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
  horizontalButton( BuildContext context,
      {String text,
      String image_Path,
      String route,
      double height,
      double width, double gap}){
   return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.all(
            Radius.circular(17),
          ),
        ),
        width: width,
        height: height,
        child: Center(
          child: ListTile(
            leading:Image.asset(
              image_Path,
              height: 40,
            ) ,
            title: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Palette.actHubGrey,
                  fontSize: 20),

            ),
            horizontalTitleGap: gap,
            onTap: () {
              Navigator.pushNamed(context, route);
            },

          ),
        ),
      ),
    );
  }
}