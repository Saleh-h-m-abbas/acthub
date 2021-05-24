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
            Padding(
              padding: EdgeInsets.only(right: 28.0, left: 28.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 3,
                child: GestureDetector(
                  onDoubleTap: () {},
                  child: Stack(children: [
                    Center(
                      child: Image.asset(
                        'Images/serviceProvider.png',
                        width: 318,
                        height: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Center(
                        child: Text(
                          'Server provide text \n Server\n Server',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Segoe UI'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 28.0, left: 28.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 3,
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(children: [
                    Center(
                      child: Image.asset(
                        'Images/advertiser.png',
                        width: 318,
                        height: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Center(
                        child: Text(
                          'Advertiser text \n Advertiser text \n Advertiser text \n ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Segoe UI'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 28.0, left: 28.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 3,
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(children: [
                    Center(
                      child: Image.asset(
                        'Images/user.png',
                        width: 318,
                        height: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Center(
                        child: Text(
                          'user text \n user text \n user text',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Segoe UI'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
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
}
