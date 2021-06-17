import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Classes/custom_form_field.dart';
import 'package:acthub/Classes/validator.dart';
import 'package:acthub/Screens/Signin_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class LinkAccountPage extends StatefulWidget {
  const LinkAccountPage({Key key}) : super(key: key);

  @override
  _LinkAccountPageState createState() => _LinkAccountPageState();
}

class _LinkAccountPageState extends State<LinkAccountPage> {
  bool go = false, fa = false, tw = false, pa = false, em = false, ap = false;
  final firestoreInstance = FirebaseFirestore.instance;
  String G = "",
      F = "",
      T = "",
      E = "",
      P = "",
      A = "",
      MainEmail = "",
      ProviderId = "";
  CollectionReference usersdatabase =
      FirebaseFirestore.instance.collection('users');

  final auth = FirebaseAuth.instance;
  void getData() async {
    await firestoreInstance
        .collection("users")
        .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
        .get()
        .then((value) {
      print("google :" + value.data()["GoogleEmail"]);
      print("facebook :" + value.data()["FacebookEmail"]);
      print("email :" + value.data()["email"]);
      print("twiter :" + value.data()["TwitterEmail"]);
      print("apple :" + value.data()["AppleEmail"]);
      print("pass :" + value.data()["password"]);
      print("provider :" + value.data()["providerId"]);
      print("main :" + value.data()["MainEmail"]);

      G = value.data()["GoogleEmail"];
      F = value.data()["FacebookEmail"];
      E = value.data()["email"];
      T = value.data()["TwitterEmail"];
      P = value.data()["password"];
      A = value.data()["AppleEmail"];
      MainEmail = value.data()["MainEmail"];
      ProviderId = value.data()["providerId"];

      if (G.isNotEmpty) {
        setState(() {
          go = true;
          print(go);
        });
      }
      if (F.isNotEmpty) {
        setState(() {
          fa = true;
          print(fa);
        });
      }
      if (E.isNotEmpty) {
        setState(() {
          em = true;
          print(em);
        });
      }
      if (T.isNotEmpty) {
        setState(() {
          tw = true;
          print(tw);
        });
      }
      if (A.isNotEmpty) {
        setState(() {
          ap = true;
          print(ap);
        });
      }

      if (P.isEmpty) {
        setState(() {
          em = true;
         // sendEmailRequest(MainEmail);
        });
      }

    });
  }

  sendEmailRequest(String Email) {
    (() async {
     // await auth.sendPasswordResetEmail(email: Email);
      Fluttertoast.showToast(
          msg: "Please Check your email to Reset your password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInForm()),
      );
    })();
  }

