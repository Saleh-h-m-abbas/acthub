import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/Welcome/SignIn.dart';
import 'package:acthub/Screens/Welcome/SignUpAsPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Image.asset(
                  'Images/HeaderLogoB.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.26,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.07,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ), //contain headerlogo and arrow back icon
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child:
                      textFiled('Username', TextInputType.emailAddress, false),
                ),
                textFiled('Password', TextInputType.visiblePassword, true),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01,
                      top: MediaQuery.of(context).size.height * 0.04),
                  child:
                  buttons('Login', Palette.actHubGreen, () {}),
                ),
                buttons("Don't have an account?", Palette.orange, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpAsPage()));
                }),
              ],
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset(
                  'Images/ActHubG.png',
                  fit: BoxFit.contain,
                )), //contain acthubpic
          ],
        ),
      ),
    );
  }

  Widget textFiled(String inputType, TextInputType keyboardType, bool obscure) {
    //inputType => to set the type of textfiled username or password
    //keyboardType  => to set the type of textInputType emailAddress or password
    //obscure => to hide the password
    return Container(
      width: MediaQuery.of(context).size.width * 0.78,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.white, //color of container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 3),
          ) //to add shadow for text filed
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: TextField(
        obscureText: obscure,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        //to choose keboardtype
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ), //to put border color white when the textfiled not clicked
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ), //to set border color grey when the textfiled clicked
          labelText: inputType,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.height * 0.025,
          ), //to set the color of hint black
        ), //decorat input text
      ),
    );
  } //function of textfiled

  Widget buttons(String buttonText, Color color, Function onPress) {
    //buttonText => String to set the text of the buttons
    //color=> to set the color of the buttons
    //onpress => function onpressed to set onpressed button function
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.height * 0.009,
          ),
          child: AutoSizeText(buttonText,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              )),
        ), //to style the text of buttons
        style: ElevatedButton.styleFrom(
          primary: color, // background
          // foreground
        ), //to set the color of buttons
        onPressed: onPress,
      ),
    );
  }
} //
