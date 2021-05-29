import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SignIn.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'ProfilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              children: [guestUI(context)],
            )),
      ),
    );
  }

  Column guestUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                      backgroundImage: NetworkImage(
                          'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
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
                  subCategoryCard(context, "Contact Us", 'Images/contact.svg'),
                  subCategoryCard(context, "About Us", 'Images/act.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  subCategoryCard(
                      context, "Privacy Policy", 'Images/privacy_policy.svg'),
                  subCategoryCard(context, "Language", 'Images/language.svg'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Padding subCategoryCard(
      BuildContext context, String text, String image_Path) {
    return Padding(
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
    );
  }
}
