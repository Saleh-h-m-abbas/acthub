import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/Profile/Nested/AboutUsScreen.dart';
import 'package:acthub/Screens/Profile/Nested/ActLink.dart';
import 'package:acthub/Screens/Profile/Nested/BillingPage.dart';
import 'package:acthub/Screens/Profile/Nested/CurrencyPage.dart';
import 'package:acthub/Screens/Profile/Nested/EditProfileScreen.dart';
import 'package:acthub/Screens/Profile/Nested/SelectLanguage.dart';
import 'package:acthub/Screens/Welcome/LogInPage.dart';
import 'package:acthub/Screens/Welcome/PrivacyPolicy.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
}

class ProfilePage extends StatefulWidget {
  static const String id = 'ProfilePageTest';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget CardTestList(BuildContext context1, var index) {
    if (index == 0) {
      return buttonCard(
          context1, "Billing", "Images/billing.png", BillingPage());
    }
    if (index == 1) {
      return infoCard(context1,
          imape_Path:
          'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg');
    }
    if (index == 2) {
      return buttonCard(
          context1, "Language", "Images/language.png", SelectLanguage());
    }
    if (index == 3) {
      return buttonCard(
          context1, "Edit Profile", "Images/edit.png", EditProfileScreen());
    }
    if (index == 4) {
      return buttonCard(context1, "Act Link", "Images/link.png", ActLink());
    }
    if (index == 5) {
      return horizontalButton(
          context1, "Rate This App", "Images/star.png", CurrencyPage());
    }
    if (index == 6) {
      return horizontalButton(
          context1, "Currency", "Images/currency.png", CurrencyPage());
    }
    if (index == 7) {
      return horizontalButton(context1, "Privacy Policy",
          "Images/privacy_policy.png", PrivacyPolicy());
    }
    if (index == 8) {
      return horizontalButton(
          context1, "About Us", "Images/LogoOV.png", AboutUsScreen());
    }
    if (index == 9) {
      return horizontalButton1(
          context1, "Logout", "Images/LogoG.png", LogInPage());
    }
    if (index == 10) {
      return horizontalButton1(
          context1, "Logout", "Images/logout.png", LogInPage());
    }
  }

  bool isGuest = true;
  bool isGuide =false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              toolbarHeight: MediaQuery.of(context).size.width > 500
                  ? MediaQuery.of(context).size.height * 0.04
                  : MediaQuery.of(context).size.height * 0.05,
              elevation: 0,
              backgroundColor: Palette.scaffold,
              title: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.05,
                child: AutoSizeText(
                  'Profile',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Palette.orange),
                  maxLines: 1,
                ),
              ),
            ),
            backgroundColor: Palette.scaffold,
            body: profileUi(context)),
      ),
    );
  }

  profileUi(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
            crossAxisCount: 4,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) =>
                CardTestList(context, index),
            staggeredTileBuilder: (int index) => new StaggeredTile.count(
                2,
                index == 0
                    ? 1.5
                    : index == 1
                    ? 3
                    : index == 2
                    ? 1.5
                    : (index == 3 || index == 4)
                    ? 1.5
                    : 0.8),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
      ),
    );
  }

  Widget infoCard(BuildContext context, {String text, String imape_Path}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width > 500
                                ? MediaQuery.of(context).size.width * 0.1
                                : MediaQuery.of(context).size.width * 0.1),
                      ),
                      elevation: 10,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width > 500
                            ? MediaQuery.of(context).size.width * 0.08
                            : MediaQuery.of(context).size.width * 0.08,
                        backgroundImage: NetworkImage(imape_Path),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width > 500
                          ? MediaQuery.of(context).size.width * 0.02
                          : MediaQuery.of(context).size.width * 0.06,
                      width: MediaQuery.of(context).size.width > 500
                          ? MediaQuery.of(context).size.width * 0.07
                          : MediaQuery.of(context).size.width * 0.09,
                      decoration: BoxDecoration(
                          color: Palette.online,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0, color: Palette.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buttonCard(
      BuildContext Context, String text, String image_Path, dynamic route) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.height * 0.5
              : MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.height * 0.5
              : MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image_Path,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.0123),
                child: Container(
                  width: MediaQuery.of(context).size.width > 500
                      ? MediaQuery.of(context).size.height * 0.5
                      : MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: AutoSizeText(
                    text,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Palette.actHubGrey,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(Context, MaterialPageRoute(builder: (Context) => route));
      },
    );
  }

  horizontalButton(
      BuildContext newContext,
      String text,
      String image_Path,
      dynamic route,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            newContext, MaterialPageRoute(builder: (newContext) => route));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.width * 0.1
              : MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.height * 0.5
              : MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0193),
                  child: Image.asset(
                    image_Path,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0193),
                  child: Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: AutoSizeText(
                        text,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.actHubGrey,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  horizontalButton1(
      BuildContext newContext,
      String text,
      String imagePath,
      dynamic route,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            newContext, MaterialPageRoute(builder: (newContext) => route));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.width * 0.1
              : MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.height * 0.5
              : MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0193),
                  child: Image.asset(
                    imagePath,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0193),
                  child: Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: AutoSizeText(
                        text,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.actHubGrey,
                            fontSize: 15),
                      ),
                    ),
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