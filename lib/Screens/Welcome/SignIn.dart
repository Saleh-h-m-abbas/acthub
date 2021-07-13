import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/NavigationPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:acthub/Api/translation_widget.dart';

class SignIn extends StatefulWidget {
  static const String id = 'SignIn';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  messageWidget(translatedMessage) {
    String data="hi";
    TranslationWidget(
        message: translatedMessage,
        builder: (newText) {
          setState(() {
            data = newText;
            print(newText);
           print("-----------");
            print(data);
          });
          return Text(
            newText,
            style: TextStyle(color: Colors.black),
          );
        });
     //print(data);
     return data;
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('$provider Button Pressed!'),
          backgroundColor: Colors.black26,
          duration: Duration(milliseconds: 400),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'Images/HeaderLogo1.png',
            height: MediaQuery.of(context).size.height*0.35,
            width:MediaQuery.of(context).size.width ,
            fit: BoxFit.fill,
          ),

          Text(messageWidget("hi")),

        TranslationWidget(
            message: "hi",
            builder: (newText) {
              return Text(
                newText,
                style: TextStyle(color: Colors.black),
              );
            }),

          Container(
            height: MediaQuery.of(context).size.height*0.07,
            width: MediaQuery.of(context).size.width*0.55,
            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.025,
            ),
            child: AutoSizeText(
              "Welcome To",
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Color(0xff566357).withOpacity(0.8)),

            ),
          ),
          Container(
              height:MediaQuery.of(context).size.height*0.06,
              child: Image.asset('Images/finalLogoo.png',fit: BoxFit.contain,),),
          Container(
            height: MediaQuery.of(context).size.height*0.05,
            width: MediaQuery.of(context).size.width*0.6,
            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.015,
            ),
            child: AutoSizeText(
              messageWidget("Login for full enjoyable experience."),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              maxLines: 1,
              style: TextStyle(color:Colors.black,fontSize: 18),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.025,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.85,
            height:MediaQuery.of(context).size.height*0.05,
            child: SignInButton(
              Buttons.Google,
              onPressed: () {
                _showButtonPressDialog(context, 'Google');
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.85,
            height:MediaQuery.of(context).size.height*0.05,
            child: SignInButton(

              Buttons.Apple,
              onPressed: () {
                _showButtonPressDialog(context, 'Apple');
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.85,
            height:MediaQuery.of(context).size.height*0.05,
            child: SignInButton(
              Buttons.FacebookNew,

              onPressed: () {
                _showButtonPressDialog(context, 'FacebookNew');
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.85,
            height:MediaQuery.of(context).size.height*0.05,
            child: SignInButtonBuilder(
              text: 'Sign in By Email',

              icon: Icons.email,
              onPressed: () {
                _showButtonPressDialog(context, 'Email');
              },
              backgroundColor: Colors.orange[300],
              width: 220.0,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width:MediaQuery.of(context).size.width*0.38,
                    child: Divider(color: Palette.actHubGreen,thickness: 1,)),
                AutoSizeText(
                  'Or',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 16.0,
                    color: Palette.actHubGreen,
                  ),
                ),
                Container(
                    width:MediaQuery.of(context).size.width*0.38,
                    child: Divider(color: Palette.actHubGreen,thickness: 1,)),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.85,
            height:MediaQuery.of(context).size.height*0.05,
            child: SignInButtonBuilder(
              text: 'Join Us As A Guest',
              onPressed: () async {
                final SharedPreferences prefs = await _prefs;
                prefs.setBool("Guest", true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavigationPage()));
              },

              backgroundColor: Palette.actHubGreen.withOpacity(0.42),


            ),
          ),
        ],
      ),
    );
  }
}
