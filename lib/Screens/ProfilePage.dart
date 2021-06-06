import 'dart:math';

import 'package:acthub/Classes/Palette.dart';
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
              toolbarHeight: 60,
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
            body: isGuest ? guestUI(context) : loggedInUI(context)),
      ),
    );
  }

  Column loggedInUI(BuildContext context) {
    return Column(
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
                      height: MediaQuery.of(context).size.height * 0.40,
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
                      left: 35,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55.0),
                        ),
                        elevation: 10,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                              'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 90,
                        left: 43,
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                              color: Palette.online,
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 2.0, color: Palette.white)),
                        )),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            children: [
                              Text(
                                'Lara ',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.orange),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 15),
                                  Text('Giovani',
                                      style: TextStyle(
                                          color: Palette.orange, fontSize: 16)),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Country :      Palestine \n\n'
                                        'City :             Ramallah\n\n'
                                        'Age :             25 years old \n\n',
                                    style: TextStyle(
                                      color: Palette.orange,
                                      fontSize: 20,
                                    ),
                                    minFontSize: 12,
                                    maxLines: 6,
                                  ),
                                ],
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
    );
  }
  Widget guestUI(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
                          padding: const EdgeInsets.only(top:25.0, left: 25),
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
                                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.025,
                                  width: MediaQuery.of(context).size.width*0.58,
                                  child: AutoSizeText('Sgined in first to mange your profile.\n',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.actHubGreen.withOpacity(0.33),
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height*0.05,
                                width: MediaQuery.of(context).size.width*0.63,
                                child: AutoSizeText("you haven't signed in yet. Please sign in\n to access full experience",
                                  style:TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen.withOpacity(0.33),

                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: MediaQuery.of(context).size.width*0.7,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        Navigator.pushNamed(context, SignIn.id);
                                      },
                                      child: Text('Signin',style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),),
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

                left: MediaQuery.of(context).size.width*0.56,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Palette.white,
                    backgroundImage: AssetImage('Images/gusetProfilepic.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 8,top: 8,bottom: 8),
            child: Row(
              children: [
                buttonCard(context, 'Contact us','Images/contact.png', ContactUsPage.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                buttonCard(context, 'About Us', 'Images/act.png', AboutUsScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 8.0),
            child: Row(
              children: [
                buttonCard(context, 'Privacy Policy','Images/privacy_policy.png', PrivacyPolicy.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
                buttonCard(context, 'Languge', 'Images/language.png', LanguageScreen.id,MediaQuery.of(context).size.height * 0.16,MediaQuery.of(context).size.width * 0.45),
              ],
            ),
          ),
        ],
      ),
    );
  }



  buttonCard(
      BuildContext context, String text, String image_Path, String route,double height, double width) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Stack(
          children: [
            Card(
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
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.16,
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                         Image.asset(image_Path),
                    SizedBox(height: 15),
                    Text(
                      '$text',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.actHubGrey,
                          fontSize: 20),
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
      double width,double gap}){
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