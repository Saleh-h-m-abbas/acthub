import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class LinkAccountPage extends StatefulWidget {
  const LinkAccountPage({Key key}) : super(key: key);

  @override
  _LinkAccountPageState createState() => _LinkAccountPageState();
}

class _LinkAccountPageState extends State<LinkAccountPage> {
  bool test =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            ListTileSwitch(
              value: test,
              leading: const ImageIcon(
                AssetImage("assets/facebook.png"),
                size: 50,
                color: Color(0xFF3A5A98),
              ),
              onChanged: (value) {
                setState(() {
                  test = value;
                });
              },
              switchActiveColor: Colors.orange,
              title: const Text('Facebook', style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16.0,
                color: Colors.black,
              ),
              ),
            ),
            Divider(height:15,thickness: 5,),
            ListTileSwitch(
              value: test,
              leading: ImageIcon(
                AssetImage("assets/google.png"),
                size: 50,
                color: Colors.deepOrangeAccent,
              ),
              onChanged: (value) {
                setState(() {
                  test = value;
                });
              },
              switchActiveColor: Colors.orange,
              title: const Text('Google', style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16.0,
                color: Colors.black,
              ),
              ),
            ),
            Divider(height:15,thickness: 5,),
            ListTileSwitch(
              value: test,
              leading: ImageIcon(
                AssetImage("assets/apple.png"),
                size: 50,
                color: Colors.black,
              ),
              onChanged: (value) {
                setState(() {
                  test = value;
                });
              },
              switchActiveColor: Colors.orange,
              title: const Text('Apple', style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16.0,
                color: Colors.black,
              ),
              ),
            ),
            Divider(height:15,thickness: 5,),
            ListTileSwitch(
              value: test,
              leading: ImageIcon(
                AssetImage("assets/Twitter.png"),
                size: 50,
                color: Color(0xFF1DA1F2),
              ),
              onChanged: (value) {
                setState(() {
                  test = value;
                });
              },
              switchActiveColor: Colors.orange,
              title: const Text('Twitter', style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16.0,
                color: Colors.black,
              ),
              ),
            ),
            Divider(height:15,thickness: 5,),
            ListTileSwitch(
              value: test,
              leading: Icon(EvaIcons.email,size: 50,),
              onChanged: (value) {
                setState(() {
                  test = value;
                });
              },
              switchActiveColor: Colors.orange,
              title: const Text('Email', style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16.0,
                color: Colors.black,
              ),
              ),
            ),
            Divider(height:15,thickness: 5,),
          ],
        ),
      ),
    );
  }
}