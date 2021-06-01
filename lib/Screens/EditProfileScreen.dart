import 'package:acthub/Classes/Palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);
  static const String id = 'EditProfileScreen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Palette.scaffold,
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: Palette.scaffold,
          title: Text(
            'Edit Profile',
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Palette.orange),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only( top: 30),
                  child:  Stack(
                    children: [
                      Material(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'
                          ),


                        ),
                        elevation: 15,
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                      ),
                      Positioned(
                          top: 85,
                          left: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Palette.online,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.0, color: Palette.white)),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.55,
                    width: MediaQuery.of(context).size.width*0.93,

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    child: Column(
                      children: [
                        textFeild('FULL NAME',false,TextInputType.name),
                        textFeild('EMAIL', false, TextInputType.emailAddress),
                        textFeild('PASSWORD', true, TextInputType.visiblePassword),
                        textFeild('BIRTHDAY', false, TextInputType.datetime),
                        textFeild('COUNTRY', false, TextInputType.name),
                        textFeild('STATE', false, TextInputType.name),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
  Widget textFeild(String labelText,bool obscureText,TextInputType keyboardType){
    TextEditingController controller=new TextEditingController();
    return Container(
      width:MediaQuery.of(context).size.width*0.70,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: TextField(
          obscureText: obscureText,
          obscuringCharacter: '*',
          keyboardType: keyboardType,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            labelText: labelText,
            hintText: controller.text.trim(),
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            labelStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
          ),

        ),
      ),
    );
  }
}