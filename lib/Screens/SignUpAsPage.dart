import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class SignUpAsPage extends StatefulWidget {
  const SignUpAsPage({Key key}) : super(key: key);
  static const String id = 'SignUpAsPage';
  @override
  _SignUpAsPageState createState() => _SignUpAsPageState();
}

class _SignUpAsPageState extends State<SignUpAsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/HeaderLogoB.png',
                fit: BoxFit.scaleDown,
              ),
              SafeArea(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  //onPressed:() => Navigator.pop(context, false),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            child: Image.asset(
              'Images/ActHubG.png',

            ),
          ),


        ],
      ),
    );
  }
}
