import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Screens/Nested/user_info_screen_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';



class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : SignInButton(
            Buttons.Google,
            text: "Sign up with Google",
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });
          User user =
          await Authentication.signInWithGoogle(context: context);
          setState(() {
            _isSigningIn = false;
          });
          if (user != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UserInfoScreenGoogle(user: user,),// in this button we send a user name with this page and we must stour it in database
              ),
            );


            print(user.email);
            print(user.displayName);
            print(user.photoURL);
          }
        },
      ),
    );
  }
}
