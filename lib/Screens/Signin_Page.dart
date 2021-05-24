import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Design/Button.dart';
import 'package:acthub/Screens/Nested/Email_Password_Signin_Page.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          Text("Welcome To"),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  height: 50,
                  width: 130,
                  child: Image.asset('assets/acthublogo.png'))),
          SizedBox(
            height: 5,
          ),
          Text("Login for full enjoyable experience"),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: Authentication.initializeFirebase(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return GoogleSignInButton();
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: Authentication.initializeFirebase(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return AppleSignInButton();
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: Authentication.initializeFirebase(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return FacebookSignInButton();
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Email_Password_Signin_Page()),
              );
            },
            child: SizedBox(
              width: 351.0,
              height: 45.0,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 351.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Text(
                      'Sign in ',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 351.0,
            height: 21.0,
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, 0.3),
                  child: SvgPicture.string(
                    // Path 2972
                    '<svg viewBox="31.5 730.56 156.55 1.0" ><path transform="translate(-679.5, 16724.85)" d="M 711 -15994.29296875 L 792.9439086914063 -15994.29296875 L 867.5496215820313 -15994.29296875" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    width: 156.55,
                    height: 1.0,
                  ),
                ),
                Spacer(flex: 8),
                Text(
                  'Or',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: const Color(0xFF566357),
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 8),
                Align(
                  alignment: Alignment(0.0, 0.3),
                  child: SvgPicture.string(
                    // Path 2973
                    '<svg viewBox="221.86 730.56 160.64 1.0" ><path transform="translate(-489.14, 16724.85)" d="M 711 -15994.29296875 L 795.0847778320313 -15994.29296875 L 871.6395874023438 -15994.29296875" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    width: 160.64,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {},
            child: SizedBox(
              width: 351.0,
              height: 45.0,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 351.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Text(
                      'Join us as a Guest ',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
