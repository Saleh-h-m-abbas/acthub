import 'dart:async';

import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/Profile/Nested/PackagesScreen.dart';
import 'package:acthub/Screens/Welcome/SignIn.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/cupertino.dart';

class AddActivity extends StatefulWidget {
  static const String id = 'AddActivity';
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String UserType;

  getStringSharedPreferance() {
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        prefs.getString("UserType");
        UserType =prefs.getString("UserType");
        print(UserType);
      })();
    });
  }
  void initState() {
    Timer(Duration(seconds: 0), () => {getStringSharedPreferance()});
    (() async {
      await getStringSharedPreferance();
      print(UserType);
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double allWidth = MediaQuery.of(context).size.width;
    double allHeight = MediaQuery.of(context).size.height;
    if (allWidth >= allHeight) {
      setState(() {
        allWidth = MediaQuery.of(context).size.height * 1.5;
        allHeight = MediaQuery.of(context).size.width;
      });
    }
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: allHeight * 0.05,
              child: AutoSizeText(
                'Add',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Palette.orange),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: allHeight * 0.04),
              child: Container(
                height: allHeight * 0.025,
                child: AutoSizeText(
                  'We are together',
                  style: TextStyle(
                    fontSize: 14,
                    color: Palette.actHubGreen.withOpacity(0.35),
                  ),
                ),
              ),
            )
          ],
        ),
        leading: Container(
          height: allWidth * 0.05,
          width: allWidth * 0.05,
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
        backgroundColor: Palette.scaffold,
        toolbarHeight: allHeight * 0.1,
      ),
      body:selectHome(),
    );
  }

  selectHome() {
    print(UserType);
    if (UserType == "1")
      return sPAdd(context);
    else if (UserType == "2")
      return adsAdd(context);
    else if (UserType == "3")
      return Alert(
          context: context,
          title: "",
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: allWidth(context) * 0.05,
                    top: allHeight(context) * 0.02),
                child: Container(
                  height: allHeight(context) * 0.05,
                  width: allWidth(context) * 0.3,
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
                    SizedBox(
                      height: allHeight(context) * 0.01,
                    ),
                    Container(
                      width: allWidth(context),
                      child: Container(
                        height: allHeight(context) * 0.05,
                        width: allWidth(context),
                        child: Center(
                          child: AutoSizeText(
                            'Signed in first to access this feature.',
                            //name of main category
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                              Palette.actHubGreen.withOpacity(0.35),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'Images/human.png',
                      height: allHeight(context) * 0.45,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: allHeight(context) * 0.01),
                      child: Container(
                        width: allWidth(context),
                        height: allHeight(context) * 0.059,
                        child: Center(
                          child: AutoSizeText(
                            "you haven't signed in yet. please sign in\n to manage your activity in application.",
                            style: TextStyle(
                              fontSize: 25,
                              color:
                              Palette.actHubGreen.withOpacity(0.50),
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: allHeight(context) * 0.05,
                          left: allWidth(context) * 0.01,
                          right: allWidth(context) * 0.01),
                      child: Container(
                        width: allWidth(context) * 0.766,
                        height: allHeight(context) * 0.054,
                        child: ElevatedButton(
                            child: AutoSizeText(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ), //to style the text of buttons
                            style: ElevatedButton.styleFrom(
                                primary: Palette.blue // background
                              // foreground
                            ), //to set the color of buttons
                            onPressed: () {
                              Navigator.pushNamed(context, SignIn.id);
                            }),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
          buttons: []).show();
    else if (UserType == "4")
      return Alert(
          context: context,
          title: "",
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: allWidth(context) * 0.05,
                    top: allHeight(context) * 0.02),
                child: Container(
                  height: allHeight(context) * 0.05,
                  width: allWidth(context) * 0.3,
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
                    SizedBox(
                      height: allHeight(context) * 0.01,
                    ),
                    Container(
                      width: allWidth(context),
                      child: Container(
                        height: allHeight(context) * 0.05,
                        width: allWidth(context),
                        child: Center(
                          child: AutoSizeText(
                            'Signed in first to access this feature.',
                            //name of main category
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                              Palette.actHubGreen.withOpacity(0.35),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'Images/human.png',
                      height: allHeight(context) * 0.45,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: allHeight(context) * 0.01),
                      child: Container(
                        width: allWidth(context),
                        height: allHeight(context) * 0.059,
                        child: Center(
                          child: AutoSizeText(
                            "you haven't signed in yet. please sign in\n to manage your activity in application.",
                            style: TextStyle(
                              fontSize: 25,
                              color:
                              Palette.actHubGreen.withOpacity(0.50),
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: allHeight(context) * 0.05,
                          left: allWidth(context) * 0.01,
                          right: allWidth(context) * 0.01),
                      child: Container(
                        width: allWidth(context) * 0.766,
                        height: allHeight(context) * 0.054,
                        child: ElevatedButton(
                            child: AutoSizeText(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ), //to style the text of buttons
                            style: ElevatedButton.styleFrom(
                                primary: Palette.blue // background
                              // foreground
                            ), //to set the color of buttons
                            onPressed: () {
                              Navigator.pushNamed(context, SignIn.id);
                            }),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
          buttons: []).show();
  }

  Widget sPAdd(BuildContext context) {
    double allWidth = MediaQuery.of(context).size.width;
    double allHeight = MediaQuery.of(context).size.height * 0.9 -
        MediaQuery.of(context).padding.top;
    if (allWidth >= allHeight) {
      setState(() {
        allWidth = MediaQuery.of(context).size.height * 1.5;
        allHeight = MediaQuery.of(context).size.width;
      });
    }

    bool isPressed = false;

    return Container(
      padding: EdgeInsets.all(allHeight * 0.01),
      child: SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: allHeight * 0.035),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(allHeight * 0.02),
                    child: Container(
                      height: (allHeight) * 2.8,
                      width: allWidth * 0.8,
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(allHeight * 0.03),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/title.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Title',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.06,
                                    width: allWidth * 0.8,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: TextField(
                                      cursorWidth: 2,
                                      cursorHeight: allHeight * 0.03,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        //to put border color white when the textfiled not clicked
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        //to set border color grey when the textfiled clicked
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                        ), //to set the color of hint black
                                      ),
                                      onTap: () {
                                        setState(() {
                                          isPressed = false;
                                        });
                                      }, //decorat input text
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/description.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.12,
                                    width: allWidth * 0.8,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: TextField(
                                      cursorWidth: allWidth * 0.01,
                                      cursorHeight: allHeight * 0.03,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(allHeight * 0.03),
                                          ),
                                        ),
                                        //to put border color white when the textfiled not clicked
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(allHeight * 0.03),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        //to set border color grey when the textfiled clicked
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                        ), //to set the color of hint black
                                      ), //decorat input text
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/price.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Price',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Center(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: isPressed
                                      ? Palette.orange
                                      : Palette.actHubGreen.withOpacity(0.33),
                                  elevation: 5,
                                  child: Container(
                                      height: allHeight * 0.06,
                                      width: allWidth * 0.4,
                                      decoration: BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(allHeight * 0.03),
                                        ),
                                      ),
                                      child: TextField(
                                        cursorWidth: allHeight * 0.01,
                                        cursorHeight: allHeight * 0.03,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                            ),
                                            //to put border color white when the textfiled not clicked
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            //to set border color grey when the textfiled clicked
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                            ),
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  top: allHeight * 0.012,
                                                  left: allHeight * 0.01,
                                                  bottom: allHeight * 0.012),
                                              child: AutoSizeText(
                                                '\$',
                                                style: TextStyle(
                                                    color: Palette.orange,
                                                    fontSize: 25),
                                              ),
                                            ) //to set the color of hint black
                                            ),

                                        //decorat input text
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/calendar.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Dates',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: allHeight * 0.015),
                                        child: Text('Start Date'),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        shadowColor: isPressed
                                            ? Palette.orange
                                            : Palette.actHubGreen
                                                .withOpacity(0.33),
                                        elevation: 5,
                                        child: Container(
                                          height: allHeight * 0.06,
                                          width: allWidth * 0.37,
                                          decoration: BoxDecoration(
                                            color: Palette.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  allHeight * 0.025),
                                            ),
                                          ),
                                          child: FlatButton(
                                              onPressed: null,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                    children: [
                                                      WidgetSpan(
                                                          child: Text(
                                                              'Start Date')),
                                                      WidgetSpan(
                                                        child: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color:
                                                                Palette.orange),
                                                      ),
                                                      WidgetSpan(
                                                        child: SizedBox(
                                                            width: allHeight *
                                                                0.01),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: allHeight * 0.015),
                                        child: Text('End Date'),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        shadowColor: isPressed
                                            ? Palette.orange
                                            : Palette.actHubGreen
                                                .withOpacity(0.33),
                                        elevation: 5,
                                        child: Container(
                                          height: allHeight * 0.06,
                                          width: allWidth * 0.36,
                                          decoration: BoxDecoration(
                                            color: Palette.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(allHeight * 0.03),
                                            ),
                                          ),
                                          child: FlatButton(
                                              onPressed: null,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                    children: [
                                                      WidgetSpan(
                                                          child:
                                                              Text('End Date')),
                                                      WidgetSpan(
                                                        child: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color:
                                                                Palette.orange),
                                                      ),
                                                      WidgetSpan(
                                                        child: SizedBox(
                                                            width: allHeight *
                                                                0.01),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/category.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Category',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              dots(context),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/location1.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Activity Location',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.06,
                                    width: allWidth * 0.56,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.all(allHeight * 0.01),
                                      child: Container(
                                        width: allWidth * 0.4,
                                        child: AutoSizeText(
                                          'Palestine,Ramallah',
                                          style: TextStyle(
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ))),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/image.png',
                                    height: allHeight * 0.03,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Image',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.3,
                                    width: allWidth * 0.7,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                      'Images/image.png',
                                      height: allHeight * 0.065,
                                    ))),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/video.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Video',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.3,
                                    width: allWidth * 0.7,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                      'Images/v1.png',
                                      height: allHeight * 0.065,
                                    ))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: allHeight * 0.08,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -8,
                child: Padding(
                  padding: EdgeInsets.only(bottom: allHeight * 0.01),
                  child: GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(allHeight * 0.01),
                      ),
                      elevation: 5,
                      child: Container(
                        height: allHeight * 0.08,
                        width: allHeight * 0.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Container(
                          width: allHeight * 0.001,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(allHeight * 0.001),
                              child: AutoSizeText(
                                'Submit',
                                style: TextStyle(
                                    color: Palette.orange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget adsAdd(BuildContext context) {
    double allWidth = MediaQuery.of(context).size.width;
    double allHeight = MediaQuery.of(context).size.height;
    if (allWidth >= allHeight) {
      setState(() {
        allWidth = MediaQuery.of(context).size.height * 1.5;
        allHeight = MediaQuery.of(context).size.width;
      });
    }
    bool isPressed = false;
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: allHeight * 0.035),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(allHeight * 0.02),
                    child: Container(
                      height: (allHeight) * 1.01,
                      width: allWidth * 0.8,
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(allHeight * 0.03),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/title.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Title',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.06,
                                    width: allWidth * 0.8,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: TextField(
                                      cursorWidth: 2,
                                      cursorHeight: allHeight * 0.03,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        //to put border color white when the textfiled not clicked
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        //to set border color grey when the textfiled clicked
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                        ), //to set the color of hint black
                                      ),
                                      onTap: () {
                                        setState(() {
                                          isPressed = false;
                                        });
                                      }, //decorat input text
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/description.png',
                                    height: allHeight * 0.04,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.12,
                                    width: allWidth * 0.8,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: TextField(
                                      cursorWidth: allWidth * 0.01,
                                      cursorHeight: allHeight * 0.03,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(allHeight * 0.03),
                                          ),
                                        ),
                                        //to put border color white when the textfiled not clicked
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(allHeight * 0.03),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        //to set border color grey when the textfiled clicked
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                        ), //to set the color of hint black
                                      ), //decorat input text
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Image.asset(
                                    'Images/image.png',
                                    height: allHeight * 0.03,
                                  ),
                                  title: Container(
                                      height: allHeight * 0.03,
                                      child: AutoSizeText(
                                        'Image',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      )),
                                  horizontalTitleGap: allWidth * 0.01),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: isPressed
                                    ? Palette.orange
                                    : Palette.actHubGreen.withOpacity(0.33),
                                elevation: 5,
                                child: Container(
                                    height: allHeight * 0.3,
                                    width: allWidth * 0.7,
                                    decoration: BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(allHeight * 0.03),
                                      ),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                      'Images/image.png',
                                      height: allHeight * 0.065,
                                    ))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: allHeight * 0.08,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -8,
                child: Padding(
                  padding: EdgeInsets.only(bottom: allHeight * 0.01),
                  child: GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(allHeight * 0.01),
                      ),
                      elevation: 5,
                      child: Container(
                        height: allHeight * 0.08,
                        width: allHeight * 0.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Container(
                          width: allHeight * 0.001,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(allHeight * 0.001),
                              child: AutoSizeText(
                                'Submit',
                                style: TextStyle(
                                    color: Palette.orange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dots(BuildContext context) {
    double allWidth = MediaQuery.of(context).size.width;
    double allHeight = MediaQuery.of(context).size.height;
    if (allWidth >= allHeight) {
      setState(() {
        allWidth = MediaQuery.of(context).size.height * 1.5;
        allHeight = MediaQuery.of(context).size.width;
      });
    }
    bool isPressed = false;
    final controller = PageController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: allHeight * 0.01),
          Container(
            height: allHeight * 0.06,
            width: allWidth * 0.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: 10,
              itemBuilder: (builderContext, int index) {
                return Container(
                  width: allWidth * 0.66,
                  height: allHeight * 0.02,
                  child: Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(allHeight * 0.03),
                        ),
                        shadowColor: isPressed
                            ? Palette.orange
                            : Palette.actHubGreen.withOpacity(0.33),
                        elevation: 5,
                        child: Container(
                            height: allHeight * 0.06,
                            width: allWidth * 0.3,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(allHeight * 0.03),
                              ),
                            ),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(allHeight * 0.003),
                              child: AutoSizeText(
                                'Hiking',
                                style: TextStyle(
                                    color: Palette.actHubGreen, fontSize: 20),
                                maxLines: 1,
                              ),
                            ))),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(allHeight * 0.03),
                        ),
                        shadowColor: isPressed
                            ? Palette.orange
                            : Palette.actHubGreen.withOpacity(0.33),
                        elevation: 5,
                        child: Container(
                            height: allHeight * 0.06,
                            width: allWidth * 0.3,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(allHeight * 0.03),
                              ),
                            ),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(allHeight * 0.003),
                              child: AutoSizeText(
                                'Hiking',
                                style: TextStyle(
                                    color: Palette.actHubGreen, fontSize: 20),
                                maxLines: 1,
                              ),
                            ))),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: allHeight * 0.02,
          ),
          SmoothPageIndicator(
              controller: controller,
              count: 10,
              effect: ScrollingDotsEffect(
                activeDotScale: 1,
                dotWidth: allHeight * 0.013,
                dotHeight: allHeight * 0.013,
                radius: allHeight * 0.013,
                spacing: allHeight * 0.006,
                activeDotColor: Palette.actHubGreen,
              )),
        ],
      ),
    );
  }
}
