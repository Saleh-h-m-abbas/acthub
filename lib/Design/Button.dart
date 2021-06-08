import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Screens/Nested/test.dart';
import 'package:acthub/Screens/Nested/user_info_screen_Anonymously.dart';
import 'package:acthub/Screens/Nested/user_info_screen_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:acthub/Screens/Nested/user_info_screen_facebook.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppleSignInButton extends StatefulWidget {
  @override
  _AppleSignInButtonState createState() => _AppleSignInButtonState();
}
class _AppleSignInButtonState extends State<AppleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: _isSigningIn
          ? GestureDetector(
        onTap: () async {
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
                builder: (context) => UserInfoScreenGoogle(
                  user: user,
                ), // in this button we send a user name with this page and we must stour it in database
              ),
            );

            print(user.email);
            print(user.displayName);
            print(user.photoURL);
          }
        },
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 370.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with Apple',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 16.0,
                child: Image.asset("assets/apple.png",
                    width: 18, height: 18),
              ),
            ],

        ),
      ):
             GestureDetector(
        onTap: () async {
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
                builder: (context) => UserInfoScreenGoogle(
                  user: user,
                ), // in this button we send a user name with this page and we must stour it in database
              ),
            );

            print(user.email);
            print(user.displayName);
            print(user.photoURL);
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 370.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: Offset(0, 3.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                'Sign in with Apple',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 16.0,
              child: Image.asset("assets/apple.png",
                  width: 18, height: 18),
            ),
          ],

        ),
      ),
    );
  }
}

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
      child: _isSigningIn ?
      GestureDetector(
        onTap: () async {
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
        child:  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 370.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xff3C79E6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with Facebook',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),


              ),
              Positioned(
                left: 16.0,
                child: Image.asset("assets/facebook.png",
                    width: 20, height: 20),
              ),
            ],
        ),
      ):
      GestureDetector(
        onTap: () async {
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
        child:  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 370.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xff3C79E6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: Offset(0, 3.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                'Sign in with Facebook',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 16.0,
              child: Image.asset("assets/facebook.png",
                  width: 20, height: 20),
            ),
          ],
        ),
      )
    );
  }
}


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
          ? GestureDetector(
        onTap: () async {
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
                builder: (context) => UserInfoScreenGoogle(
                  user: user,
                ), // in this button we send a user name with this page and we must stour it in database
              ),
            );

            print(user.email);
            print(user.displayName);
            print(user.photoURL);
          }
        },
        child:  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 370.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 16.0,
                child: Image.asset("assets/google.png",
                    width: 20, height: 20),
              ),
            ],
          ),
      ):
      GestureDetector(
        onTap: () async {
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
                builder: (context) => UserInfoScreenGoogle(
                  user: user,
                ), // in this button we send a user name with this page and we must stour it in database
              ),
            );

            print(user.email);
            print(user.displayName);
            print(user.photoURL);
          }
        },
        child:  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 370.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: Offset(0, 3.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 16.0,
              child: Image.asset("assets/google.png",
                  width: 20, height: 20),
            ),
          ],
        ),
      )
    );
  }
}


/*class TwitterSignInButton extends StatefulWidget {
  @override
  _TwitterSignInButtonState createState() => _TwitterSignInButtonState();
}
class _TwitterSignInButtonState extends State<TwitterSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: _isSigningIn
            ? GestureDetector(
          onTap: () async {
            setState(() {
              _isSigningIn = true;
            });
            User user =
            await Authentication.signInWithTwitter(context: context);
            setState(() {
              _isSigningIn = false;
            });
            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreenGoogle(
                    user: user,
                  ), // in this button we send a user name with this page and we must stour it in database
                ),
              );

              print(user.email);
              print(user.displayName);
              print(user.photoURL);
            }
          },
          child:  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 370.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with Twitter',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 16.0,
                child: Image.asset("assets/google.png",
                    width: 20, height: 20),
              ),
            ],
          ),
        ):
        GestureDetector(
          onTap: () async {
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
                  builder: (context) => UserInfoScreenGoogle(
                    user: user,
                  ), // in this button we send a user name with this page and we must stour it in database
                ),
              );

              print(user.email);
              print(user.displayName);
              print(user.photoURL);
            }
          },
          child:  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 370.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with Twitter',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 16.0,
                child: Image.asset("assets/google.png",
                    width: 20, height: 20),
              ),
            ],
          ),
        )
    );
  }
}*/


class anonymousSignInButton extends StatefulWidget {
  @override
  _anonymousSignInButtonState createState() => _anonymousSignInButtonState();
}
class _anonymousSignInButtonState extends State<anonymousSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: _isSigningIn
          ?  GestureDetector(
        onTap: () async {
          setState(() {
            _isSigningIn = true;
          });
          await FirebaseAuth.instance.signInAnonymously();
          setState(() {
            _isSigningIn = false;
          });
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => UserInfoScreenAnonymously(
              ), // in this button we send a user name with this page and we must stour it in database
            ),
          );
        },
      child:  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 370.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xff566357).withOpacity(0.42),
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

      ):
      GestureDetector(
        onTap: () async {
          setState(() {
            _isSigningIn = true;
          });
          await FirebaseAuth.instance.signInAnonymously();
          setState(() {
            _isSigningIn = false;
          });
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => UserInfoScreenAnonymously(
              ), // in this button we send a user name with this page and we must stour it in database
            ),
          );
        },
        child:  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 370.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xff566357).withOpacity(0.42),
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

      )
    );
  }
}




class LinkedButton extends StatefulWidget {
  @override
  _LinkedButtonState createState() => _LinkedButtonState();
}
class _LinkedButtonState extends State<LinkedButton> {
  bool _isSigningIn = false;
  Future<void> test({BuildContext context}) async {
    // Trigger the Google Authentication flow.
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // Create a new credential.
    final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,);
    // Sign in to Firebase with the Google [UserCredential].
    final UserCredential googleUserCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
    //""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    // Now let's link Twitter to the currently signed in account.
    // Create a [FacebookLogin] instance.
    FacebookLogin facebookLogin = FacebookLogin();
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    final FacebookAccessToken accessToken = result.accessToken;
    // AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
    final AuthCredential FacebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
    // Link the Twitter account to the Google account.
    await googleUserCredential.user.linkWithCredential(FacebookAuthCredential);

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: _isSigningIn
            ? GestureDetector(
          onTap: () async {
            setState(() {
              _isSigningIn = true;
            });
           await test();
            setState(() {
              _isSigningIn = false;
            });

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => test1(), // in this button we send a user name with this page and we must stour it in database
                ),
              );
            },
          child:  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 370.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with Google and facebook',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 16.0,
                child: Image.asset("assets/google.png",
                    width: 20, height: 20),
              ),
            ],
          ),
        ):
        GestureDetector(
          onTap: () async {
            setState(() {
              _isSigningIn = true;
            });

            await  test();
            setState(() {
              _isSigningIn = false;
            });

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => test1(), // in this button we send a user name with this page and we must stour it in database
                ),
              );

          },
          child:  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 370.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with Google and facebook',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 16.0,
                child: Image.asset("assets/google.png",
                    width: 20, height: 20),
              ),
            ],
          ),
        )
    );
  }
}

