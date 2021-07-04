import 'dart:async';

import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);
  static const String id = 'MapPage';

  @override
  _MapPageState createState() => _MapPageState();
}

bool showCard = false;
bool isGuest =false;

double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
}

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

            body: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: LatLng(40.712776, -74.005974), zoom: 12),
                          onMapCreated: onMapCreated,
                          markers: {blueMarker},
                        ),
                      ),
                      SafeArea(
                        child: Column(
                          children: [
                            Container(
                              width: allWidth(context),
                              child: AppBar(
                                centerTitle: false,
                                elevation: 0,
                                toolbarHeight: allHeight(context) * 0.06,
                          backgroundColor: Colors.white.withOpacity(0.00),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: allHeight(context) * 0.03,
                                      width: allHeight(context) * 0.7,
                                      child: AutoSizeText(
                                        'Discover',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.orange),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: allHeight(context) * 0.05),
                                      child: AutoSizeText(
                                        'Near You',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Palette.orange
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  isGuest
                                      ?
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right:    allHeight(context) * 0.053,
                                        top: allHeight(context) * 0.01),
                                    child: CircleAvatar(
                                      radius: allWidth(context) * 0.0603,
                                      backgroundImage:
                                      AssetImage("Images/gusetProfilepic.png"),
                                      backgroundColor: Palette.white,
                                    ),
                                  )
                                      : Padding(
                                    padding: EdgeInsets.only(
                                        right:  allHeight(context) * 0.053,
                                        top: allHeight(context) * 0.01),
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: allHeight(context) * 0.03,
                                          backgroundImage: NetworkImage(
                                              'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                                        ),
                                        Positioned(
                                            top: allHeight(context) * 0.032,
                                            left: 0,
                                            child: Container(
                                              height:
                                              allHeight(context) * 0.018,
                                              width:
                                              allHeight(context) * 0.018,
                                              decoration: BoxDecoration(
                                                  color: Palette.online,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width:
                                                      allHeight(context) *
                                                          0.003,
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
                      ),
                      showCard ? _buildContainer() : Container()
                    ],
                  );
                }
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
                      'https://www.travelanddestinations.com/wp-content/uploads/2020/12/Cappadocia-landscape-and-balloons.jpg',
                    )),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),

              ),
              width: MediaQuery.of(context).size.width>500? MediaQuery.of(context).size.width*0.99: MediaQuery.of(context).size.width * 0.98,
              height: MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.height * 0.3:MediaQuery.of(context).size.height * 0.23,
            ),
            Positioned(
                left:MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width*0.04: MediaQuery.of(context).size.width*0.045,
                top: MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.height * 0.23: MediaQuery.of(context).size.height * 0.16,
                child: Container(
                  height:MediaQuery.of(context).size.height * 0.04 ,
                  width: MediaQuery.of(context).size.width*0.35 ,
                  child: AutoSizeText(
                    'weekend Trip',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
