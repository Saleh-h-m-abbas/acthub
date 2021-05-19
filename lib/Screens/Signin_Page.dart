import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        body: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Image.asset(
                'assets/Sign_in_pic.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5,),
            Text("Welcome To"),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                    height: 50,
                    width: 130,
                    child: Image.asset('assets/acthublogo.png'))),
            SizedBox(height: 5,),
            Text("Login for full enjoyable experience"),
            SizedBox(height: 10,),

            SignInButton(
              Buttons.Google,
              onPressed: () {
                _showButtonPressDialog(context, 'Google');
              },
            ),
            SignInButton(
              Buttons.Apple,
              onPressed: () {
                _showButtonPressDialog(context, 'Apple');
              },
            ),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: () {
                _showButtonPressDialog(context, 'FacebookNew');
              },
            ),
            SignInButtonBuilder(
              text: 'Sign in By Email',
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
              onPressed: () {},
              backgroundColor: Colors.grey[600],
              width: 220.0,
            ),

          ],
        ),
      ),
    );
  }
}
