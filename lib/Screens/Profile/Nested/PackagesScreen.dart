import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/ActivityPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
class PackagesScreen extends StatefulWidget {
  static const String id = "PackagesScreen";


  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: allHeight(context)*0.08,
        backgroundColor: Palette.scaffold,
        elevation: 0,
        title: AutoSizeText(
          'Packaging Offer',
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
          style: TextStyle(
            color: Palette.actHubGreen.withOpacity(0.75),
            fontWeight: FontWeight.bold,
            fontFamily: "Segoe UI",
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
      body:MediaQuery.of(context).size.height>MediaQuery.of(context).size.width? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: allHeight(context)*0.712,
            width: allWidth(context),
            child:CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int section, int index){
                  return  Padding(
                      padding: EdgeInsets.all(allWidth(context) * 0.02),
                      child: section == 0? packageDesign(context,'Images/GreyPackage.png',"300\$ /mo",'Access To','Images/check.svg','Images/false.svg','Standard Package',Palette.actHubGreen,Palette.actHubGreen.withOpacity(0.33),):
                      section==1 ?packageDesign(context,'Images/OrangePackage.png',"300\$ /mo",'Access To','Images/check.svg','Images/false.svg','Standard Package',Palette.white,Color(0xffF9A559),):
                      packageDesign(context,'Images/GreenPackage.png',"300\$ /mo",'Access To','Images/check.svg','Images/false.svg','Standard Package',Palette.white,Palette.actHubGreen,)
                  );
                },
                options: CarouselOptions(
                  height: allHeight(context) * 0.73,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  // autoPlay: false,
                )) ,
          ),
          SafeArea(child: Container(
              height: allHeight(context) * 0.15,
              width:allWidth(context) * 0.4,
              child: Image.asset(
                'Images/LogoG.png',
                fit: BoxFit.contain,
              )),)
        ],
      ) : SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: allHeight(context)*0.73,
                width: allWidth(context),
                child:CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int section, int index){
                      return  Padding(
                          padding: EdgeInsets.all(allWidth(context) * 0.02),
                          child: section == 0? packageDesign(context,'Images/GreyPackage.png',"300\$ /mo",'Access To','Images/check.svg','Images/false.svg','Standard Package',Palette.actHubGreen,Palette.actHubGreen.withOpacity(0.33),):
                          section==1 ?packageDesign(context,'Images/OrangePackage.png',"300\$ /mo",'Access To','Images/check.svg','Images/false.svg','Standard Package',Palette.white,Color(0xffF9A559),):
                          packageDesign(context,'Images/GreenPackage.png',"300\$ /mo",'Access To','Images/check.svg','Images/false.svg','Standard Package',Palette.white,Palette.actHubGreen,)
                      );
                    },
                    options: CarouselOptions(
                      height: allHeight(context) * 0.9,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      // autoPlay: false,
                    )) ,
              ),
              SafeArea(child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Image.asset(
                    'Images/LogoG.png',
                    fit: BoxFit.contain,
                  )),)
            ],
          ),
        ),
      ) ,
    );
  }
  Widget packageDesign(BuildContext context,String packageURL,String price, String Access, String checkURL, String falseURL, String PackageType,Color PackageTypeColor,Color buttonColor){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(allHeight(context)*0.02),),
      elevation: 5,
      child: Container(
        height: allHeight(context)*0.7,
        width: allWidth(context)*0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(allHeight(context)*0.02),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                    width: allWidth(context)*0.9,
                    height: allHeight(context)*0.24,
                    child: Image.asset(packageURL,fit: BoxFit.fill,)),
                Positioned(
                    top: allHeight(context)*0.06,
                    left: allWidth(context)*0.15,
                    child: Container(
                      height: allHeight(context)*0.1,
                      width: allWidth(context)*0.65,
                      child: Align(
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          PackageType,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Segoe UI",
                              color: PackageTypeColor
                          ),
                        ),
                      ),

                    )),
              ],

            ),

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
                    fontFamily: "Segoe UI",
                    color: Palette.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              height: allHeight(context)*0.065,
              width: allWidth(context)*0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(allHeight(context)*0.02),
              ),
              child: ElevatedButton(
                child: AutoSizeText(
                    'Join',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Segoe UI",
                      color: PackageTypeColor,
                      //fontWeight: FontWeight.bold,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: buttonColor, // background
                  // foreground
                ),
                onPressed: (){},
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
                      checkURL,
                      height: allHeight(context)*0.02,
                      color:Palette.orange,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: allWidth(context)*0.27),
                      child: AutoSizeText(
                        Access,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Segoe UI",
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
                        Access,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
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
                        Access,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Segoe UI",
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
                        Access,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Segoe UI",
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
                        Access,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Segoe UI",
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
    );
  }
}