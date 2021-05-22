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
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Padding(
            padding: EdgeInsets.only(top: 60, left: 23),
            child: Container(
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
          ),
          Padding(
            //Divider line
            padding: EdgeInsets.only(right: 30, left: 30),
            child: Divider(color: Color(0xffF9A559), thickness: 1.0),
          ),
          Column(//Column contains 3 Columns
              children: [
            //Column for service provider
            Column(
              // Center(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 28.0, left: 28.0),
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
                )
              ],
            ),
            SizedBox(height: 10),
            //Column for Advertiser
            Column(
              // Center(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 28.0, left: 28),
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
                )
              ],
            ),
            SizedBox(height: 10),

            //Column for user
            Column(
              // Center(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 28.0, left: 28.0),
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
                )
              ],
            ),
          ]),
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      'Images/ActHubG.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
