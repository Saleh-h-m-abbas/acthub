import 'dart:math';

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
      home: Scaffold(
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,

              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  PackagesDesign('Standerd Package','300\$'),
                  PackagesDesign('Standerd Package','300\$'),
                  PackagesDesign('Standerd Package','300\$'),
                  Image.asset('Images/ActHubG.png',
                    height: 60,
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      )

    );
  }

  Widget PackagesDesign(String packageName, String price) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      elevation: 5,
      child: Container(

          height: MediaQuery
              .of(context)
              .size
              .height * 0.34,

          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(packageName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Palette.orange.withOpacity(0.75),

                  ),
                ),
                Text(price,
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
                        .height * 0.27 / 6,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.78,
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
                  padding: const EdgeInsets.only(top: 3),
                  child: packageInformation('Access to', Icons.check_rounded),
                ),
                 packageInformation('Access to', Icons.check_rounded),
                 packageInformation('Access to', Icons.check_rounded),
                 packageInformation('Access to', Icons.close),
                 packageInformation('Access to', Icons.close),
              ],
            ),
          ),


      ),
    );
  }
  Widget packageInformation(String access, IconData icon){
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 3),
      child: Row(
        children: [
          Icon(icon,
            color: Palette.actHubGreen.withOpacity(0.33),),
          Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: Text(access,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

}