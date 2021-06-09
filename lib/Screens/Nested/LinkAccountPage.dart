import 'package:acthub/Classes/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class LinkAccountPage extends StatefulWidget {
  const LinkAccountPage({Key key}) : super(key: key);

  @override
  _LinkAccountPageState createState() => _LinkAccountPageState();
}

class _LinkAccountPageState extends State<LinkAccountPage> {
  bool go = false ,fa = false, tw= false, pa= false, em= false, ap = false;
  final firestoreInstance = FirebaseFirestore.instance;
  String G="", F="", T="", E="", P = "",ProviderId="";

  void getData() async{
   await firestoreInstance
        .collection("users")
        .doc("4sMasxJxApX2eLexAqfnQHrpxaV2")
        .get()
        .then((value) {
      print(value.data()["GoogleEmail"]);
      print(value.data()["FacebookEmail"]);
      print(value.data()["email"]);
      print(value.data()["TwitterEmail"]);
      print(value.data()["password"]);
      print(value.data()["providerId"]);

      G = value.data()["GoogleEmail"];
      F = value.data()["FacebookEmail"];
      E = value.data()["email"];
      T = value.data()["TwitterEmail"];
      P = value.data()["password"];
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
      if (P.isNotEmpty) {
        setState(() {
          pa = true;
          print(pa);
        });
      }
    });
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
    return
    Scaffold(
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
                      if(ProviderId =="google.com")
                      {
                        go = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          Authentication.customSnackBar(
                            content:
                            'The account already exists with a different credential',
                          ),
                        );

                      }
                      else
                      {
                      go = value;
                      }
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
