import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/Welcome/SignUpFormPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpAsPage extends StatefulWidget {
  const SignUpAsPage({Key key}) : super(key: key);
  static const String id = 'SignUpAsPage';

  @override
  _SignUpAsPageState createState() => _SignUpAsPageState();
}

class _SignUpAsPageState extends State<SignUpAsPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> SetStringSharedPreferance(String Type)  {
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        prefs.setString("UserType", Type);
      })();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Palette.lightOrange,
      // ),
      backgroundColor: Color(0xffEFEFEF),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              //container for the continue as
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.77,
              child: AutoSizeText(
                'Continue as ',
                style: TextStyle(
                    color: Color(0xff566357).withOpacity(0.6),
                    fontSize: 30,
                    fontFamily: 'Segoe UI'),
              ),
            ),
            Padding(
              //Divider line
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.075,
                  left: MediaQuery.of(context).size.width * 0.075),
              child: Divider(color: Color(0xffF9A559), thickness: 1.0),
            ),
            userCard(context, 'serviceProvider', "1"),
            userCard(context, 'advertiser', "2"),
            userCard(context, 'user', "3"),
          ],
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset(
              'Images/ActHubG.png',
              fit: BoxFit.contain,
            )),
      ]),
    );
  }

  GestureDetector userCard(BuildContext context, String user,String usertype) {
    return GestureDetector(
      onTap: () async {
        await SetStringSharedPreferance(usertype);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignUpFormPage()));

      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.145,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.06,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.04,
                          bottom: MediaQuery.of(context).size.height * 0.018),
                      child: Center(
                        child: AutoSizeText(
                          'as service provider, you have the right to add your services and offers about your trip, and you can get offer from us for long terms ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.04,
              child: GFImageOverlay(
                image: AssetImage('Images/$user.png'),
                width: MediaQuery.of(context).size.width * 0.77,
                height: MediaQuery.of(context).size.height * 0.08,
                borderRadius: BorderRadius.circular(18),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Center(
                      child: AutoSizeText(
                        "$user",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Palette.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
