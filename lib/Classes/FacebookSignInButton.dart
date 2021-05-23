import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Screens/Nested/user_info_screen_facebook.dart';
import 'package:acthub/Screens/Nested/user_info_screen_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';



class FacebookSignInButton extends StatefulWidget {
  @override
  _FacebookSignInButtonState createState() => _FacebookSignInButtonState();
}

class _FacebookSignInButtonState extends State<FacebookSignInButton> {
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
            Buttons.FacebookNew,
            text: "Sign up with Facebook",
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });
          User userfacebook =
          await Authentication.signInWithFacebook(context: context);
          setState(() {
            _isSigningIn = false;
          });
          if (userfacebook != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UserInfoScreenFacebook(user: userfacebook,),// in this button we send a user name with this page and we must stour it in database
              ),
            );
            print(userfacebook.email);
            print(userfacebook.displayName);
            print(userfacebook.photoURL);
          }
        },
      ),
    );
  }
}
