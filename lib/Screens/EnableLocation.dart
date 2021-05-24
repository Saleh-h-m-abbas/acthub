import 'package:acthub/Screens/YourData.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class EnableLocation extends StatefulWidget {
  static const String id = 'EnableLocation';

  @override
  _EnableLocationState createState() => _EnableLocationState();
}

class _EnableLocationState extends State<EnableLocation> {
  String Gettext = 'locationText'; //variable to get location text from firebase

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'Images/Location.png',
              fit: BoxFit.cover,
            ),
            // contain enable location picture
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                Gettext,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            //contain text widget to get location text from firebase
            Column(
              children: [
                Container(
                  width: 351,
                  height: 46,
                  child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Enable Location',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff566357),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      onPressed: () {
                        getLocation();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // background
                        // foreground
                      )),
                ),
              ],
            ),
            //contain the button
            SafeArea(
              child: Container(
                  height: 50,
                  width: 130,
                  child: Image.asset('Images/ActHubOLogo.png')),
            )
            //contain ACTHUB text logo
          ],
        ),
      ),
    );
  }

  getLocation() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => YourData()));
  }
}
