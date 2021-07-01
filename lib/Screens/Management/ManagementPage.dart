import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/ActivityPage.dart';
import 'package:acthub/Screens/Welcome/SignIn.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
bool isGuest=false;
class ManagementPage extends StatefulWidget {
  const ManagementPage({Key key}) : super(key: key);
  static const String id = 'ManagementPage';

  @override
  _ManagementPageState createState() => _ManagementPageState();
}
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width*0.85;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
          home: userPage()
        ));
  }
  Widget guestPage() {
    return Scaffold(
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
                'Management',
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Palette.orange),
              ),
            ),

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
      body: Padding(
        padding: EdgeInsets.only(top:allHeight(context)*0.01, left: allWidth(context)*0.01
            ,bottom: allWidth(context)*0.01,right: allWidth(context)*0.01),
        child: SingleChildScrollView(
          child: Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(allWidth(context)*0.05),
              ),
              child: Container(
                height: allHeight(context) *0.78 ,
                width: allWidth(context),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(allWidth(context)*0.05)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: allWidth(context)*0.05, top: allHeight(context)*0.02),
                      child: Container(
                        height: allHeight(context)*0.05,
                        width: allWidth(context)*0.3,
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
                        children: [
                          SizedBox(
                            height: allHeight(context)*0.01,
                          ),
                          Container(
                            width: allWidth(context),
                            child: Container(
                              height: allHeight(context)*0.05,
                              width: allWidth(context),

                              child: Center(
                                child: AutoSizeText(
                                  'Sgined in first to access this feature.',
                                  //name of main category
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen.withOpacity(0.35),
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'Images/human.png',
                            height: allHeight(context) * 0.45,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: allHeight(context)*0.01),
                            child: Container(
                              width: allWidth(context),
                              height: allHeight(context)*0.059,
                              child: Center(
                                child: AutoSizeText(
                                  "you haven't signed in yet. please sign in\n to manage your activity in application.",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Palette.actHubGreen.withOpacity(0.50),
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: allHeight(context)*0.05,left: allWidth(context)*0.01,right: allWidth(context)*0.01),
                            child: Container(
                              width: allWidth(context)*0.766,
                              height: allHeight(context)*0.054,
                              child: ElevatedButton(
                                  child: AutoSizeText('Sign in',
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,), //to style the text of buttons
                                  style: ElevatedButton.styleFrom(
                                      primary: Palette.blue// background
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
          ),
        ),

      ),
    );

  }
  Widget userPage() {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar:AppBar(
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
                'User',
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
                'Activity Page',
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
      body: Padding(
        padding: EdgeInsets.all(allWidth(context)*0.025),
        child: Center(
          child: Container(
            height: allHeight(context),
            width: allWidth(context),
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
        ),
      ),
    );
  }
  Widget userPageDesign(String imgURL) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ActivityPage.id);
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: allHeight(context)*0.015),
          child: Container(
            height: allHeight(context) * 0.1,
            width: allWidth(context) * 0.85,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: allHeight(context) * 0.1,
                  width: allWidth(context) * 0.85,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(17.0)),
                      child: Image.network(
                        imgURL,
                        fit: BoxFit.cover,
                      )),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        'Images/Like.svg',
                        height: allHeight(context)*0.027,
                        color: Palette.orange,
                      ),

                    ),
                    Container(
                      height: allHeight(context)*0.07,
                      width: allWidth(context)*0.7,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Hiking Tour',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 18,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget serviceProviderPage(){
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar:  AppBar(
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
              'Guide',
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
              'Your Management',
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
      body: Padding(
        padding: EdgeInsets.only(left: allWidth(context)*0.018, top: allHeight(context)*0.05),
        child: SingleChildScrollView(

          child: Center(
            child: Column(

              children: [
                mainActivitiesContainer(),
                SizedBox(height: allHeight(context)*0.01,),
                activitiesContainer('Rejected','https://www.cbmcint.com/wp-content/uploads/2016/01/February-22-MM-option-one.jpg'),
                SizedBox(height: allHeight(context)*0.01,),
                activitiesContainer('Pending','https://simplifyingfamily.com/wp-content/uploads/2013/07/Summer-activities-for-families.jpg.webp'),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget mainActivitiesContainer(){
    return Container(
      height: allHeight(context)*0.3,
      width: allWidth(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return index==
              0?
          Container(
            height: allHeight(context)*0.3,
            width: allWidth(context)*0.2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Container(
                height: allHeight(context)*0.03,
                width: allWidth(context)*0.3,

                child: AutoSizeText(
                  'Accepted',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Palette.actHubGreen,
                  ),
                ),
              ),
            ),
          ):
          Container(
    height: allHeight(context)*0.3,
    width: allWidth(context)*0.782,
    child: Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
    height: allHeight(context)*0.3,
    width: allWidth(context)*0.234,
    decoration: BoxDecoration(
    image: DecorationImage(
    fit: BoxFit.fill,
    image: NetworkImage(
    'https://2e2kda1m9pm41j3ob93smm8e-wpengine.netdna-ssl.com/wp-content/upload/ymprod/iStock_000019173217_Double.jpg',
    )),
    color: Colors.white, borderRadius: BorderRadius.circular(15)),
    ),
    )
    );
        },
      ),
    );
  }
  Widget activitiesContainer(String type,String imgURL){
    return Container(
      height: allHeight(context)*0.2,
      width: allWidth(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return index==
              0?
          Container(
            height: allHeight(context)*0.2,
            width: allWidth(context)*0.2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Container(
                height: allHeight(context)*0.03,
                width: allWidth(context)*0.3,

                child: AutoSizeText(
                  type,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Palette.actHubGreen,
                  ),
                ),
              ),
            ),
          ):
          Container(
            height: allHeight(context)*0.3,
            width: allWidth(context)*0.782,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(

                height: allHeight(context)*0.25,
                width: allWidth(context)*0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          imgURL,
                        )),
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
              ),
            ),
          );
        },

      ),
    );
  }
}