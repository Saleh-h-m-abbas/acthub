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
  bool isGuest = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: MaterialApp(
        home: Scaffold(
            backgroundColor: Palette.scaffold,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Palette.orange),
                  ),
                ),
                isGuest ? guestUI(context) : loggedInUI(context),
              ],
            )),
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
                    context, "Likes", 'Images/Like.svg', ManagementPage.id),
                buttonCard(context, "Language", 'Images/language.svg',
                    LanguageScreen.id),
                buttonCard(context, "Contact Us", 'Images/contact.svg',
                    ContactUsPage.id),
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
                    context, "About Us", 'Images/act.png', AboutUsScreen.id),
              ],
            ),
          ],
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(0.5),
            child: Card(
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
                width: MediaQuery.of(context).size.width * .92,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    SvgPicture.asset(
                      'Images/privacy_policy.svg',
                      height: 35,
                      color: Palette.actHubYellow,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.actHubGrey,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, PrivacyPolicy.id);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(0.5),
                child: Card(
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
                    width: MediaQuery.of(context).size.width * .46,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'Images/edit.svg',
                          height: 35,
                          color: Palette.actHubYellow,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.actHubGrey,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, EditProfileScreen.id);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(0.5),
              child: Card(
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
                  width: MediaQuery.of(context).size.width * .46,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'Images/logout.svg',
                        height: 35,
                        color: Palette.actHubYellow,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.actHubGrey,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column guestUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.44,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.44,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
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
                          height: MediaQuery.of(context).size.height * 0.34,
                          width: MediaQuery.of(context).size.width * 0.95,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.54,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55.0),
                    ),
                    elevation: 10,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('Images/gusetProfilepic.png'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.06,
                  top: MediaQuery.of(context).size.height * 0.12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Palette.orange),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 35),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Sgined in first to manage your profile.',
                                style: TextStyle(
                                    color: Palette.actHubGrey.withOpacity(0.33),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                minFontSize: 12,
                                maxLines: 3,
                              ),
                              SizedBox(height: 10),
                              AutoSizeText(
                                'you haven\'t signed in yet. Please sign in to access full experience',
                                style: TextStyle(
                                    color: Palette.actHubGrey.withOpacity(0.33),
                                    fontSize: 15),
                                minFontSize: 12,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.045,
                  left: MediaQuery.of(context).size.width * 0.09,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.01,
                      top: MediaQuery.of(context).size.height * 0.39,
                    ),
                    child: SignInButtonBuilder(
                      text: 'Sign in ',
                      innerPadding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.27),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignIn.id);
                      },
                      backgroundColor: Palette.blue,
                      width: MediaQuery.of(context).size.width * 0.75,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonCard(context, "Contact Us", 'Images/contact.svg',
                      ContactUsPage.id),
                  buttonCard(
                      context, "About Us", 'Images/act.png', AboutUsScreen.id),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonCard(context, "Privacy Policy",
                      'Images/privacy_policy.svg', PrivacyPolicy.id),
                  buttonCard(context, "Language", 'Images/language.svg',
                      LanguageScreen.id),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  buttonCard(
      BuildContext context, String text, String image_Path, String route) {
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
                    text == 'About Us'
                        ? Image.asset('Images/act.png')
                        : SvgPicture.asset(
                            image_Path,
                            height: 35,
                            color: Palette.actHubYellow,
                          ),
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
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.16,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
