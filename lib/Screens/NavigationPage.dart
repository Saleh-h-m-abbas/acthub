import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/HomePage.dart';
import 'package:acthub/Screens/ManagementPage.dart';
import 'package:acthub/Screens/MapPage.dart';
import 'package:acthub/Screens/ProfilePage.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:acthub/Screens/AddActivity.dart';

//create instance from all Screens
HomePage getHome = new HomePage();
MapPage getMap = new MapPage();
ManagementPage getManagement = new ManagementPage();
ProfilePage getProfile = new ProfilePage();
AddActivity getAddActivity=new AddActivity();


class NavigationPage extends StatefulWidget {
  static const String id = 'NavBarScreen';

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isGuide =true;
  //NavBarScreen variable
  int _currentIndex = 0;
  static List<Widget> screenList = <Widget>[
    getHome,
    getMap,
    getAddActivity,
    getManagement,
    getProfile
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screenList.elementAt(_currentIndex),
      ),
      bottomNavigationBar: isGuide?bottomNav2(context):bottomNav1(context),

    );
  }
  Container bottomNav1(BuildContext context){
    return Container(
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
          // CustomNavigationBarItem(icon: Icon(Icons.add,
          //   color: _currentIndex == 3 ? Color(0xFFFF8211) : Color(0xFF949A95),,
          // ),
          // ),

          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'Images/104.svg',
              color:
              _currentIndex == 4 ? Color(0xFFFF8211) : Color(0xFF949A95),
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
    );
  }
  Container bottomNav2(BuildContext context){
    return Container(
      height: 70,
      child: Stack(
alignment: Alignment.center,
        children: [
          Container(
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
                CustomNavigationBarItem(icon: Icon(Icons.add,
                  color: _currentIndex == 2 ? Color(0xFFFF8211) : Color(0xFF949A95),
                ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'Images/103.svg',
                    color:
                    _currentIndex == 3 ? Color(0xFFFF8211) : Color(0xFF949A95),
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'Images/104.svg',
                    color:
                    _currentIndex == 4 ? Color(0xFFFF8211) : Color(0xFF949A95),
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
  //         GestureDetector(
  //           child: Card(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(50),
  //             ),
  //             elevation: 10,
  //             child: Container(
  //            height: 50,
  //            width: 50,
  //       decoration: BoxDecoration(
  //
  //               shape: BoxShape.circle,
  //       ),
  //            child: Icon(Icons.add,
  //   color: _currentIndex == 3 ? Color(0xFFFF8211) : Color(0xFF949A95),
  //
  // ),
  //     ),
  //
  //           ),
  //           onTap: (){
  //             Navigator.pushNamed(
  //                 context, AddActivity.id);
  //           },
  //
  //         )

      ] ),
    );
  }

}
