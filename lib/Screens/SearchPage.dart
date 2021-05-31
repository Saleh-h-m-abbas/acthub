import 'package:acthub/Classes/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SearchPage extends StatefulWidget {
  static const String id = 'SearchPage';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 5;
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Palette.scaffold,
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Palette.actHubGreen,
                  ),
                  onPressed: () => Navigator.pop(context)),
              centerTitle: false,
              toolbarHeight: 60,
              elevation: 0,
              backgroundColor: Palette.scaffold,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search',
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
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Hero(
                        tag: 'search',
                        child: Card(
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
