import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:acthub/Classes/Palette.dart';
class LogInPage extends StatefulWidget {
  const LogInPage({Key key}) : super(key: key);
  static const String id = 'LogInPage';

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
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
