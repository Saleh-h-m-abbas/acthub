import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width*0.85  ;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height >MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
}


class SearchPage extends StatefulWidget {
  static const String id = 'SearchPage';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isGuest=false;
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
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: allWidth(context),
                    child: AppBar(
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
                              'Search',
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
                            height:allHeight(context) * 0.06,
                            width: allWidth(context) * 0.87,
                            child: TextField(
                              cursorWidth: 2,
                              cursorHeight:
                                 allHeight(context) * 0.03,
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
