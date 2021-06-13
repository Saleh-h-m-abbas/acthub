import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
class ActLink extends StatefulWidget {

  static const String id = 'ActLink';

  @override
  _ActLinkState createState() => _ActLinkState();
}

class _ActLinkState extends State<ActLink> {
  @override
  Widget build(BuildContext context) {
    bool _value = false;
    return Scaffold(
      backgroundColor:Palette.scaffold,
      appBar: AppBar(
        leading: Container(
          height: MediaQuery.of(context).size.width*0.05,
          width:MediaQuery.of(context).size.width*0.15,

          child: FittedBox(
            fit: BoxFit.fill,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,size: 15,color: Palette.actHubGreen,),
              onPressed: () => Navigator.pop(context),

            ),
          ),
        ),
        title: AutoSizeText(
          'Social',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Palette.social),
          maxLines: 1,
        ),
        centerTitle:true ,
        backgroundColor: Palette.scaffold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.02),
              bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.02)
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*0.86,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.4,
                  ),

                  ListTileSwitch(
                    value: _value,
                    leading:   Image.asset('Images/facebook.png',fit: BoxFit.contain,),
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },

                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    switchType: SwitchType.cupertino,
                    switchActiveColor: Palette.orange,
                    switchInactiveColor: Palette.actHubGreen.withOpacity(0.33),

                    title: AutoSizeText('Facebook',style: TextStyle(color:
                    Palette.actHubGreen.withOpacity(0.5),fontWeight: FontWeight.bold),


                    ),
                  ),
                  ListTileSwitch(
                    value: _value,
                    leading:   Image.asset('Images/twitter.png',fit: BoxFit.contain,),
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    switchType: SwitchType.cupertino,
                      switchActiveColor: Palette.orange,
                    title:
                    AutoSizeText('Twitter',style: TextStyle(color:
                    Palette.actHubGreen.withOpacity(0.5),fontWeight: FontWeight.bold),)

                    ),
                  ListTileSwitch(
                    value: _value,

                    leading:   Image.asset('Images/apple.png',fit: BoxFit.contain,),
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    visualDensity: VisualDensity.comfortable,
                    switchType: SwitchType.cupertino,
                    switchActiveColor: Palette.orange,
                    title: AutoSizeText('Apple',style: TextStyle(color:
                    Palette.actHubGreen.withOpacity(0.5),fontWeight: FontWeight.bold),
                  ),


    ),
              ]
              ),
              Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Image.asset('Images/yellowlogo.png',fit: BoxFit.contain,)), //contain ACTHUB text picture
            ],
          ),
        ),
      ),
    );
  }
}
