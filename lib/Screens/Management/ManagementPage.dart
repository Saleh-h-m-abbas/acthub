import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/ActivityPage.dart';
import 'package:acthub/Screens/Welcome/SignIn.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key key}) : super(key: key);
  static const String id = 'ManagementPage';

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  bool isGuest = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
            home: Scaffold(
          backgroundColor: Palette.scaffold,
          appBar: isGuest
              ? AppBar(
                  centerTitle: false,
                  toolbarHeight: MediaQuery.of(context).size.height * 0.074,
                  elevation: 0,
                  backgroundColor: Palette.scaffold,
                  title: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: AutoSizeText(
                      'Management',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Palette.orange),
                      maxLines: 1,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.15,
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.06,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('Images/gusetProfilepic.png'),
                        ),
                      ),
                    )
                  ],
                )
              : AppBar(
                  centerTitle: false,
                  toolbarHeight: MediaQuery.of(context).size.height * 0.074,
                  elevation: 0,
                  backgroundColor: Palette.scaffold,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: AutoSizeText(
                          'Saved', // name of activity
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Palette.orange),
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.024,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: AutoSizeText(
                            'activites', //name of main category
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
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.15,
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundImage: NetworkImage(
                                  'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width > 500
                                ? MediaQuery.of(context).size.width * 0.025
                                : MediaQuery.of(context).size.width * 0.033,
                            width: MediaQuery.of(context).size.width > 500
                                ? MediaQuery.of(context).size.width * 0.025
                                : MediaQuery.of(context).size.width * 0.033,
                            decoration: BoxDecoration(
                                color: Palette.online,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.0, color: Palette.white)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
          body: isGuest ? guestPage() : userPage(),
        )));
  }

  Widget guestPage() {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.02),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.78,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.02)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.025,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: AutoSizeText(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Palette.orange),
                    maxLines: 1,
                  ),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: AutoSizeText(
                        'Sgined in first to access this feature.',
                        //name of main category
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Palette.actHubGreen.withOpacity(0.35),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                    Image.asset(
                      'Images/human.png',
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.766,
                        height: MediaQuery.of(context).size.height * 0.059,
                        child: AutoSizeText(
                          "you haven't signed in yet. please sign in to manage your activity in application.",
                          style: TextStyle(
                            fontSize: 19,
                            color: Palette.actHubGreen.withOpacity(0.50),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: 15.0,
                          right: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.766,
                        height: MediaQuery.of(context).size.height * 0.054,
                        child: ElevatedButton(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                              child: AutoSizeText(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                            ), //to style the text of buttons
                            style: ElevatedButton.styleFrom(
                                primary: Palette.blue // background
                                // foreground
                                ), //to set the color of buttons
                            onPressed: () {
                              Navigator.pushNamed(context, SignIn.id);
                            }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget userPage() {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            userPageDesign(
                'https://www.routesnorth.com/wp-content/uploads/2019/04/kjerag-boulder.jpg'),
            userPageDesign(
                'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,g_xy_center,h_800,q_50,w_640,x_576,y_183/v1/clients/texas/ritaarias17_instagram_5053966003_68c2771e-bece-4fe0-81d5-59ac10ef4622.jpg'),
            userPageDesign(
                'https://www.routesnorth.com/wp-content/uploads/2019/04/kjerag-boulder.jpg'),
            userPageDesign(
                'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,g_xy_center,h_800,q_50,w_640,x_576,y_183/v1/clients/texas/ritaarias17_instagram_5053966003_68c2771e-bece-4fe0-81d5-59ac10ef4622.jpg'),
            userPageDesign(
                'https://www.routesnorth.com/wp-content/uploads/2019/04/kjerag-boulder.jpg'),
            userPageDesign(
                'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,g_xy_center,h_800,q_50,w_640,x_576,y_183/v1/clients/texas/ritaarias17_instagram_5053966003_68c2771e-bece-4fe0-81d5-59ac10ef4622.jpg'),
          ],
        ),
      ),
    );
  }

  Widget userPageDesign(String imgURL) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ActivityPage.id);
      },
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(
                      MediaQuery.of(context).size.height * 0.02)),
                  child: Image.network(
                    imgURL,
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: SvgPicture.asset(
                      'Images/like.svg',
                      height: MediaQuery.of(context).size.height * 0.027,
                      color: Palette.orange,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.027,
              width: MediaQuery.of(context).size.width * 0.227,
              child: Center(
                child: AutoSizeText(
                  'Hiking Tour',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.35),
                          offset: Offset(5, 5))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
