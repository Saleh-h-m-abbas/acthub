import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'Palette.dart';

class ShimmerAnimation {
  Widget homePageShimmerAnimation(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Palette.scaffold,
          appBar: AppBar(
            centerTitle: false,
            toolbarHeight: 60,
            elevation: 0,
            backgroundColor: Palette.scaffold,
            title: Shimmer.fromColors(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Palette.actHubGreen.withOpacity(0.35),
                    height: 32,
                    width: 113,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 5),
                      child: Container(
                        color: Palette.actHubGreen.withOpacity(0.35),
                        height: 13,
                        width: 110,
                      ))
                ],
              ),
              baseColor: Palette.actHubGreen,
              highlightColor: Colors.white,
            ),
            actions: [
              Shimmer.fromColors(
                child: Padding(
                  padding: const EdgeInsets.only(right: 52.0, top: 10.5),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Palette.actHubGreen.withOpacity(0.35),
                      ),
                      Positioned(
                          top: 35,
                          left: 0,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Palette.actHubGreen.withOpacity(0.35),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.0, color: Palette.white)),
                          ))
                    ],
                  ),
                ),
                baseColor: Palette.actHubGreen,
                highlightColor: Colors.white,
              )
            ],
          ),
          body: Shimmer.fromColors(
            baseColor: Palette.actHubGreen.withOpacity(0.35),
            highlightColor: Colors.white,
            child: Column(
              children: [
                // the first list view
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.22,
                          color: Palette.actHubGreen.withOpacity(0.35),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.22,
                        color: Palette.actHubGreen.withOpacity(0.35),
                      ),
                    ],
                  ),
                ),
                //the second list view
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  color: Palette.actHubGreen.withOpacity(0.35),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    color:
                                        Palette.actHubGreen.withOpacity(0.35),
                                  )),
                            ],
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  color: Palette.actHubGreen.withOpacity(0.35),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    color:
                                        Palette.actHubGreen.withOpacity(0.35),
                                  )),
                            ],
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  color: Palette.actHubGreen.withOpacity(0.35),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    color:
                                        Palette.actHubGreen.withOpacity(0.35),
                                  )),
                            ],
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  color: Palette.actHubGreen.withOpacity(0.35),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    color:
                                        Palette.actHubGreen.withOpacity(0.35),
                                  )),
                            ],
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  color: Palette.actHubGreen.withOpacity(0.35),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  color: Palette.actHubGreen.withOpacity(0.35),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                // //the search bar
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Palette.actHubGreen,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.87,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // the 3rd list view
                Container(
                  height: MediaQuery.of(context).size.width * 0.65,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Palette.actHubGreen,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Palette.actHubGreen,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.42,
                                height: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Palette.actHubGreen,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.width * 0.65,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Palette.actHubGreen,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Palette.actHubGreen,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaQU4Bm0cXJvDKldO7wUCeWFy_b8J8pzdIWA&usqp=CAU',
                                    )),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Palette.actHubGreen,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.width * 0.65,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
