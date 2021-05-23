import 'package:acthub/Classes/Palette.dart';
import 'package:flutter/material.dart';
import 'package:acthub/Screens/HomePage.dart';

HomePage getHome = HomePage();
class NavigationPage extends StatefulWidget {
  static  String id = 'NavigationPage';
  static  int _selectedItemsIndex = 0;
  @override
  _NavigationPageState createState() => _NavigationPageState();
}
class _NavigationPageState extends State<NavigationPage> {
  static List <Widget> screenList =[
    getHome,

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Card(
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(30.0),
          ),
elevation: 20,
          child: Container(
            height: MediaQuery.of(context).size.height*0.075,
            width: MediaQuery.of(context).size.width*0.5,
            decoration: const BoxDecoration(

              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildNaBarItems(Icons.home, 0),
                buildNaBarItems(Icons.search, 1),
                buildNaBarItems(Icons.local_grocery_store_outlined, 2),
                buildNaBarItems(Icons.person, 3),
              ],
            ),
          ),
        ),
      ),
      body: Center(
          child:  screenList.elementAt(NavigationPage._selectedItemsIndex)),
    );
  }

  Widget buildNaBarItems(IconData icon, int index) {
    return GestureDetector(
      child: Container(

        color: Palette.white,
        height: MediaQuery.of(context).size.height*0.075,
        width: MediaQuery.of(context).size.width/4.7,
        child: Icon(icon,color: index == NavigationPage._selectedItemsIndex? Palette.orange : Palette.actHubGreen.withOpacity(0.3) ,),
      ),
      onTap: (){
        setState(() {
          NavigationPage._selectedItemsIndex = index;
        });
      },
    );

  }
}
