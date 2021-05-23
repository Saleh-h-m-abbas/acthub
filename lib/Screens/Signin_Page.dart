import 'package:acthub/Classes/FacebookSignInButton.dart';
import 'package:acthub/Classes/GoogleSignInButton.dart';
import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Screens/Nested/Email_Password_Signin_Page.dart';
import 'package:acthub/Screens/Nested/user_info_screen_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isSigningIn = false;
  User _userFacebook;
  FacebookLogin facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          SignInButton(
            Buttons.Apple,
            text: "Sign up with Apple",
            onPressed: () {},
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
          SignInButtonBuilder(
            text: 'Sign up by Email',
            icon: Icons.email,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Email_Password_Signin_Page()),
              );
            },
            backgroundColor: Colors.orange[400],
            width: 220.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(flex: 8),
              Text(
                'Or',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16.0,
                  color: const Color(0xFF000000),
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 8),
            ],
          ),
          SignInButtonBuilder(
            //////  يفضل انو اعملها زي spin text
            text: 'Join Us As A Guest',
            onPressed: () {},
            backgroundColor: Colors.grey[600],
            width: 220.0,
          ),
        ],
      ),
    ));
  }
}
