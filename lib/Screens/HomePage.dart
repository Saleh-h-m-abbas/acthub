import 'dart:async';

import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Classes/ShimmerAnimation.dart';
import 'package:acthub/Screens/SearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dataAvailable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataAvailable = false;
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
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
          home: Scaffold(
            backgroundColor: Palette.white,
            appBar: AppBar(
              centerTitle: false,
              toolbarHeight: 60,
              elevation: 0,
              backgroundColor: Palette.scaffold,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Palette.orange),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Have a nice day',
                      style: TextStyle(
                        fontSize: 14,
                        color: Palette.actHubGreen.withOpacity(0.35),
                      ),
                    ),
                  )
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 52.0, top: 10.5),
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
                                    width: 2.0, color: Palette.white)),
                          ))
                    ],
                  ),
                )
              ],
            ),
            body: SafeArea(
                child: dataAvailable
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            /*      GFShimmer(
                                showShimmerEffect: true,
                                mainColor: Colors.white,
                                secondaryColor: GFColors.LIGHT,
                                child: Shimmer(context)),*/
                            // the first list view
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                children: [
                                  Adv_example_card(context),
                                  Adv_example_card(context),
                                  Adv_example_card(context),
                                  Adv_example_card(context),
                                ],
                              ),
                            ),
                            //the second list view
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    children: [
                                      CetegoryWidget(context, "Outdoor",
                                          "Images/outdoor.png"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CetegoryWidget(context, "Culturetrr",
                                          "Images/culture.png"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CetegoryWidget(context, "Outdoor",
                                          "Images/education.png"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CetegoryWidget(context, "Culture",
                                          "Images/well.png"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CetegoryWidget(context, "Outdoor",
                                          "Images/outdoor.png"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CetegoryWidget(context, "Culture",
                                          "Images/culture.png"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // the search bar
                            Hero(
                              tag: 'search',
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Palette.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.87,
                                  child: TextField(
                                    cursorWidth: 2,
                                    cursorHeight:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: Palette.orange,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      //to put border color white when the textfiled not clicked
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      //to set border color grey when the textfiled clicked
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ), //to set the color of hint black
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, SearchPage.id);
                                    }, //decorat input text
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 270,
                                width: double.infinity,
                                child: StaggeredGridView.countBuilder(
                                  scrollDirection: Axis.horizontal,
                                  crossAxisCount: 4,
                                  itemCount: 13,
                                  itemBuilder:
                                      (BuildContext context, int index) => Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    elevation: 5,
                                    child: Image.asset(
                                      'Images/ActHubOLogo.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  staggeredTileBuilder: (int index) =>
                                      index % 3 == 0
                                          ? StaggeredTile.count(4, 2.5)
                                          : StaggeredTile.count(2, 3),
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    //:ShimmerAll(context),
                    : ShimmerAnimation().homePageShimmerAnimation(context)),
          ),
        ));
    // return dataAvailable
  }

  GFImageOverlay CetegoryWidget(
      BuildContext context, String Category, String Url) {
    return GFImageOverlay(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(15.0),
      borderRadius: BorderRadius.circular(10),
      child: Center(
        child: Text(
          Category,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Palette.white),
        ),
      ),
      image: AssetImage(Url),
      colorFilter:
          new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
    );
  }

  GFImageOverlay CetegoryWidget1(BuildContext context) {
    return GFImageOverlay(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(20.0),
      borderRadius: BorderRadius.circular(10),
      colorFilter:
          new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
    );
  }

  Padding Adv_example_card(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.22,
            child: Image.asset(
              'Images/ActHubOLogo.png',
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
