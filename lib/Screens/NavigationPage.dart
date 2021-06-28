import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/Home/HomePage.dart';
import 'package:acthub/Screens/Management/ManagementPage.dart';
import 'package:acthub/Screens/Management/Nested/AddActivity.dart';
import 'package:acthub/Screens/Map/MapPage.dart';
import 'package:acthub/Screens/Profile/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:acthub/Screens/Notification/NotificationPage.dart';

//create instance from all Screens
HomePage getHome = new HomePage();
MapPage getMap = new MapPage();
ManagementPage getManagement = new ManagementPage();
ProfilePage getProfile = new ProfilePage();
AddActivity getAddActivity = new AddActivity();
NotificationPage getNotification=new NotificationPage();
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width;
}

class NavigationPage extends StatefulWidget {
  static const String id = 'NavBarScreen';

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  //NavBarScreen variable
  int _currentIndex = 0;
  bool isPressed= false;
  static List<Widget> screenList = <Widget>[
    getHome,
    getMap,
    // getAddActivity,
    getManagement,
    getNotification,
    getProfile,

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
        body: screenList.elementAt(_currentIndex),
        bottomNavigationBar: bottomNav(context),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),


        backgroundColor: isPressed?Color(0xFFFF8211):Color(0xFF949A95),

        onPressed: (){
          setState(() {
            isPressed=!isPressed;
            Navigator.pushNamed(context,AddActivity.id);
          });
        },),
      

    );

  }

  bottomNav(BuildContext context) {
    return Container(
      height: allHeight(context) * 0.08,

      decoration: BoxDecoration(
color : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 0.0), //(x,y)
            blurRadius: 25.0,
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildNaBarItems(
              Icon(
                Icons.home,
                color: _currentIndex == 0
                    ? Color(0xFFFF8211)
                    : Color(0xFF949A95),
              ),
              0),
          buildNaBarItems(
              Icon(
                Icons.location_on_outlined,
                color: _currentIndex == 1
                    ? Color(0xFFFF8211)
                    : Color(0xFF949A95),
              ),
              1),
          buildNaBarItems(
              Icon(
                Icons.dashboard_customize,
                color: _currentIndex == 2
                    ? Color(0xFFFF8211)
                    : Color(0xFF949A95),
              ),
              2),
          buildNaBarItems(
              Icon(
                Icons.notifications,
                color: _currentIndex == 3
                    ? Color(0xFFFF8211)
                    : Color(0xFF949A95),
              ),
              3),
          buildNaBarItems(
              Icon(
                Icons.person,
                color: _currentIndex == 4
                    ? Color(0xFFFF8211)
                    : Color(0xFF949A95),
              ),
              4),
        ],
      ),
    );
  } // if we want to use a custom one designed by us can be edited just like in the xd

  Widget buildNaBarItems(Widget icon, int index) {
    return GestureDetector(
      child: Container(
          color: Palette.white,
          height: MediaQuery.of(context).size.height * 0.025,
          width: MediaQuery.of(context).size.width / 5.6,
          child: icon),
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
