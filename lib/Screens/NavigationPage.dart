import 'package:acthub/Screens/HomePage.dart';
import 'package:acthub/Screens/ManagementPage.dart';
import 'package:acthub/Screens/MapPage.dart';
import 'package:acthub/Screens/ProfilePage.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomNavigationBar: Container(
        height: 70,
        child: CustomNavigationBar(
          iconSize: 40.0,
          selectedColor: Color(0xFFFF8211),
          strokeColor: Color(0x30040307),
          unSelectedColor: Color(0xffacacac),
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'Images/101.svg',
                color:
                    _currentIndex == 0 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'Images/102.svg',
                color:
                    _currentIndex == 1 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'Images/103.svg',
                color:
                    _currentIndex == 2 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'Images/104.svg',
                color:
                    _currentIndex == 3 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
