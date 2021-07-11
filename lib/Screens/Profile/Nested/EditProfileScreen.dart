import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);
  static const String id = 'EditProfileScreen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
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
            height: allWidth(context)*0.1,
            width:allWidth(context)*0.1,

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
              height:allHeight(context)>allWidth(context) ?
              allHeight(context)*0.88:allWidth(context)*0.8,
              width: allWidth(context)*0.9,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:allHeight(context)*0.01),
                    child:  Stack(
                      alignment:Alignment.bottomLeft,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                allWidth(context)>500
                                    ?allWidth(context)*0.1:
                                allWidth(context)*0.12),
                          ),
                          elevation: 10,
                          child: CircleAvatar(
                            radius:    allWidth(context)>500
                                ?
                            allWidth(context)*0.1:
                            allWidth(context)*0.12,
                            backgroundImage: NetworkImage(
                                'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                          ),
                        ),
                        Container(
                          height: allWidth(context)>500
                              ?allWidth(context)*0.05:allWidth(context)*0.06,
                          width:  allWidth(context)>500?allWidth(context)*0.07:allWidth(context)*0.09,
                          decoration: BoxDecoration(
                              color: Palette.online,
                              shape: BoxShape.circle,
                              border: Border.all(width: 2.0, color: Palette.white)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:allHeight(context)*0.01),
                    child: Container(
                      height:  allHeight(context)>allWidth(context) ?
                      allHeight(context)*0.55:allWidth(context)*0.45,
                      width: allWidth(context)*0.93,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      child: Center(
                        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: allWidth(context)*0.05,),
                              child: Container(
                                height: allHeight(context)*0.06,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration:InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: allWidth(context)*0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'FULL NAME ',
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    hintStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: allWidth(context)*0.03),

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: allHeight(context)*0.01,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: allWidth(context)*0.05,),
                              child: Container(
                                height: allHeight(context)*0.06,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration:InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: allWidth(context)*0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'EMAIL ',
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    hintStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: allWidth(context)*0.03),
                                  ),

                                ),
                              ),
                            ),
                            SizedBox(height: allHeight(context)*0.01,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: allWidth(context)*0.05,),
                              child: Container(
                                height: allHeight(context)*0.06,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration:InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: allWidth(context)*0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'PASSWORD ',
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    hintStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: allWidth(context)*0.03),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: allHeight(context)*0.01,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: allWidth(context)*0.05,),
                              child: Container(
                                height: allHeight(context)*0.06,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: allWidth(context)*0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'BIRTHDAY ',
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    hintStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: allWidth(context)*0.03),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: allHeight(context)*0.01,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: allWidth(context)*0.05,),
                              child: Container(
                                height: allHeight(context)*0.06,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration:  InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: allWidth(context)*0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'COUNTRY ',
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    hintStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: allWidth(context)*0.03),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: allHeight(context)*0.01,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: allWidth(context)*0.05,),
                              child: Container(
                                height: allHeight(context)*0.06,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration:  InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: allWidth(context)*0.03),
                                    hintText: 'What do people call you?',
                                    labelText: 'STATE ',
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    hintStyle:  TextStyle(
                                        color: Colors.black,
                                        fontSize: allWidth(context)*0.03),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:allHeight(context)*0.01),
                    child:    GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(allWidth(context) *0.02),
                        ),
                        elevation: 10,
                        child: Container(
                            width: allWidth(context)*0.73,
                            height: allHeight(context)*0.06,
                            decoration: BoxDecoration(
                              color: Palette.actHubGreen,
                              borderRadius: BorderRadius.all(
                                Radius.circular(allWidth(context) *0.02),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:  EdgeInsets.all(allHeight(context)*0.009),
                                child: AutoSizeText('Save',
                                    style: TextStyle(
                                        fontSize: allWidth(context) *0.056,
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
}