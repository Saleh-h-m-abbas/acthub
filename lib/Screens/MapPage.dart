import 'dart:async';

import 'package:acthub/Classes/GeoLocation.dart';
import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Classes/ShimmerAnimation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);
  static const String id = 'MapPage';

  @override
  _MapPageState createState() => _MapPageState();
}
bool showCard=false;
class _MapPageState extends State<MapPage> {
  var dataAvailable = false;
  bool showSearchBar = true;
  String searchAddress = '';

  GoogleMapController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showCard=false;
  }
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () => {
          setState(() {
            dataAvailable = true;
          })
        });
    Marker blueMarker = Marker(
        markerId: MarkerId('bluehill'),
        position: LatLng(40.732128, -73.999619),
        infoWindow: InfoWindow(title: 'Blue Hill'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,

        ),
        onTap: (){
          setState(() {
            showCard=true;
            showSearchBar = false;
          });
        }
    );
    return dataAvailable
        ? WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Palette.scaffold,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(

                      mapType: MapType.terrain,
                      initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
                      onMapCreated: (GoogleMapController controller) {
                        _controller=controller;
                      },
                      markers: {
                        blueMarker
                      },
                      onTap: (val){
                        setState(() {
                          showSearchBar = true;
                          showCard = false;
                        });
                      },
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 17.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Discover',
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              blurRadius: 10,
                                              color:Colors.black.withOpacity(0.35),
                                              offset: Offset(5,5)
                                          )
                                        ],
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.orange),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 65.0),
                                      child: Text(
                                        'Near You',
                                        style: TextStyle( shadows: [
                                          Shadow(
                                              blurRadius: 10,
                                              color:Colors.black.withOpacity(0.35),
                                              offset: Offset(5,5)
                                          )
                                        ],
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.orange,

                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 52.0, top: 10.5),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                        'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                                  ),
                                  Positioned(
                                      top: 35,
                                      left: 0,
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: Palette.online,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2.0,
                                                color: Palette.white)),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      showSearchBar?Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 10,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.87,
                          child: TextField(
                            cursorWidth: 2,
                            cursorHeight:
                            MediaQuery.of(context).size.height * 0.03,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0.6),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: Palette.orange,

                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              //to put border color white when the textfiled not clicked
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              //to set border color grey when the textfiled clicked
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                              //to set the color of hint black
                            ), //decorat input text
                          ),
                        ),
                      ): Container(),
                    ],
                  ),
                  showCard?_buildContainer():Container()

                ],
              ),
            ),

          ),
        ))
        : ShimmerAnimation().MapPageShimmerAnimation(context);


  }

  // functions

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaQU4Bm0cXJvDKldO7wUCeWFy_b8J8pzdIWA&usqp=CAU',
                    )),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              width:
              MediaQuery.of(context).size.width * 0.98,
              height:
              MediaQuery.of(context).size.height * 0.23,
            ),

            Positioned(
                left: 15,
                top: 145,
                child: Text(
                  'weekend Trip',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

}