import 'package:acthub/Screens/Nested/CreatePasswordPage.dart';
import 'package:acthub/Screens/Nested/user_info_screen_email.dart';
import 'package:acthub/Screens/Nested/user_info_screen_facebook.dart';
import 'package:acthub/Screens/Nested/user_info_screen_google.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

String EmailOnly = "",
    GoogleEmail = "",
    FacebookEmail = "",
    TwitterEmail = '',
    AppleEmail = "",
    ProviderId = "",
    Password = "",
    MainEmail = "";
final firestoreInstance = FirebaseFirestore.instance;

class Authentication {
  static SnackBar customSnackBar({String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UserInfoScreenGoogle(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  static getData() async {
    await firestoreInstance
        .collection("users")
        .doc("4sMasxJxApX2eLexAqfnQHrpxaV2")
        .get()
        .then((value) {
      print("google :" + value.data()["GoogleEmail"]);
      print("facebook :" + value.data()["FacebookEmail"]);
      print("email :" + value.data()["email"]);
      print("twiter :" + value.data()["TwitterEmail"]);
      print("pass :" + value.data()["password"]);
      print("provider :" + value.data()["providerId"]);
      print("main :" + value.data()["MainEmail"]);

      GoogleEmail = value.data()["GoogleEmail"];
      FacebookEmail = value.data()["FacebookEmail"];
      EmailOnly = value.data()["email"];
      TwitterEmail = value.data()["TwitterEmail"];
      Password = value.data()["password"];
      MainEmail = value.data()["MainEmail"];
      ProviderId = value.data()["providerId"];
    });
  }

  //****************************************************************************************************************************
  static Future<User> signInWithGoogle({BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    User user;
    CollectionReference usersdatabase =
        FirebaseFirestore.instance.collection('users');
    //------------------------------------
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);
        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      String _googleUserEmail = googleSignInAccount
          .email; //Todo: get email from google to check it if exist or not
      // print(FirebaseAuth.instance.currentUser.email);
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        try {
          getData();
          // final UserCredential userCredential =
          //     await auth.signInWithCredential(credential);
          // user = userCredential.user;
          // userCredential.user.updateEmail(_googleUserEmail);
          //  print(user.email);
          if (MainEmail.isNotEmpty) {
            if (ProviderId.isNotEmpty) {
              if (ProviderId == "facebook.com") {
                User userfacebook =
                    await Authentication.signInWithFacebook(context: context);
                if (userfacebook != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreenFacebook(
                        user: userfacebook,
                      ), // in this button we send a user name with this page and we must stour it in database
                    ),
                  );
                  print(userfacebook.email);
                  print(userfacebook.displayName);
                  print(userfacebook.photoURL);
                }
              } else if (ProviderId == "password") {
                User user = await Authentication.signInUsingEmailPassword(
                  context: context,
                  email: EmailOnly,
                  password: Password,
                );
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreenEmail(
                        user: user,
                      ),
                    ),
                  );
                }
              } else if (ProviderId == "apple.com") {
                User user =
                    await Authentication.signInWithGoogle(context: context);
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
              } // not ready to use
              else if (ProviderId == "twitter.com") {
                User user =
                    await Authentication.signInWithGoogle(context: context);
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
              }
            }
          }
          else if (MainEmail.isNotEmpty && ProviderId.isEmpty) {
            usersdatabase
                .doc(user.uid)
                .update({
                  'GoogleEmail': user.email,
                  'providerId': "google.com",
                  'uid': user.uid,
                })
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
            final UserCredential userCredential =
                await auth.signInWithCredential(credential);
            user = userCredential.user;
            userCredential.user.updateEmail(_googleUserEmail);
            print(user.email);
          }
          else if (MainEmail.isEmpty) {
            usersdatabase
                .doc(user.uid)
                .update({
                  'GoogleEmail': user.email,
                  'MainEmail': user.email,
                  'uid': user.uid,
                })
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
            if (ProviderId.isNotEmpty) {
              if (ProviderId == "facebook.com") {
                User userfacebook =
                    await Authentication.signInWithFacebook(context: context);
                if (userfacebook != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreenFacebook(
                        user: userfacebook,
                      ), // in this button we send a user name with this page and we must stour it in database
                    ),
                  );
                  print(userfacebook.email);
                  print(userfacebook.displayName);
                  print(userfacebook.photoURL);
                }
              } else if (ProviderId == "password") {
                User user = await Authentication.signInUsingEmailPassword(
                  context: context,
                  email: EmailOnly,
                  password: Password,
                );
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreenEmail(
                        user: user,
                      ),
                    ),
                  );
                }
              } else if (ProviderId == "apple.com") {
                User user =
                    await Authentication.signInWithGoogle(context: context);
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
              } // not ready to use
              else if (ProviderId == "twitter.com") {
                User user =
                    await Authentication.signInWithGoogle(context: context);
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
              }
            }
          }
          else if (MainEmail.isEmpty && ProviderId.isEmpty) {
            usersdatabase
                .doc(user.uid)
                .update({
                  'GoogleEmail': user.email,
                  'MainEmail': user.email,
                  'providerId': "google.com",
                  'uid': user.uid,
                })
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
            final UserCredential userCredential =
                await auth.signInWithCredential(credential);
            user = userCredential.user;
            userCredential.user.updateEmail(_googleUserEmail);
            print(user.email);
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }
    return user;
  }

  static Future<void> signOut({BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  //*****************************************************************************************************************************
  static Future<User> signInWithFacebook({BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User Facebookuser;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    CollectionReference usersdatabase =
        FirebaseFirestore.instance.collection('users');
    FacebookLogin facebookLogin = FacebookLogin();
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    try {
      // var a = await auth.signInWithCredential(credential);
      // Facebookuser = a.user;
      // print(a.user.email);
      getData();

      if (MainEmail.isNotEmpty ) {
        if (ProviderId.isNotEmpty) {
          if (ProviderId == "google.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
          else if (ProviderId == "password") {
            User user = await Authentication.signInUsingEmailPassword(
              context: context,
              email: EmailOnly,
              password: Password,
            );
            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreenEmail(
                    user: user,
                  ),
                ),
              );
            }
          }
          else if (ProviderId == "apple.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          } // not ready to use
          else if (ProviderId == "twitter.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
        }
      }
      else if (MainEmail.isNotEmpty && ProviderId.isEmpty) {
        var a = await auth.signInWithCredential(credential);
         Facebookuser = a.user;
         print(a.user.email);
        usersdatabase
            .doc(a.user.uid)
            .update({
          'FacebookEmail': Facebookuser.email,
          'providerId': "facebook.com",
          'uid': Facebookuser.uid,
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));

      }
      else if (MainEmail.isEmpty) {
        var a = await auth.signInWithCredential(credential);
        Facebookuser = a.user;
        print(a.user.email);
        usersdatabase
            .doc(a.user.uid)
            .update({
          'FacebookEmail': Facebookuser.email,
          'uid': Facebookuser.uid,
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
        if (ProviderId.isNotEmpty) {
          if (ProviderId == "google.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          } else if (ProviderId == "password") {
            User user = await Authentication.signInUsingEmailPassword(
              context: context,
              email: EmailOnly,
              password: Password,
            );
            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreenEmail(
                    user: user,
                  ),
                ),
              );
            }
          } else if (ProviderId == "apple.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          } // not ready to use
          else if (ProviderId == "twitter.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
        }
      }
      else if (MainEmail.isEmpty && ProviderId.isEmpty) {
        var a = await auth.signInWithCredential(credential);
        Facebookuser = a.user;
        print(a.user.email);
        usersdatabase
            .doc(a.user.uid)
            .update({
          'FacebookEmail': Facebookuser.email,
          'MainEmail': Facebookuser.email,
          'uid': Facebookuser.uid,
          'providerId': "facebook.com",
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred using Facebook Sign In. Try again.',
        ),
      );
    }
    return Facebookuser;
  }

  static Future<void> signOutFacebook({BuildContext context}) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    FacebookLogin facebookLogin = FacebookLogin();
    try {
      if (!kIsWeb) {
        await _firebaseAuth.signOut();
      }
      await FirebaseAuth.instance.signOut();
      await _firebaseAuth.signOut().then((onValue) {
        facebookLogin.logOut();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  //*****************************************************************************************************************************
  static Future<UserCredential> signInWithTwitter(
      {BuildContext context}) async {
    // Create a TwitterLogin instance
    final TwitterLogin twitterLogin = new TwitterLogin(
      consumerKey: '<your consumer key>',
      consumerSecret: ' <your consumer secret>',
    );
    // Trigger the sign-in flow
    final TwitterLoginResult loginResult = await twitterLogin.authorize();
    // Get the Logged In session
    final TwitterSession twitterSession = loginResult.session;
    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: twitterSession.token,
      secret: twitterSession.secret,
    );
    return FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    // Once signed in, return the UserCredential
    //return user;
  }

  static Future<void> signOutTwitter({BuildContext context}) async {
    try {
      if (!kIsWeb) {
        await FirebaseAuth.instance.signOut();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  //*****************************************************************************************************************************
  static Future<User> signInUsingEmailPassword({
    String email,
    String password,
    String uid,
    BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    CollectionReference usersdatabase =
        FirebaseFirestore.instance.collection('users');
    try {
      getData();
      // UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password,);
      // user = userCredential.user;
      // userCredential.user.updateEmail(email);
      // print(user.email);
      //

      if (MainEmail.isNotEmpty ) {
        if (ProviderId.isNotEmpty) {
          if (ProviderId == "google.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
          else if (ProviderId == "facebook.com") {
            User userfacebook =
            await Authentication.signInWithFacebook(context: context);
            if (userfacebook != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreenFacebook(
                    user: userfacebook,
                  ), // in this button we send a user name with this page and we must stour it in database
                ),
              );
              print(userfacebook.email);
              print(userfacebook.displayName);
              print(userfacebook.photoURL);
            }
          }
          else if (ProviderId == "apple.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          } // not ready to use
          else if (ProviderId == "twitter.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
        }
      }
      else if (MainEmail.isNotEmpty && ProviderId.isEmpty) {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password,);
        user = userCredential.user;
        userCredential.user.updateEmail(email);
        print(user.email);
        usersdatabase
            .doc(user.uid)
            .update({
          'email': user.email,
          'providerId': "password",
          'uid': user.uid,
          'password': password,
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
      else if (MainEmail.isEmpty) {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password,);
        user = userCredential.user;
        userCredential.user.updateEmail(email);
        print(user.email);
        usersdatabase
            .doc(user.uid)
            .update({
          'email': user.email,
          'uid': user.uid,
          'password': password,
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
        if (ProviderId.isNotEmpty) {
          if (ProviderId == "google.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
          else if (ProviderId == "facebook.com") {
            User userfacebook =
            await Authentication.signInWithFacebook(context: context);
            if (userfacebook != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreenFacebook(
                    user: userfacebook,
                  ), // in this button we send a user name with this page and we must stour it in database
                ),
              );
              print(userfacebook.email);
              print(userfacebook.displayName);
              print(userfacebook.photoURL);
            }
          }
          else if (ProviderId == "apple.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          } // not ready to use
          else if (ProviderId == "twitter.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
        }
      }
      else if (MainEmail.isEmpty && ProviderId.isEmpty) {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password,);
        user = userCredential.user;
        userCredential.user.updateEmail(email);
        print(user.email);
        usersdatabase
            .doc(user.uid)
            .update({
          'email': user.email,
          'MainEmail': user.email,
          'uid': user.uid,
          'password': password,
          'providerId': "password",
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
    }
    catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User> registerUsingEmailPassword({
    String name,
    String email,
    String password,
    BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    CollectionReference usersdatabase =
        FirebaseFirestore.instance.collection('users');
    try {
      // UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // print(password + "---------------------------------------");
      // user = userCredential.user;
      // await user.updateProfile(displayName: name);
      // await user.reload();
      //  user = auth.currentUser;
      //  userCredential.user.updateEmail(email);
      //  print(user.email);

      if (MainEmail.isNotEmpty ) {
        if (ProviderId.isNotEmpty) {
          if (ProviderId == "google.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
          else if (ProviderId == "facebook.com") {
            User userfacebook =
            await Authentication.signInWithFacebook(context: context);
            if (userfacebook != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreenFacebook(
                    user: userfacebook,
                  ), // in this button we send a user name with this page and we must stour it in database
                ),
              );
              print(userfacebook.email);
              print(userfacebook.displayName);
              print(userfacebook.photoURL);
            }
          }
          else if (ProviderId == "apple.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          } // not ready to use
          else if (ProviderId == "twitter.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
        }
      }
      else if (MainEmail.isNotEmpty && ProviderId.isEmpty) {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(password + "---------------------------------------");
        user = userCredential.user;
        await user.updateProfile(displayName: name);
        await user.reload();
        user = auth.currentUser;
        userCredential.user.updateEmail(email);
        print(user.email);
        usersdatabase
            .doc(user.uid)
            .update({
          'email': user.email,
          'providerId': "password",
          'uid': user.uid,
          'password': password,
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
      else if (MainEmail.isEmpty) {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(password + "---------------------------------------");
        user = userCredential.user;
        await user.updateProfile(displayName: name);
        await user.reload();
        user = auth.currentUser;
        userCredential.user.updateEmail(email);
        print(user.email);
        usersdatabase
            .doc(user.uid)
            .update({
          'email': user.email,
          'uid': user.uid,
          'password': password,
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
        if (ProviderId.isNotEmpty) {
          if (ProviderId == "google.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
          else if (ProviderId == "facebook.com") {
            User userfacebook =
            await Authentication.signInWithFacebook(context: context);
            if (userfacebook != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreenFacebook(
                    user: userfacebook,
                  ), // in this button we send a user name with this page and we must stour it in database
                ),
              );
              print(userfacebook.email);
              print(userfacebook.displayName);
              print(userfacebook.photoURL);
            }
          }
          else if (ProviderId == "apple.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          } // not ready to use
          else if (ProviderId == "twitter.com") {
            User user = await Authentication.signInWithGoogle(context: context);
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
          }
        }
      }
      else if (MainEmail.isEmpty && ProviderId.isEmpty) {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(password + "---------------------------------------");
        user = userCredential.user;
        await user.updateProfile(displayName: name);
        await user.reload();
        user = auth.currentUser;
        userCredential.user.updateEmail(email);
        print(user.email);
        usersdatabase
            .doc(user.uid)
            .update({
          'email': user.email,
          'MainEmail': user.email,
          'uid': user.uid,
          'password': password,
          'providerId': "password",
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
    }  catch (e) {
      print(e);
    }
    return user;
  }
  static Future<User> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await user.reload();
    User refreshedUser = auth.currentUser;
    return refreshedUser;
  }

  //*****************************************************************************************************************************
  Future<void> test({BuildContext context}) async {
    // Trigger the Google Authentication flow.
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential.
    final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Sign in to Firebase with the Google [UserCredential].
    final UserCredential googleUserCredential =
        await FirebaseAuth.instance.signInWithCredential(googleCredential);
    //""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    // Now let's link Twitter to the currently signed in account.
    // Create a [FacebookLogin] instance.
    FacebookLogin facebookLogin = FacebookLogin();
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    final FacebookAccessToken accessToken = result.accessToken;
    // AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
    final AuthCredential FacebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.token);
    // Link the Twitter account to the Google account.
    await googleUserCredential.user.linkWithCredential(FacebookAuthCredential);
  }
}
