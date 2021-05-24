import 'package:acthub/Screens/NavigationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatefulWidget {
  static const String id = 'SignIn';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'Images/HeaderLogo1.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Welcome To",
            style: TextStyle(fontSize: 25),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  height: 50,
                  width: 130,
                  child: Image.asset('Images/ActHubOLogo.png'))),
          SizedBox(
            height: 5,
          ),
          Text(
            "Login for full enjoyable experience",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton(
            Buttons.Google,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
            onPressed: () {
              _showButtonPressDialog(context, 'Google');
            },
          ),
          SignInButton(
            Buttons.Apple,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
            onPressed: () {
              _showButtonPressDialog(context, 'Apple');
            },
          ),
          SignInButton(
            Buttons.FacebookNew,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
            onPressed: () {
              _showButtonPressDialog(context, 'FacebookNew');
            },
          ),
          SignInButtonBuilder(
            text: 'Sign in By Email',
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
            icon: Icons.email,
            onPressed: () {
              _showButtonPressDialog(context, 'Email');
            },
            backgroundColor: Colors.orange[300],
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
            text: 'Join Us As A Guest',
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationPage()));
            },
            backgroundColor: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
