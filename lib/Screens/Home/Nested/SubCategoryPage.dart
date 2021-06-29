import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
}
class SubCategoryPage extends StatefulWidget {
  static const String id = 'SubCategoryPage';

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}
class _SubCategoryPageState extends State<SubCategoryPage> {
  bool isGuest = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Palette.scaffold,
              appBar: AppBar(
                centerTitle: false,
                elevation: 0,
                toolbarHeight: allHeight(context) * 0.06,
                backgroundColor: Palette.scaffold,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: allHeight(context) * 0.03,
                      width: allHeight(context) * 0.4,
                      child: AutoSizeText(
                        'Discover',
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
                          left: allHeight(context) * 0.035),
                      child: AutoSizeText(
                        'Outdoor Activity',
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
              body: MediaQuery.of(context).size.width>500?SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.007),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.66,
                        width: MediaQuery.of(context).size.width,

                        child: Main_Category_Card(
                            context,
                            "Hiking Tour",
                            "Unlock your full potential with our hiking tour." +
                                "Explore the best hiking sights with us!!"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.007),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Sub_Category_Card(context, 'Hiking'),
                            Sub_Category_Card(context, 'Hiking'),
                          ],
                        ),

                      ),
                    ),

                  ],
                ),
              ):Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.007),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.37,
                      width: MediaQuery.of(context).size.width,

                      child: Main_Category_Card(
                          context,
                          "Hiking Tour",
                          "Unlock your full potential with our hiking tour." +
                              "Explore the best hiking sights with us!!"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.007),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Sub_Category_Card(context, 'Hiking'),
                          Sub_Category_Card(context, 'Hiking'),
                        ],
                      ),

                    ),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
  Widget Main_Category_Card(
      BuildContext context, String category, String description) {
    return  MediaQuery.of(context).size.width>500?
    CarouselSlider.builder(
        itemCount: 3,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 1.5,
          enlargeCenterPage:false,
        ),
        itemBuilder: (context, index, realIdx) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://www.rei.com/dam/vagnini_181016_2024_hiking_beginners_hero_lg.jpg',
                        )),
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.66,
                  width: MediaQuery.of(context).size.width,

                ),
                Positioned(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.45,
                  left: MediaQuery
                      .of(context)
                      .size
                      .width * 0.04,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.4,
                        child: AutoSizeText(
                          '$category',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(5, 5),
                                  blurRadius: 3.0,
                                  color: Palette.actHubGrey,
                                )
                              ],
                              fontSize:18),
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.55,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: AutoSizeText(
                          '$description',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 3.0,
                                color: Palette.actHubGrey,
                              )
                            ],
                            fontSize: 15,
                          ),
                          minFontSize: 12,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    ):CarouselSlider.builder(
        itemCount: 3,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 1.5,
          enlargeCenterPage:false,
        ),
        itemBuilder: (context, index, realIdx) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://www.rei.com/dam/vagnini_181016_2024_hiking_beginners_hero_lg.jpg',
                        )),
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                  ),

                ),
                Positioned(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.22,
                  left: MediaQuery
                      .of(context)
                      .size
                      .width * 0.04,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.045,
                        width: MediaQuery.of(context).size.width*0.4,
                        child: AutoSizeText(
                          '$category',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(5, 5),
                                  blurRadius: 3.0,
                                  color: Palette.actHubGrey,
                                )
                              ],
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.7,
                        height: MediaQuery.of(context).size.height*0.07,
                        child: AutoSizeText(
                          '$description',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          minFontSize: 12,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
  Widget Sub_Category_Card(BuildContext context, String subCategory) {
    return MediaQuery.of(context).size.width>500?Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            crossAxisSpacing:MediaQuery.of(context).size.width*0.002,
            mainAxisSpacing: 0),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://static1.evcdn.net/images/reduction/1544352_w-360_h-360_q-70_m-crop.jpg',
                    )),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Center(
                child: AutoSizeText(
                  '$subCategory',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(5, 5),
                          blurRadius: 3.0,
                          color: Palette.actHubGrey,
                        )
                      ],
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontSize: 20),
                ),

              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://static1.evcdn.net/images/reduction/1544352_w-360_h-360_q-70_m-crop.jpg',
                    )),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Center(
                child: AutoSizeText(
                  '$subCategory',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(5, 5),
                          blurRadius: 3.0,
                          color: Palette.actHubGrey,
                        )
                      ],
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),

              ),
            ),
          ),
        ],

      ),
    )
    // Container(
    //   width: MediaQuery.of(context).size.width,
    //   child: Align(
    //     alignment:Alignment.center,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Stack(
    //           children: [
    //             Card(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20.0),
    //               ),
    //               elevation: 5,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       fit: BoxFit.fill,
    //                       image: NetworkImage(
    //                         'https://static1.evcdn.net/images/reduction/1544352_w-360_h-360_q-70_m-crop.jpg',
    //                       )),
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(17),
    //                   ),
    //                 ),
    //                 width: MediaQuery.of(context).size.width * 0.4,
    //                 height: MediaQuery.of(context).size.height * 0.25,
    //               ),
    //             ),
    //             Container(
    //               child: Center(
    //                 child: Container(
    //                   height: MediaQuery.of(context).size.height*0.045,
    //                   width: MediaQuery.of(context).size.width*0.4,
    //                   child: AutoSizeText(
    //                     '$subCategory',
    //                     textAlign: TextAlign.center,
    //                     overflow: TextOverflow.visible,
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                         fontSize: 20),
    //                   ),
    //                 ),
    //               ),
    //               width: MediaQuery.of(context).size.width * 0.45,
    //               height: MediaQuery.of(context).size.height * 0.19,
    //             ),
    //           ],
    //         ),
    //         Stack(
    //           children: [
    //             Card(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20.0),
    //               ),
    //               elevation: 5,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       fit: BoxFit.fill,
    //                       image: NetworkImage(
    //                         'https://static1.evcdn.net/images/reduction/1544352_w-360_h-360_q-70_m-crop.jpg',
    //                       )),
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(17),
    //                   ),
    //                 ),
    //                 width: MediaQuery.of(context).size.width * 0.4,
    //                 height: MediaQuery.of(context).size.height * 0.25,
    //               ),
    //             ),
    //             Container(
    //               child: Center(
    //                 child: Container(
    //                   height: MediaQuery.of(context).size.height*0.045,
    //                   width: MediaQuery.of(context).size.width*0.4,
    //                   child: AutoSizeText(
    //                     '$subCategory',
    //                     textAlign: TextAlign.center,
    //                     overflow: TextOverflow.visible,
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                         fontSize: 20),
    //                   ),
    //                 ),
    //               ),
    //               width: MediaQuery.of(context).size.width * 0.45,
    //               height: MediaQuery.of(context).size.height * 0.19,
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // )
        :Container(
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment:Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://static1.evcdn.net/images/reduction/1544352_w-360_h-360_q-70_m-crop.jpg',
                          )),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.19,
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.045,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: AutoSizeText(
                        '$subCategory',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
              ],
            ),
            Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://static1.evcdn.net/images/reduction/1544352_w-360_h-360_q-70_m-crop.jpg',
                          )),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.19,
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.045,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: AutoSizeText(
                        '$subCategory',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}