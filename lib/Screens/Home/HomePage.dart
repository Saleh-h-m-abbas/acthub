import 'dart:async';

import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Classes/ShimmerAnimation.dart';
import 'package:acthub/Screens/ActivityPage.dart';
import 'package:acthub/Screens/Home/Nested/SearchPage.dart';
import 'package:acthub/Screens/Home/Nested/SubCategoryPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/getwidget.dart';

import '../Management/ManagementPage.dart';

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

  bool isGuest = false;
  bool isLandScape = false;

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
            resizeToAvoidBottomInset: false,
            backgroundColor: Palette.scaffold,
            body: dataAvailable
                ? portraitLayout(context)
                //:ShimmerAll(context),
                : ShimmerAnimation().homePageShimmerAnimation(context),
          ),
        ));
    // return dataAvailable
  }

  Widget CetegoryWidget(BuildContext context, String Category, String Url,
      {void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        child: GFImageOverlay(
          width: MediaQuery.of(context).size.width * 0.22,
          height: MediaQuery.of(context).size.height * 0.15,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Center(
              child: AutoSizeText(
                Category,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Palette.white),
              ),
            ),
          ),
          boxFit: BoxFit.fill,
          image: AssetImage(Url),
        ),
      ),
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

  Widget Adv_example_card(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: Container(
        width: isLandScape
            ? MediaQuery.of(context).size.width * 0.45
            : MediaQuery.of(context).size.width * 0.9,
        height: isLandScape
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.height * 0.22,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://res.cloudinary.com/wnotw/images/c_limit,w_1536,q_auto:eco,f_auto/v1599167759/lbge2rxuxi5z0wowkkjh/popeyes-rebrand',
              )),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget landscapeLayout(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: AppBar(
                  centerTitle: false,
                  elevation: 0,
                  toolbarHeight: MediaQuery.of(context).size.height * 0.15,
                  backgroundColor: Palette.scaffold,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: AutoSizeText(
                          'Home',
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
                            left: MediaQuery.of(context).size.width * 0.04),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.27,
                          child: AutoSizeText(
                            'Have a nice day',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 20,
                              color: Palette.actHubGreen.withOpacity(0.35),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  actions: [
                    isGuest
                        ? Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.01,
                                top: MediaQuery.of(context).size.height * 0.01),
                            child: CircleAvatar(
                              radius:
                                  MediaQuery.of(context).size.width * 0.0603,
                              backgroundImage:
                                  AssetImage("Images/gusetProfilepic.png"),
                              backgroundColor: Palette.white,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.01,
                                top: MediaQuery.of(context).size.height * 0.01),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width *
                                      0.0603,
                                  backgroundImage: NetworkImage(
                                      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                                ),
                                Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.1,
                                    left: MediaQuery.of(context).size.width *
                                        0.005,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width: MediaQuery.of(context).size.width *
                                          0.034,
                                      decoration: BoxDecoration(
                                          color: Palette.online,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.003,
                                              color: Palette.white)),
                                    ))
                              ],
                            ),
                          )
                  ],
                ),
              ),
              //the second list view
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.0193,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.0193),
                    children: [
                      CetegoryWidget(context, "Outdoor", "Images/outDoor.jpg",
                          onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, SubCategoryPage.id);
                        });
                      }),
                      CetegoryWidget(context, "Culture", "Images/culture.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(
                          context, "Education", "Images/education.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(context, "Wellness", "Images/wellness.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(
                          context, "Gastronomy", "Images/gastronomy.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(
                          context, "Online", "Images/online-study.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder:
                        (BuildContext context, int section, int index) {
                      return Adv_example_card(context);
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.4,

                      viewportFraction: 1.0,
                      disableCenter: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      // autoPlay: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
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
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        cursorWidth: 2,
                        cursorHeight: MediaQuery.of(context).size.height * 0.03,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Palette.actHubGreen.withOpacity(0.33),
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
                          ), //to set the color of hint black
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SearchPage.id);
                        }, //decorat input text
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.018,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isGuest
                            ? Navigator.pushNamed(context, ManagementPage.id)
                            : Navigator.pushNamed(context, ActivityPage.id);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height * 0.51 +
                              MediaQuery.of(context).size.width * 0.25),
                      child: StaggeredGridView.countBuilder(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 4,
                        itemCount: 13,
                        itemBuilder: (BuildContext context, int index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: GFImageOverlay(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height * 0.51 +
                                    MediaQuery.of(context).size.width * 0.25),
                            borderRadius: BorderRadius.circular(20.0),
                            child: AutoSizeText(
                              '  ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.white),
                            ),
                            boxFit: BoxFit.fitHeight,
                            image: NetworkImage(
                                "https://www.travelanddestinations.com/wp-content/uploads/2020/12/Cappadocia-landscape-and-balloons.jpg"),
                          ),
                        ),
                        staggeredTileBuilder: (int index) => index % 3 == 0
                            ? StaggeredTile.count(4, 2.5)
                            : StaggeredTile.count(2, 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget portraitLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: AppBar(
            centerTitle: false,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: Palette.scaffold,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: AutoSizeText(
                    'Home',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Palette.orange),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  child: AutoSizeText(
                    'Have a nice day',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 14,
                      color: Palette.actHubGreen.withOpacity(0.35),
                    ),
                  ),
                )
              ],
            ),
            actions: [
              isGuest
                  ? Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.0603,
                        backgroundImage:
                            AssetImage("Images/gusetProfilepic.png"),
                        backgroundColor: Palette.white,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.05,
                            backgroundImage: NetworkImage(
                                'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                          ),
                          Positioned(
                              top: MediaQuery.of(context).size.height * 0.032,
                              left: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.018,
                                width:
                                    MediaQuery.of(context).size.width * 0.034,
                                decoration: BoxDecoration(
                                    color: Palette.online,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.0045,
                                        color: Palette.white)),
                              ))
                        ],
                      ),
                    )
            ],
          ),
        ),
        Expanded(
            flex: 15,
            child: Container(
                child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder:
                        (BuildContext context, int section, int index) {
                      return Adv_example_card(context);
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.2,
                      viewportFraction: 1.0,
                      disableCenter: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      // autoPlay: false,
                    ),
                  ),
                ),
                //the second list view
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.0193,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.0193),
                    children: [
                      CetegoryWidget(context, "Outdoor", "Images/outDoor.jpg",
                          onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, SubCategoryPage.id);
                        });
                      }),
                      CetegoryWidget(context, "Culture", "Images/culture.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(
                          context, "Education", "Images/education.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(context, "Wellness", "Images/wellness.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(
                          context, "Gastronomy", "Images/gastronomy.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                      CetegoryWidget(
                          context, "Online", "Images/online-study.jpg",
                          onTap: () {
                        Navigator.pushNamed(context, SubCategoryPage.id);
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.015,
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
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: TextField(
                        cursorWidth: 2,
                        cursorHeight: MediaQuery.of(context).size.height * 0.03,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Palette.actHubGreen.withOpacity(0.33),
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
                          ), //to set the color of hint black
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SearchPage.id);
                        }, //decorat input text
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isGuest
                            ? Navigator.pushNamed(context, ManagementPage.id)
                            : Navigator.pushNamed(context, ActivityPage.id);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height * 0.51 +
                              MediaQuery.of(context).size.width * 0.25),
                      child: StaggeredGridView.countBuilder(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 4,
                        itemCount: 13,
                        itemBuilder: (BuildContext context, int index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: GFImageOverlay(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height * 0.51 +
                                    MediaQuery.of(context).size.width * 0.25),
                            borderRadius: BorderRadius.circular(20.0),
                            child: AutoSizeText(
                              '  ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.white),
                            ),
                            boxFit: BoxFit.fitHeight,
                            image: NetworkImage(
                                "https://www.travelanddestinations.com/wp-content/uploads/2020/12/Cappadocia-landscape-and-balloons.jpg"),
                          ),
                        ),
                        staggeredTileBuilder: (int index) => index % 3 == 0
                            ? StaggeredTile.count(4, 2.5)
                            : StaggeredTile.count(2, 3),
                      ),
                    ),
                  ),
                ),
              ],
            ))),
      ],
    );
  }

  Widget landscapeLayout2(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: AppBar(
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            backgroundColor: Palette.scaffold,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: AutoSizeText(
                    'Home',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Palette.orange),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: AutoSizeText(
                      'Have a nice day',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 14,
                        color: Palette.actHubGreen.withOpacity(0.35),
                      ),
                    ),
                  ),
                )
              ],
            ),
            actions: [
              isGuest
                  ? Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.0603,
                        backgroundImage:
                            AssetImage("Images/gusetProfilepic.png"),
                        backgroundColor: Palette.white,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.0603,
                            backgroundImage: NetworkImage(
                                'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                          ),
                          Positioned(
                              top: MediaQuery.of(context).size.height * 0.052,
                              left: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.018,
                                width:
                                    MediaQuery.of(context).size.width * 0.034,
                                decoration: BoxDecoration(
                                    color: Palette.online,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.0045,
                                        color: Palette.white)),
                              ))
                        ],
                      ),
                    )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                children: [
                  CetegoryWidget(context, "Outdoor", "Images/outdoor.png",
                      onTap: () {
                    Navigator.pushNamed(context, SubCategoryPage.id);
                  }),
                  SizedBox(
                    width: 5,
                  ),
                  CetegoryWidget(context, "Culturetrr", "Images/culture.png",
                      onTap: () {
                    Navigator.pushNamed(context, SubCategoryPage.id);
                  }),
                  SizedBox(
                    width: 5,
                  ),
                  CetegoryWidget(context, "Outdoor", "Images/education.png",
                      onTap: () {
                    Navigator.pushNamed(context, SubCategoryPage.id);
                  }),
                  SizedBox(
                    width: 5,
                  ),
                  CetegoryWidget(context, "Culture", "Images/well.png",
                      onTap: () {
                    Navigator.pushNamed(context, SubCategoryPage.id);
                  }),
                  SizedBox(
                    width: 5,
                  ),
                  CetegoryWidget(context, "Outdoor", "Images/outdoor.png",
                      onTap: () {
                    Navigator.pushNamed(context, SubCategoryPage.id);
                  }),
                  SizedBox(
                    width: 5,
                  ),
                  CetegoryWidget(context, "Culture", "Images/culture.png",
                      onTap: () {
                    Navigator.pushNamed(context, SubCategoryPage.id);
                  }),
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
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.87,
              child: TextField(
                cursorWidth: 2,
                cursorHeight: MediaQuery.of(context).size.height * 0.03,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Palette.orange,
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
                  ), //to set the color of hint black
                ),
                onTap: () {
                  Navigator.pushNamed(context, SearchPage.id);
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
            height: MediaQuery.of(context).size.height * .37,
            width: MediaQuery.of(context).size.width,
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 4,
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 5,
                child: Image.asset(
                  'Images/ActHubOLogo.png',
                  fit: BoxFit.fill,
                ),
              ),
              staggeredTileBuilder: (int index) => index % 3 == 0
                  ? StaggeredTile.count(4, 2.5)
                  : StaggeredTile.count(2, 3),
              mainAxisSpacing: 10,
              crossAxisSpacing: 12,
            ),
          ),
        ),
      ],
    ));
  }
}
