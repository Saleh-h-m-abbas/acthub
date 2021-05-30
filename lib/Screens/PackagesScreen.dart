import 'package:acthub/Classes/Palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key key}) : super(key: key);
  static const String id = 'PackagesScreen';

  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PackagesDesign(),

    );
  }

  Widget PackagesDesign() {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        title: Text('Packaging Offer',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Palette.actHubGreen.withOpacity(0.75),

          ),
        ),
        backgroundColor: Palette.scaffold,
        toolbarHeight: MediaQuery
            .of(context)
            .size
            .height * 0.085,
        centerTitle: true,
        elevation: 7,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
            child: Card(
              elevation: 5,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.32,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.98,
                color: Palette.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Standerd Package',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Palette.orange.withOpacity(0.75),

                        ),
                      ),
                      Text('300\$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Palette.orange,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.27 / 7,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.80,
                          child: ElevatedButton(
                            child: Text('Join',
                              style: TextStyle(
                                fontSize: 20,
                                color: Palette.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Palette.actHubGreen, // background
                              // foreground
                            ),
                            onPressed: () {

                            },

                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 5),
                        child: Row(
                          children: [
                            Icon(Icons.check, color: Palette.orange,),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
            child: Card(
              elevation: 5,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.32,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.98,
                color: Palette.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Standerd Package',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Palette.orange.withOpacity(0.75),

                        ),
                      ),
                      Text('300\$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Palette.orange,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.27 / 7,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.80,
                          child: ElevatedButton(
                            child: Text('Join',
                              style: TextStyle(
                                fontSize: 20,
                                color: Palette.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Palette.actHubGreen, // background
                              // foreground
                            ),
                            onPressed: () {

                            },

                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 5),
                        child: Row(
                          children: [
                            Icon(Icons.check, color: Palette.orange,),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
            child: Card(
              elevation: 5,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.32,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.98,
                color: Palette.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Standerd Package',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Palette.orange.withOpacity(0.75),

                        ),
                      ),
                      Text('300\$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Palette.orange,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.27 / 7,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.80,
                          child: ElevatedButton(
                            child: Text('Join',
                              style: TextStyle(
                                fontSize: 20,
                                color: Palette.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Palette.actHubGreen, // background
                              // foreground
                            ),
                            onPressed: () {

                            },

                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 5),
                        child: Row(
                          children: [
                            Icon(Icons.check, color: Palette.orange,),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 2),
                        child: Row(
                          children: [
                            Icon(Icons.close,
                              color: Palette.actHubGreen.withOpacity(0.33),),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: Text('Access to',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ),
            ),
          ),
          Image.asset('Images/ActHubG.png',
            height: 60,
            width: 40,
          ),
        ],
      ),
    );
  }
}