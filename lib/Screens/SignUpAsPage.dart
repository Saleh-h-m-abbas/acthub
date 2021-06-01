import 'package:auto_size_text/auto_size_text.dart';
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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              //container for the continue as
              height: 28.5,
              width: 343,

              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Continue as ',
                  style: TextStyle(
                      color: Color(0xff566357).withOpacity(0.6),
                      fontSize: 20,
                      fontFamily: 'Segoe UI'),
                ),
              ),
            ),
            Padding(
              //Divider line
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Divider(color: Color(0xffF9A559), thickness: 1.0),
            ),

            UserCard(context,'serviceProvider'),
            UserCard(context,'advertiser'),
            UserCard(context,'user'),

          ],
        ),
        SafeArea(
          child: Container(
            width: 200,
            child: Image.asset(
              'Images/ActHubG.png',
            ),
          ),
        ),
      ]),
    );
  }

  GestureDetector UserCard(BuildContext context,String user) {
    return GestureDetector(
            onDoubleTap: () {},
            child: Container(
              height: MediaQuery.of(context).size.height*0.19,
              width: MediaQuery.of(context).size.width*0.85,
              child: Stack(
                children: [
                  Column(
                    children: [
                    SizedBox(height:MediaQuery.of(context).size.height*0.025),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.125,
                          width: MediaQuery.of(context).size.width*0.85,
                          child: Padding(
                            padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04,left:MediaQuery.of(context).size.width*0.04,right: MediaQuery.of(context).size.width*0.04 ),
                            child: Center(
                              child: AutoSizeText(
                                'as service provider, you have the right to add your services and offers about your trip, and you can get offer from us for long terms ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                   ),

                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                   left:MediaQuery.of(context).size.width*0.04 ,
                    child: Image.asset(
                      'Images/$user.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width*0.77,

                    ),


                  ),
                ],
              ),
            ),
          );
  }
}
