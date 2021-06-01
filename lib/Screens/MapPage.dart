import 'dart:async';

import 'package:acthub/Classes/Palette.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);
  static const String id = 'MapPage';

  @override
  _MapPageState createState() => _MapPageState();
}

bool showCard = false;

class _MapPageState extends State<MapPage> {
  bool showSearchBar = true;
  String searchAddress = '';

  GoogleMapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showCard = false;
  }

  Future onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    Marker blueMarker = Marker(
        markerId: MarkerId('bluehill'),
        position: LatLng(40.732128, -73.999619),
        infoWindow: InfoWindow(title: 'Blue Hill'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ),
        onTap: () {
          setState(() {
            showCard = true;
            showSearchBar = false;
          });
        });
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Palette.scaffold,
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(40.712776, -74.005974), zoom: 12),
                    onMapCreated: onMapCreated,
                    markers: {blueMarker},
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
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 20.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Discover',
                                  style: TextStyle(
                                      shadows: [
                                        Shadow(
                                            blurRadius: 15,
                                            color:
                                                Colors.black.withOpacity(0.35),
                                            offset: Offset(5, 5))
                                      ],
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.orange),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 65.0),
                                    child: Text(
                                      'Near You',
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              blurRadius: 10,
                                              color: Colors.black
                                                  .withOpacity(0.35),
                                              offset: Offset(5, 5))
                                        ],
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.orange,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 52.0, top: 25.5),
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
                    // showSearchBar
                    //     ? PlacePicker(
                    //         apiKey: 'AIzaSyCr7e5y2ZzJdTJDkovlkJIeLu3g_4Z5K9M',
                    //         // initialPosition: MapPage.kInitialPosition,
                    //         useCurrentLocation: true,
                    //         selectInitialPosition: true,
                    //
                    //         //usePlaceDetailSearch: true,
                    //         onPlacePicked: (result) {
                    //           var selectedPlace = result;
                    //           Navigator.of(context).pop();
                    //           setState(() {});
                    //         },
                    //         forceSearchOnZoomChanged: true,
                    //         automaticallyImplyAppBarLeading: false,
                    //         autocompleteLanguage: "ko",
                    //         region: 'au',
                    //
                    //         selectedPlaceWidgetBuilder:
                    //             (_, selectedPlace, state, isSearchBarFocused) {
                    //           print(
                    //               "state: $state, isSearchBarFocused: $isSearchBarFocused");
                    //           return isSearchBarFocused
                    //               ? Container()
                    //               : FloatingCard(
                    //                   bottomPosition:
                    //                       0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                    //                   leftPosition: 0.0,
                    //                   rightPosition: 0.0,
                    //                   width: 500,
                    //                   borderRadius: BorderRadius.circular(12.0),
                    //                   child: state == SearchingState.Searching
                    //                       ? Center(
                    //                           child:
                    //                               CircularProgressIndicator())
                    //                       : RaisedButton(
                    //                           child: Text("Pick Here"),
                    //                           onPressed: () {
                    //                             // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                    //                             //            this will override default 'Select here' Button.
                    //                             print(
                    //                                 "do something with [selectedPlace] data");
                    //                             Navigator.of(context).pop();
                    //                           },
                    //                         ),
                    //                 );
                    //         },
                    //         pinBuilder: (context, state) {
                    //           if (state == PinState.Idle) {
                    //             return Icon(Icons.favorite_border);
                    //           } else {
                    //             return Icon(Icons.favorite);
                    //           }
                    //         },
                    //       ):
                    Container(),
                  ],
                ),
                showCard ? _buildContainer() : Container()
              ],
            ),
          ),
        ));
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

              ),
              width: MediaQuery.of(context).size.width * 0.98,
              height: MediaQuery.of(context).size.height * 0.23,
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
