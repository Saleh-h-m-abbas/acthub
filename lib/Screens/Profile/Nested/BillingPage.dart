import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.85;
}
class BillingPage extends StatefulWidget {
  const BillingPage({Key key}) : super(key: key);
  static const String id = 'BillingPage';

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.scaffold,
        appBar:AppBar(
          centerTitle: true,
          toolbarHeight: allHeight(context)*0.08,
          backgroundColor: Palette.scaffold,
          elevation: 0,
          title: AutoSizeText(
            'Billing',
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: Palette.orange,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          leading:  Container(
            height: MediaQuery.of(context).size.width * 0.05,
            width: MediaQuery.of(context).size.width * 0.15,
            child: FittedBox(
              fit: BoxFit.fill,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Palette.actHubGreen,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: allWidth(context)*0.07,
                  width: allWidth(context)*0.9,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'You are joined with us by ',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        color: Palette.actHubGreen,
                        fontSize:23,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: allWidth(context),
                    height: allHeight(context)*0.6,
                    child: Center(child: packageDesign(context,'Images/GreyPackage.png',"300\$ /mo",'Access To','Images/check.svg','Images/false.svg','Standard Package',Palette.actHubGreen,Palette.actHubGreen.withOpacity(0.33),))),
                Padding(
                  padding:  EdgeInsets.only(top: allHeight(context)*0.015),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(allHeight(context)*0.02),),
                    elevation: 5,
                    child: Container(
                      height: allHeight(context)*0.16,
                      width: allWidth(context)*0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(allHeight(context)*0.02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: allHeight(context)*0.05,
                            width: allWidth(context)*0.9,
                            child: Align(
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                'Your Package',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.actHubGreen.withOpacity(0.75),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: allHeight(context)*0.05,
                            width: allWidth(context)*0.55,

                            child: Align(
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                'Started From    28/6/2021',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Palette.actHubGreen.withOpacity(0.75),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: allHeight(context)*0.035,
                            width: allWidth(context)*0.55,

                            child: Align(
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                'Up to \t\t\t\t\t\t\t\t\t\t  28/7/2021',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Palette.actHubGreen.withOpacity(0.75),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:  allHeight(context)*0.065),
                  child: Container(
                    height: allHeight(context)*0.065,
                    width: allWidth(context)*0.85,
                    child: ElevatedButton(
                      child: AutoSizeText(
                          'Upgrade Your Package',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 20,
                            color: Palette.white,
                            //fontWeight: FontWeight.bold,
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: Palette.actHubGreen,

                      ),
                      onPressed: (){},
                    ),
                  ),
                ),
                SafeArea(child: Container(
                    height: allHeight(context) * 0.1,
                    width:allWidth(context) * 0.25,
                    child: Image.asset(
                      'Images/Ylogo.png',
                      fit: BoxFit.contain,
                    )),)
              ],
            ),
          ],
        ),
      ),);
  }
  Widget packageDesign(BuildContext context,String packageURL,String price, String access, String checkURL, String falseURL, String packageType,Color packageTypeColor,Color buttonColor){
    return Stack(
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(allHeight(context)*0.02),),
            elevation: 5,
            child: Container(
              height: allHeight(context)*0.6,
              width: allWidth(context)*0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(allHeight(context)*0.02),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: allHeight(context)*0.26),
                child: Column(
                  children: [

                    Container(
                      height: allHeight(context)*0.07,
                      width: allWidth(context)*0.9,
                      child: Align(
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          price,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: Palette.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: allHeight(context)*0.015),
                      child: Container(
                        height: allHeight(context)*0.04,
                        width: allWidth(context)*0.85,
                        child: Padding(
                          padding: EdgeInsets.only(left: allWidth(context)*0.06),
                          child: Row(
                            children: [
                              // Icon(Icons.check_sharp,size: allHeight(context)*0.04,color: Palette.orange,),
                              SvgPicture.asset(
                                checkURL,
                                height: allHeight(context)*0.02,
                                color:Palette.orange,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: allWidth(context)*0.27),
                                child: AutoSizeText(
                                  access,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: allHeight(context)*0.04,
                      width: allWidth(context)*0.85,
                      child: Padding(
                        padding: EdgeInsets.only(left: allWidth(context)*0.06),
                        child: Row(
                          children: [
                            // Icon(Icons.check_sharp,size: allHeight(context)*0.04,color: Palette.orange,),
                            SvgPicture.asset(
                              falseURL,
                              height: allHeight(context)*0.02,
                              color:Palette.actHubGrey.withOpacity(0.40),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: allWidth(context)*0.28),
                              child: AutoSizeText(
                                access,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: allHeight(context)*0.04,
                      width: allWidth(context)*0.85,
                      child: Padding(
                        padding: EdgeInsets.only(left: allWidth(context)*0.06),
                        child: Row(
                          children: [
                            // Icon(Icons.check_sharp,size: allHeight(context)*0.04,color: Palette.orange,),
                            SvgPicture.asset(
                              falseURL,
                              height: allHeight(context)*0.02,
                              color:Palette.actHubGrey.withOpacity(0.40),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: allWidth(context)*0.28),
                              child: AutoSizeText(
                                access,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: allHeight(context)*0.04,
                      width: allWidth(context)*0.85,
                      child: Padding(
                        padding: EdgeInsets.only(left: allWidth(context)*0.06),
                        child: Row(
                          children: [
                            // Icon(Icons.check_sharp,size: allHeight(context)*0.04,color: Palette.orange,),
                            SvgPicture.asset(
                              falseURL,
                              height: allHeight(context)*0.02,
                              color:Palette.actHubGrey.withOpacity(0.40),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: allWidth(context)*0.28),
                              child: AutoSizeText(
                                access,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: allHeight(context)*0.04,
                      width: allWidth(context)*0.85,
                      child: Padding(
                        padding: EdgeInsets.only(left: allWidth(context)*0.06),
                        child: Row(
                          children: [
                            // Icon(Icons.check_sharp,size: allHeight(context)*0.04,color: Palette.orange,),
                            SvgPicture.asset(
                              falseURL,
                              height: allHeight(context)*0.02,
                              color:Palette.actHubGrey.withOpacity(0.40),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: allWidth(context)*0.28),
                              child: AutoSizeText(
                                access,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
        Positioned(
          top: allHeight(context)*0.007,
          left: allWidth(context)*0.008,
          child: Container(
              width: allWidth(context)*0.9,
              height: allHeight(context)*0.24,
              child: Image.asset(packageURL,fit: BoxFit.fill,)),),
        Positioned(
            top: allHeight(context)*0.06,
            left: allWidth(context)*0.15,
            child: Container(
              height: allHeight(context)*0.1,
              width: allWidth(context)*0.65,
              child: Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  packageType,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: packageTypeColor
                  ),
                ),
              ),

            ))
      ],
    );
  }
}
