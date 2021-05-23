import 'package:acthub/Screens/HomePage.dart';
import 'package:acthub/Screens/ManagementPage.dart';
import 'package:acthub/Screens/MapPage.dart';
import 'package:acthub/Screens/ProfilePage.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

//create instance from all Screens
HomePage getHome = new HomePage();
MapPage getMap = new MapPage();
ManagementPage getManagement = new ManagementPage();
ProfilePage getProfile = new ProfilePage();

class NavigationPage extends StatefulWidget {
  static const String id = 'NavBarScreen';

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  //NavBarScreen variable
  int _currentIndex = 0;
  static List<Widget> screenList = <Widget>[
    getHome,
    getMap,
    getManagement,
    getProfile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screenList.elementAt(_currentIndex),
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Color(0xff040307),
        strokeColor: Color(0x30040307),
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.navigation),
            title: Text("Map"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Likes"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Profile"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
