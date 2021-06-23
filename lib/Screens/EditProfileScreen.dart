import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
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

          leading:  Container(
            height: MediaQuery.of(context).size.width*0.1,
            width:MediaQuery.of(context).size.width*0.1,

            child: FittedBox(
              fit: BoxFit.fill,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios,size: 30,color: Palette.actHubGreen.withOpacity(0.33),),
                onPressed: () => Navigator.pop(context),

              ),
            ),
          ),
        ),
        body: SingleChildScrollView(

          child: Center(
            child: Container(
              height:MediaQuery.of(context).size.height>MediaQuery.of(context).size.width ?
              MediaQuery.of(context).size.height*0.88:MediaQuery.of(context).size.width*0.8,
              width: MediaQuery.of(context).size.width*0.9,
              child: Column(


                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                    child:  Stack(
                      alignment:Alignment.bottomLeft,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width>500
                                    ?MediaQuery.of(context).size.width*0.1:
                                MediaQuery.of(context).size.width*0.12),
                          ),
                          elevation: 10,
                          child: CircleAvatar(
                            radius:    MediaQuery.of(context).size.width>500
                                ?
                            MediaQuery.of(context).size.width*0.1:
                            MediaQuery.of(context).size.width*0.12,
                            backgroundImage: NetworkImage(
                                'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width>500
                              ?MediaQuery.of(context).size.width*0.05:MediaQuery.of(context).size.width*0.06,
                          width:  MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width*0.07:MediaQuery.of(context).size.width*0.09,
                          decoration: BoxDecoration(
                              color: Palette.online,
                              shape: BoxShape.circle,
                              border: Border.all(width: 2.0, color: Palette.white)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                    child: Container(
                      height:  MediaQuery.of(context).size.height>MediaQuery.of(context).size.width ?
                    MediaQuery.of(context).size.height*0.55:MediaQuery.of(context).size.width*0.45,
                      width: MediaQuery.of(context).size.width*0.93,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                    child: GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        child: Container(
                            width: MediaQuery.of(context).size.width*0.73,
                            height: MediaQuery.of(context).size.height*0.05,
                            decoration: const BoxDecoration(
                              color: Palette.actHubGreen,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.007),
                                child: AutoSizeText('Save',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.white)),
                              ),
                            )),
                      ),

                    ),
                  ),
                ],
              ),
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
      height:MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
      MediaQuery.of(context).size.width*0.1 :MediaQuery.of(context).size.height*0.1 ,
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