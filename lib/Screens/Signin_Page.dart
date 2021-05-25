import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Design/Button.dart';
import 'package:acthub/Screens/Nested/Email_Password_Signin_Page.dart';
import 'package:flutter/cupertino.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SignInButton(),

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
                    child: SvgPicture.asset("assets/Component 34 – 1.svg")
                  ),
                ],
              ),
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
                  return  anonymousSignInButton();
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                );
              },
            ),


          ],
        ),
      ),
    ));
  }
}


