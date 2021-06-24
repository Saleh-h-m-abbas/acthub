import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/HomePage.dart';
import 'package:acthub/Screens/ManagementPage.dart';
import 'package:acthub/Screens/MapPage.dart';
import 'package:acthub/Screens/ProfilePage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
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
  static List<Widget> screenList1 = <Widget>[
    getHome,
    getMap,
    getManagement,
    getProfile
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: Center(
        child: isGuide?screenList.elementAt(_currentIndex):screenList1.elementAt(_currentIndex),

      ),

     bottomNavigationBar: isGuide?bottomNav2(context):bottomNav2(context)
    );
  }
  bottomNav1(BuildContext context){
    return ConvexAppBar(
style: TabStyle.fixedCircle,
   cornerRadius: 20,

     backgroundColor: Colors.white,
        activeColor: Color(0xFFFF8211),
       height: 70,
       color: Color(0xffacacac),

      items: [
        TabItem(icon:SvgPicture.asset(
          'Images/101.svg',
          color:
          _currentIndex == 0 ? Color(0xFFFF8211) : Color(0xFF949A95),

        ), ),
        TabItem(icon: SvgPicture.asset(
          'Images/102.svg',
          color:
          _currentIndex == 1 ? Color(0xFFFF8211) : Color(0xFF949A95),
        ),),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon:SvgPicture.asset(
          'Images/103.svg',
          color:
          _currentIndex == 2 ? Color(0xFFFF8211) : Color(0xFF949A95),
        ),),
        TabItem(icon: SvgPicture.asset(
          'Images/104.svg',
          color:
          _currentIndex == 4 ? Color(0xFFFF8211) : Color(0xFF949A95),
        ),),
      ],
      initialActiveIndex: _currentIndex,
      onTap: (int i) {
        setState(() {
          _currentIndex=i;
        });
      }
    );
  } // this is the convex app bar  , the problem
  // is that it doesn't accept an even number of pages

  Container bottomNav2(BuildContext context){
    return Container(
      height: 70,
      child: Container(
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
    );
  } // a stack button but when opening the page it seems to be not in the navigation bar
 bottomNav3(BuildContext context){
    return
      Card(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            topLeft:    Radius.circular(20),
            topRight:    Radius.circular(20),
          ),
        ),
        elevation: 20,
        child: Container(

          height: MediaQuery.of(context).size.height*0.075,
          width: MediaQuery.of(context).size.width*0.5,
          decoration: const BoxDecoration(

            borderRadius: BorderRadius.only(
            topLeft:    Radius.circular(20), topRight:    Radius.circular(20),
            ),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildNaBarItems(SvgPicture.asset(
                'Images/101.svg',
                color:
                _currentIndex == 0 ? Color(0xFFFF8211) : Color(0xFF949A95),

              ), 0),
              buildNaBarItems( SvgPicture.asset(
                'Images/102.svg',
                color:
                _currentIndex == 1 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ), 1),
              buildNaBarItems(Icon(Icons.add,
                color: _currentIndex == 2 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ), 2),
              buildNaBarItems(SvgPicture.asset(
                'Images/103.svg',
                color:
                _currentIndex == 3 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ), 3),
              buildNaBarItems( SvgPicture.asset(
                'Images/104.svg',
                color:
                _currentIndex == 4 ? Color(0xFFFF8211) : Color(0xFF949A95),
              ), 4),
            ],
          ),
        ),
      );
  } // if we want to use a custom one designed by us can be edited just like in the xd
  Widget buildNaBarItems(Widget icon, int index) {
    return GestureDetector(
      child: Container(
        color: Palette.white,
        height: MediaQuery.of(context).size.height*0.04,
        width: MediaQuery.of(context).size.width/5.6,
        child: icon
      ),
      onTap: (){
        setState(() {
         _currentIndex = index;
        });
      },
    );

  }
}
