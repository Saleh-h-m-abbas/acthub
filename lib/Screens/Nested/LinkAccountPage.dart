import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Classes/custom_form_field.dart';
import 'package:acthub/Classes/validator.dart';
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
      MainEmail = "",
      ProviderId = "";
  CollectionReference usersdatabase =
      FirebaseFirestore.instance.collection('users');
  String _email;
  final TextEditingController _emailController = TextEditingController();

  final auth = FirebaseAuth.instance;
  void getData() async {
    await firestoreInstance
        .collection("users")
        .doc("4sMasxJxApX2eLexAqfnQHrpxaV2")
        .get()
        .then((value) {
      print("google :" + value.data()["GoogleEmail"]);
      print("facebook :" + value.data()["FacebookEmail"]);
      print("email :" + value.data()["email"]);
      //print("twiter :"+value.data()["TwitterEmail"]);
      print("pass :" + value.data()["password"]);
      print("provider :" + value.data()["providerId"]);
      print("main :" + value.data()["MainEmail"]);

      G = value.data()["GoogleEmail"];
      F = value.data()["FacebookEmail"];
      E = value.data()["email"];
      T = value.data()["TwitterEmail"];
      P = value.data()["password"];
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
      // if (T.isNotEmpty) {
      //   setState(() {
      //     tw = true;
      //     print(tw);
      //   });
      // }
      if (P.isNotEmpty) {
        setState(() {
          pa = true;
          print(pa);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'please reset your password',
          ),
        );
        _showMyDialog();
      }
    });
  }

  _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Password'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  label: 'Email',
                  hint: 'Enter your Email',
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                      ),
                      child: Text(
                        'Send Request',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        if (_emailController.text.isNotEmpty  || _emailController.text.length != 0) {
                        setState(() {
                          (() async {


                         try{
                           await  auth.sendPasswordResetEmail(email: _emailController.text);
                           Fluttertoast.showToast(
                               msg: "Please Check your email to Reset your password",
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.BOTTOM,
                               timeInSecForIosWeb: 1,
                               backgroundColor: Colors.red,
                               textColor: Colors.white,
                               fontSize: 16.0
                           );
                         }
                         on FirebaseAuthException catch (e) {
                           if (e.code == 'The email address is badly formatted') {
                             Fluttertoast.showToast(
                                 msg: "The email address is badly formatted",
                                 toastLength: Toast.LENGTH_SHORT,
                                 gravity: ToastGravity.BOTTOM,
                                 timeInSecForIosWeb: 1,
                                 backgroundColor: Colors.red,
                                 textColor: Colors.white,
                                 fontSize: 16.0
                             );
                           }
                         } catch (e) {
                           ScaffoldMessenger.of(context).showSnackBar(
                             Authentication.customSnackBar(
                               content: 'The email address is badly formatted',
                             ),
                           );
                         }
                          })();
                          });
                       }
                        else if (_emailController.text.isEmpty  || _emailController.text.length == 0) {
                            setState(() {
                              Fluttertoast.showToast(
                                  msg: "Please Fill Email",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            });
                          }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                    fa = value;
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
                      if (F == "" && E == "") {
                        print(F == "" && E == "");
                        await usersdatabase
                            .doc("4sMasxJxApX2eLexAqfnQHrpxaV2")
                            .update({
                              'email': MainEmail,
                              'GoogleEmail': "",
                              'providerId': "password",
                            })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        go = false;
                      } else {
                        setState(() {
                          go = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          Authentication.customSnackBar(
                            content: 'Wait to link account',
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
                    ap = value;
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
                    tw = value;
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
