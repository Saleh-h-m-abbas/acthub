import 'dart:async';
import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/NavigationPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignUpFormPage extends StatefulWidget {
  static const String id = 'SignUpFormPage';
  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String UserType;

  getStringSharedPreferance(){
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        prefs.getString("UserType");
        UserType = prefs.getString("UserType");
        print(UserType);
      })();
    });
  }


  void initState() {
    Timer(
        Duration(seconds: 0), () => {getStringSharedPreferance()});
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    bool isUser = false; // make it true to show the user form
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/HeaderLogoB.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.26,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.07,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ],
          ),


          (UserType == "1" ||UserType == "2")?advertiserSPInfo(context):(UserType == "3")?userForm(context):Text("yuyu"),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationPage()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.02),
              ),
              elevation: 10,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.73,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    color: Palette.actHubGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(MediaQuery.of(context).size.width * 0.02),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.009),
                      child: AutoSizeText(isUser ? 'Sign Up' : 'Next',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.056,
                              fontWeight: FontWeight.bold,
                              color: Palette.white)),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.asset(
                'Images/ActHubG.png',
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }


  userForm(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.47,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  hintText: 'What do people call you?',
                                  labelText: 'FULL NAME ',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  hintText: 'What do people call you?',
                                  labelText: 'EMAIL ',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  hintText: 'What do people call you?',
                                  labelText: 'PASSWORD ',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  hintText: 'What do people call you?',
                                  labelText: 'BIRTHDAY ',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  hintText: 'What do people call you?',
                                  labelText: 'COUNTRY ',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  hintText: 'What do people call you?',
                                  labelText: 'STATE ',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.08,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.05,
            child: AutoSizeText(
              'User',
              style: TextStyle(
                  color: Palette.actHubGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.065),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.46),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.02),
            ),
            elevation: 10,
            child: GFImageOverlay(
              image: AssetImage('Images/user.png'),
              width: MediaQuery.of(context).size.width * 0.77,
              height: MediaQuery.of(context).size.height * 0.08,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.02),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(
                    child: AutoSizeText(
                      "user",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.065,
                          fontWeight: FontWeight.bold,
                          color: Palette.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  advertiserSPInfo(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.47,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'COMPANY NAME ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'EMAIL ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'PASSWORD ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'BIRTHDAY ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'COUNTRY ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'STATE ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.08,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.05,
            child: AutoSizeText(
              'Company Information',
              style: TextStyle(
                  color: Palette.actHubGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.065),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.46),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.02),
            ),
            elevation: 10,
            child: GFImageOverlay(
              image: (UserType == "1")?AssetImage('Images/serviceProvider.png'):(UserType == "2")?AssetImage('Images/advertiser.png'):AssetImage('Images/advertiser.png'),
              width: MediaQuery.of(context).size.width * 0.77,
              height: MediaQuery.of(context).size.height * 0.08,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.02),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(
                    child: AutoSizeText(
                      "Service Provider",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.065,
                          fontWeight: FontWeight.bold,
                          color: Palette.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  paymentInfo(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.47,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'CREDIT NUMBER ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'NAME ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'CVV ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'DATE ',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.08,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.05,
            child: AutoSizeText(
              'Payment Information',
              style: TextStyle(
                  color: Palette.actHubGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.065),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.46),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.02),
            ),
            elevation: 10,
            child: GFImageOverlay(
              image: AssetImage('Images/user.png'),
              width: MediaQuery.of(context).size.width * 0.77,
              height: MediaQuery.of(context).size.height * 0.08,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.02),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(
                    child: AutoSizeText(
                      "Service Provider",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.065,
                          fontWeight: FontWeight.bold,
                          color: Palette.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