  static SnackBar customSnackBar({String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  @override
  void initState() {
    (() async {
      getData();
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileSwitch(
                value: fa,
                leading: ImageIcon(
                  AssetImage("assets/facebook.png"),
                  size: 50,
                  color: Color(0xFF3A5A98),
                ),
                onChanged: (value) {
                  setState(() {
                    (() async {
                      if (G.isEmpty && E.isEmpty && T.isEmpty && A.isEmpty) {
                        print(G.isEmpty && E.isEmpty && T.isEmpty && A.isEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                              'email': MainEmail,
                              'FacebookEmail': "",
                              'providerId': "password",
                            })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        fa = false;
                      }
                      else if (G.isNotEmpty || E.isNotEmpty || T.isNotEmpty || A.isNotEmpty) {
                        print(G.isNotEmpty ||
                            E.isNotEmpty ||
                            T.isNotEmpty ||
                            A.isNotEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                              'FacebookEmail': "",
                            })
                            .then((value) => print("User email delete"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        fa = false;
                      }
                      if (F.isEmpty) {
                        setState(() {
                          fa = value;
                          Authentication.link(ProviderId,"facebook",context: context);

                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          Authentication.customSnackBar(
                            content: 'Wait to link account by method',
                          ),
                        );
                      }
                    })();
                  });
                },
                switchActiveColor: Colors.orange,
                title: const Text(
                  'Facebook',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                height: 15,
                thickness: 5,
              ),
              ListTileSwitch(
                value: go,
                leading: ImageIcon(
                  AssetImage("assets/google.png"),
                  size: 50,
                  color: Colors.deepOrangeAccent,
                ),
                onChanged: (value) {
                  setState(() {
                    (() async {
                      if (F.isEmpty && E.isEmpty && T.isEmpty && A.isEmpty) {
                        print(F.isEmpty && E.isEmpty && T.isEmpty && A.isEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                          'email': MainEmail,
                          'GoogleEmail': "",
                          'providerId': "password",
                        })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        go = false;
                      }
                      else if (F.isNotEmpty || E.isNotEmpty || T.isNotEmpty || A.isNotEmpty) {
                        print(F.isNotEmpty ||
                            E.isNotEmpty ||
                            T.isNotEmpty ||
                            A.isNotEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                          'GoogleEmail': "",
                        })
                            .then((value) => print("User email delete"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        go = false;
                      }
                      if (G.isEmpty) {
                        setState(() {
                          go = value;
                           Authentication.link(ProviderId,"google",context: context);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          Authentication.customSnackBar(
                            content: 'Wait to link account by method',
                          ),
                        );
                      }
                    })();
                  });
                },
                switchActiveColor: Colors.orange,
                title: const Text(
                  'Google',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                height: 15,
                thickness: 5,
              ),
              ListTileSwitch(
                value: ap,
                leading: ImageIcon(
                  AssetImage("assets/apple.png"),
                  size: 50,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    (() async {

                      if (G.isEmpty && E.isEmpty && T.isEmpty && F.isEmpty) {
                        print(G.isEmpty && E.isEmpty && T.isEmpty && F.isEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                          'email': MainEmail,
                          'AppleEmail': "",
                          'providerId': "password",
                        })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        fa = false;
                      }
                      else if (G.isNotEmpty || E.isNotEmpty || T.isNotEmpty || F.isNotEmpty) {
                        print(G.isNotEmpty ||
                            E.isNotEmpty ||
                            T.isNotEmpty ||
                            F.isNotEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                          'AppleEmail': "",
                        })
                            .then((value) => print("User email delete"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        ap = false;
                      }
                      if (A.isEmpty) {
                        setState(() {
                          ap = value;
                          Authentication.link(ProviderId,"apple",context: context);

                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          Authentication.customSnackBar(
                            content: 'Wait to link account by method',
                          ),
                        );
                      }

                    })();
                  });
                },
                switchActiveColor: Colors.orange,
                title: const Text(
                  'Apple',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                height: 15,
                thickness: 5,
              ),
              ListTileSwitch(
                value: tw,
                leading: ImageIcon(
                  AssetImage("assets/Twitter.png"),
                  size: 50,
                  color: Color(0xFF1DA1F2),
                ),
                onChanged: (value) {
                  setState(() {
                    (() async {

                      if (G.isEmpty && E.isEmpty && F.isEmpty && A.isEmpty) {
                        print(G.isEmpty && E.isEmpty && F.isEmpty && A.isEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                          'email': MainEmail,
                          'TwitterEmail': "",
                          'providerId': "password",
                        })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        tw = false;
                      }
                      else if (G.isNotEmpty || E.isNotEmpty || F.isNotEmpty || A.isNotEmpty) {
                        print(G.isNotEmpty ||
                            E.isNotEmpty ||
                            F.isNotEmpty ||
                            A.isNotEmpty);
                        await usersdatabase
                            .doc("3m4jjjnICBfhLQJxT6x7leOS80H3")
                            .update({
                          'TwitterEmail': "",
                        })
                            .then((value) => print("User email delete"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        tw = false;
                      }

                      if (A.isEmpty) {
                        setState(() {
                          tw = value;
                          Authentication.link(ProviderId,"apple",context: context);

                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          Authentication.customSnackBar(
                            content: 'Wait to link account by method',
                          ),
                        );
                      }
                    })();
                  });
                },
                switchActiveColor: Colors.orange,
                title: const Text(
                  'Twitter',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                height: 15,
                thickness: 5,
              ),
              // todo : hlaw hoon lazem tnshal otseer 2l mainnnnnnnnnnnn o bedooon ma tbayeeen
              ListTileSwitch(
                value: em,
                leading: Icon(
                  EvaIcons.email,
                  size: 50,
                ),
                onChanged: (value) {
                  setState(() {
                    em = value;
                  });
                },
                switchActiveColor: Colors.orange,
                title: const Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),

              Divider(
                height: 15,
                thickness: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
