import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class NotificationPage extends StatefulWidget {
  static const String id = 'NotificationPage';

  @override
  _NotificationPageState createState() => _NotificationPageState();
}
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
}


class _NotificationPageState extends State<NotificationPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String UserType;

  getStringSharedPreferance() {
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        prefs.getString("UserType");
        UserType =prefs.getString("UserType");
        print(UserType);
      })();
    });
  }

@override
  void initState() {
  getStringSharedPreferance();
  super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
            home: Scaffold(
              backgroundColor: Palette.scaffold,
              body:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              'Notification',
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
                        UserType=="4"
                            ?
                        Padding(
                          padding: EdgeInsets.only(
                              right:allHeight(context) * 0.053,
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
                      Container(
                    width: allWidth(context)*0.9,
                    height: allHeight(context)*0.76,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom:allHeight(context)*0.01),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(allHeight(context)*0.02),
                                  ),
                                  elevation: 5,
                                  child: Container(
                                    height: allHeight(context)*0.09,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(allHeight(context)*0.02)),
                                    child:Row(
                                      children: [
                                        SizedBox(width: allHeight(context)*0.01,),
                                        index.isEven?
                                        Card(
                                          elevation:5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(allHeight(context) * 0.03),
                                          ),
                                          child: CircleAvatar(
                                            radius: allHeight(context) * 0.03,
                                            child:
                                            Image.asset("Images/logoYV.png",),

                                            backgroundColor: Palette.white,
                                          ),
                                        )
                                            :
                                        Card(
                                          elevation:5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(allHeight(context) * 0.03),
                                          ),
                                          child: CircleAvatar(
                                            radius: allHeight(context) * 0.03,
                                            backgroundImage: NetworkImage(
                                                'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                                            backgroundColor: Palette.white,
                                          ),
                                        ),
                                        SizedBox(width: allHeight(context)*0.01,),
                                        Padding(
                                          padding:  EdgeInsets.all(allHeight(context)*0.01,),
                                          child: Container(
                                            height: allHeight(context)*0.15,
                                            width:allWidth(context)*0.6,
                                            child: Center(
                                              child: AutoSizeText(
                                                'You Have some trips near you , check them now! ',
                                                textAlign: TextAlign.start,
                                                maxLines: 3,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Palette.actHubGreen,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                      },
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}
