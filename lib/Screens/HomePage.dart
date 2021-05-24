import 'dart:async';
import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Classes/ShimmerAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    return dataAvailable
        ? WillPopScope(
            onWillPop: () {
              return new Future.value(false);
            },
            child: MaterialApp(
              home: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Palette.scaffold,
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
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // the first list view
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.94,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Image.asset(
                                    'Images/Adv.png',
                                    fit: BoxFit.contain,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.94,
                                  height:
                                  MediaQuery.of(context).size.height * 0.3,
                                  child: Image.asset(
                                    'Images/Adv.png',
                                    fit: BoxFit.contain,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.94,
                                  height:
                                  MediaQuery.of(context).size.height * 0.3,
                                  child: Image.asset(
                                    'Images/Adv.png',
                                    fit: BoxFit.contain,
                                  )),
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
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/outdoor.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Outdoor',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/culture.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Culture',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/education.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Education',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/well.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Wellness',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/outdoor.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Outdoor',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/culture.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Culture',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/education.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Education',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Image.asset(
                                            'Images/well.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          child: Center(
                                              child: Text(
                                            'Wellness',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Palette.white),
                                          ))),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      //the search bar
                      Card(
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
                            ), //decorat input text
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // the 3rd list view
                      Container(
                        height: MediaQuery.of(context).size.width * 0.65,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  'https://www.studentuniverse.com/blog/wp-content/uploads/2019/02/3-day-nola.jpg',
                                                ))),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                      Positioned(
                                          left: 5,
                                          top: 85,
                                          child: Text(
                                            'weekend Trip',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaQU4Bm0cXJvDKldO7wUCeWFy_b8J8pzdIWA&usqp=CAU',
                                              )),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                      Positioned(
                                          left: 5,
                                          top: 85,
                                          child: Text(
                                            'To Nature',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/arms-abs-workout-betina-gozo-1570037480.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*',
                                          )),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    height: MediaQuery.of(context).size.width *
                                        0.65,
                                  ),
                                  Positioned(
                                      left: 5,
                                      top: 216,
                                      child: Text(
                                        "Let's Workout",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  'https://www.studentuniverse.com/blog/wp-content/uploads/2019/02/3-day-nola.jpg',
                                                ))),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                      Positioned(
                                          left: 5,
                                          top: 85,
                                          child: Text(
                                            'weekend Trip',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaQU4Bm0cXJvDKldO7wUCeWFy_b8J8pzdIWA&usqp=CAU',
                                              )),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                      Positioned(
                                          left: 5,
                                          top: 85,
                                          child: Text(
                                            'To Nature',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/arms-abs-workout-betina-gozo-1570037480.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*',
                                          )),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    height: MediaQuery.of(context).size.width *
                                        0.65,
                                  ),
                                  Positioned(
                                      left: 5,
                                      top: 216,
                                      child: Text(
                                        "Let's Workout",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ))
        : ShimmerAnimation().homePageShimmerAnimation(context);
  }
}
