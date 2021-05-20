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
      body: Container(
        height:MediaQuery.of(context).size.height,
        child: Column(
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
                  onPressed: () => Navigator.pop(context),
                )),
              ],
            ), //contain headerlogo and arrow back icon
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 20),
                  child: textFiled('Username', TextInputType.emailAddress, false),
                ),
                //contain textfiled for user name
                textFiled('Password', TextInputType.visiblePassword, true),
                //text filed for password
                Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 20),
                  child: buttons('Login', Palette.actHubGreen, () {}),
                ),
                //contain the button of log in
                buttons("Don't have an account?", Palette.orange, () {}),
                //button for dont have an account
              ],
            ), //column of text fileds and buttons
            Padding(
                padding: EdgeInsets.only(top: 80),
             child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Image.asset(
                  'Images/ActHubG.png',
                ),
              ),) //contain acthubpic
          ],
        ),
      ),
    );
  }
}

Widget textFiled(String inputType, TextInputType keyboardType, bool obscure) {
  //inputType => to set the type of textfiled username or password
  //keyboardType  => to set the type of textInputType emailAddress or password
  //obscure => to hide the password
  return Container(
    width: 351,
    height: 45,
    decoration: BoxDecoration(color: Colors.white, //color of container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 3),
          ) //to add shadow for text filed
        ]),
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
          borderSide: BorderSide(color: Colors.grey),
        ), //to set border color grey when the textfiled clicked
        labelText: inputType,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 19,
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
    width: 318,
    height: 35,
    child: ElevatedButton(
      child: Text(buttonText,
          style: TextStyle(
            fontSize: 19,
            color: Colors.white,
            //fontWeight: FontWeight.bold,
          )), //to style the text of buttons
      style: ElevatedButton.styleFrom(
        primary: color, // background
        // foreground
      ), //to set the color of buttons
      onPressed: onPress,
    ),
  );
} // function of log in and dont have account buttons
