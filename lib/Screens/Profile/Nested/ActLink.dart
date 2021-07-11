import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.5;
}
class ActLink extends StatefulWidget {

  static const String id = 'ActLink';

  @override
  _ActLinkState createState() => _ActLinkState();
}

class _ActLinkState extends State<ActLink> {
  @override
  Widget build(BuildContext context) {
    bool _value = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor:Palette.scaffold,
        appBar: AppBar(
          elevation: 0,
          leading: Container(
            height:allWidth(context)*0.05,
            width:MediaQuery.of(context).size.width*0.15,

            child: Padding(
              padding:  EdgeInsets.only(top:allWidth(context) > 500?allWidth(context)*0.0204 :allWidth(context)*0.0604 ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios,color: Palette.actHubGreen,),
                  onPressed: () => Navigator.pop(context),

                ),
              ),
            ),
          ),
          title: Padding(
            padding:  EdgeInsets.only(top:allWidth(context) > 500?allWidth(context)*0.0204 :allWidth(context)*0.0604 ),
            child: AutoSizeText(
              'Social',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Palette.social),
              maxLines: 1,
            ),
          ),
          centerTitle:true ,
          backgroundColor: Palette.scaffold,

          toolbarHeight:allHeight(context)*0.1,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height:allHeight(context)*0.86,
              width:allWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(

                      children: [
                        SizedBox(
                          height:allHeight(context)*0.06,
                          width:allWidth(context)*0.4,
                        ),

                        ListTileSwitch(
                          value: _value,
                          leading:  Image.asset('Images/facebookIcon.png',fit: BoxFit.contain,),
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
                            leading:   Image.asset('Images/twitterIcon.png',fit: BoxFit.contain,),
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
                  SafeArea(child: Container(
                      height: allHeight(context)*0.06,
                      width: allWidth(context)*0.4,
                      child: Image.asset('Images/ActHubOLogo.png',fit: BoxFit.contain,)), )//contain ACTHUB text picture
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}