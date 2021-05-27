import 'package:acthub/Api/translation_widget.dart';
import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Screens/Signin_Page.dart';
import 'package:country_codes/country_codes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoScreenGoogle extends StatefulWidget {
  const UserInfoScreenGoogle({Key key,  User user})
      : _user = user,
        super(key: key);

  final User _user;
  //todo: this class from firebase_auth build in class
  //todo: the desing we can use the girls build and use these function in it


  @override
  _UserInfoScreenGoogleState createState() => _UserInfoScreenGoogleState();
}

class _UserInfoScreenGoogleState extends State<UserInfoScreenGoogle> {
  User _user;
  bool _isSigningOut = false;
  bool _isEmailVerified;
  bool _verificationEmailBeingSent = false;


  @override
  void initState() {
    _user = widget._user;
    _isEmailVerified = _user.emailVerified;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: Color(0xFFECEFF1),
                        child: Image.network(
                          _user.photoURL,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: Color(0xFFECEFF1),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Color(0xFFECEFF1),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 16.0),
              Text(
                'Hello',
                style: TextStyle(
                  color: Color(0xFFECEFF1),
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                _user.displayName,
                style: TextStyle(
                  color:Color(0xFFFFCA28),
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '( ${_user.email} )',
                style: TextStyle(
                  color: Color(0xFFF57C00),
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'You are now signed in using your Google account. To sign out of your account click the "Sign Out" button below.',
                style: TextStyle(
                    color: Color(0xFFECEFF1),
                    fontSize: 14,
                    letterSpacing: 0.2),
              ),
              TranslationWidget(message: "You are now signed in using your Google account. To sign out of your account click the Sign Out button below.", fromLanguage: "English", toLanguage: "Arabic", builder: (translatedMessage) =>
                    Text(
                      translatedMessage,
                      style: TextStyle(
                          color: Color(0xFFECEFF1),
                          fontSize: 14,
                          letterSpacing: 0.2),
                    ),
              ),
              SizedBox(height: 16.0),
              _isSigningOut
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.redAccent,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
