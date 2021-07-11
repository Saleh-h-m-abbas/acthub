import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/Welcome/YourData.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class EnableLocation extends StatefulWidget {
  static const String id = 'EnableLocation';

  @override
  _EnableLocationState createState() => _EnableLocationState();
}

class _EnableLocationState extends State<EnableLocation> {
  String getText =
      'ActHub gets your location for you to get better experience while using the app , however you can adjust your , location settings at any time.'; //variable to get location text from firebase
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  sharedData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("NotFirstTime", true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedData();
    _requestPermissions();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
          home: Scaffold(
            backgroundColor: Color(0xffEFEFEF),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'Images/Location.png',

                    ), // contain enable location picture
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.0125,
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: AutoSizeText(
                        getText,
                        textAlign: TextAlign.center,
                        style: TextStyle(wordSpacing: 0.1, fontSize: 20),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.055,
                      child: ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            child: AutoSizeText('Enable Location',
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Palette.actHubGreen,
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
                    ), //contain text widget to get location text from firebase
                    //contain the button
                    Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.asset(
                          'Images/ActHubOLogo.png',
                          fit: BoxFit.contain,
                        )),
                    //contain ACTHUB text logo
                  ],
                )
            ),
          ),
        ));
  }

  void currency() {
    Locale locale = Localizations.localeOf(context);
    print(locale.toString());
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    print("CURRENCY NAME ${format.currencyName}"); // USD
  }

  getLocation() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("EnableLocation", true);
    LocationPermission permission = await Geolocator.requestPermission();
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission1 = await Geolocator.checkPermission();
    print(permission);
    print(permission1);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position.longitude);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    print(coordinates);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    if (isLocationServiceEnabled == true) {
      currency();
      print('Accepted');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => YourData()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => YourData()));
    }
  }
}
