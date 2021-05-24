import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Screens/Nested/Email_Password_Signin_Page.dart';
import 'package:acthub/Screens/Signin_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoScreenAnonymously extends StatefulWidget {
  const UserInfoScreenAnonymously({Key key, User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenAnonymouslyState createState() =>
      _UserInfoScreenAnonymouslyState();
}

class _UserInfoScreenAnonymouslyState extends State<UserInfoScreenAnonymously> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
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
                      Text(
                        'Hello Anonymously',
                        style: TextStyle(
                          color: Color(0xFFECEFF1),
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.grey,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
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


                    ]))));
  }
}
