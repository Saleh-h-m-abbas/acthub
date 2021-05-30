import 'package:acthub/Screens/YourData.dart';
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
  String Gettext = 'locationText'; //variable to get location text from firebase
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
