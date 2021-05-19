import 'package:flutter/material.dart';
class YourData extends StatefulWidget {
  const YourData({Key key}) : super(key: key);

  @override
  _YourDataState createState() => _YourDataState();
}

class _YourDataState extends State<YourData> {
  String Gettext='Data Text'; //to get Data Text from firebase
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        body: ListView(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Image.asset(
                  'assets/YourData.png',
                  fit: BoxFit.scaleDown,
                ),
              ), //contain your data picture
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Your Data, Your Choice ',
                  style: TextStyle(
                      color: Color(0xffF9A559),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ), //contain your data your choice text
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(Gettext,
                        style: TextStyle(
                          fontSize: 13,
                        )),
                  ),
                  //contain text widget to get your data text from firebase
                  Container(
                    width: 351,
                    height: 10,
                    child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Accept',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff566357),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background
                          // foreground
                        )),
                  ),//contain accept button
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                      height: 10,
                      width: 130,
                      child: Image.asset('assets/ActHubPic.png')))//contain ACTHUB text Picture
            ],
          )],
        ),
      ),
    );
  }
}
