import 'package:acthub/Classes/Palette.dart';
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
final List<String> imgList = [
  'https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/10/15/09/istock-483629308.jpg?width=982&height=726&auto=webp&quality=75',
  'https://q-xx.bstatic.com/xdata/images/hotel/840x460/131656046.jpg?k=40adadc416cd277d71a72d0d97b9d77d00e4278bef3713164403b17afe4178ca&o=',
  'https://d3hne3c382ip58.cloudfront.net/files/uploads/bookmundi/resized/cmsfeatured/trekking-in-japan-1560935848-785X440.jpg'
];
List<Widget> slider(BuildContext context) {
  return imgList
      .map(
        (item) =>allWidth(context)>500? Container(
      width: allWidth(context) * 0.83,
      height: allHeight(context) * 0.4,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(17.0)),
          child: Image.network(
            item,
            fit: BoxFit.fill,
          )),
    ):Container(
      width: allWidth(context) * 0.83,
      height: allHeight(context) * 0.5,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(17.0)),
          child: Image.network(
            item,
            fit: BoxFit.fill,
          )),
    ),
  )
      .toList();
}
class ActivityPages extends StatefulWidget {
  static const String id ="ActivityPages";
  @override
  _ActivityPagesState createState() => _ActivityPagesState();
}

class _ActivityPagesState extends State<ActivityPages> {
  bool isGuest = false;
  int _current =0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PortraitLayout(context),
    );
  }
  Widget textCardForPortraitLayout(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        LayoutBuilder(
            builder: (context, constraints) {
              return
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(allHeight(context)*0.02),

                    ),
                    elevation: 5,
                    child: Container(
                      width: allWidth(context) * 0.9,
                      height: allHeight(context) * 0.38,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(allHeight(context)*0.02)),
                      child: Padding(
                        padding:  EdgeInsets.only(
                            top:allHeight(context) * 0.047,
                            left:allHeight(context)*0.02,
                            right:allHeight(context)*0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: allHeight(context)*0.04,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Align(
                                      child: AutoSizeText(
                                        'Hiking Tour',
                                        textAlign: TextAlign.start ,
                                        overflow: TextOverflow.visible,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.actHubGreen,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    height: allHeight(context)*0.04,
                                    width: allWidth(context)*0.3,
                                  ),
                                  Container(
                                    child: Align(
                                      child: AutoSizeText(
                                        '200\$',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.actHubGreen,
                                        ),
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    height: allHeight(context)*0.04,
                                    width: allWidth(context)*0.2,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: allHeight(context)*0.03,
                              width: allWidth(context)*0.5,

                              child: Align(
                                child: AutoSizeText(
                                  'Difficulty level: Medium',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen,
                                  ),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            Container(
                              height: allHeight(context)*0.03,
                              width: allWidth(context)*0.5,

                              child: Align(
                                child: AutoSizeText(
                                  '7Km',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen,
                                  ),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            Container(
                              height: allHeight(context)*0.03,
                              width: allWidth(context)*0.5,

                              child: Align(
                                child: AutoSizeText(
                                  'From Ain Fawar to Wadi Qalt',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen,
                                  ),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            Container(
                              height:allHeight(context)*0.06,
                              width: allWidth(context)*0.9,
                              child: AutoSizeText(
                                'Unlock your full potential with our hiking tour.Explore the best hiking sights with us!!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Palette.actHubGreen,
                                ),
                                maxLines: 5,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.visible,

                              ),
                            ),
                            Container(
                              height: allHeight(context)*0.04,
                              width: allWidth(context)*0.6,
                              child: AutoSizeText(
                                'Guide : Yazan Tayyah',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.actHubGreen,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_enabled_rounded,
                                      color: Colors.grey,
                                      size:allWidth(context)*0.0604,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:allWidth(context)*0.02),
                                      child: Container(
                                        height: allHeight(context)*0.03,
                                        width: allWidth(context)*0.22,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Palette.actHubGreen,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.visible,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'Images/whatsapp.svg',
                                      height: allHeight(context)*0.026,
                                      color: Color(0xFF566357)
                                          .withOpacity(0.35),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: allWidth(context)*0.02),
                                      child: Container(
                                        height: allHeight(context)*0.03,
                                        width: allWidth(context)*0.22,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Palette.actHubGreen,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.visible,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                  size:allWidth(context)*0.0604,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: allWidth(context)*0.02,),
                                  child: Container(
                                    height: allHeight(context)*0.03,
                                    width: allWidth(context)*0.7,
                                    child: Align(
                                      child: AutoSizeText(
                                        'tayyahyazan@gmail.com',
                                        style: TextStyle(
                                          color: Palette.actHubGreen,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                        maxLines: 1,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
        ),
       Positioned(
            left: allWidth(context)*0.01,
            right: allWidth(context)*0.01,
            bottom:  allHeight(context)*0.339,
             child:  imageCardForPortraitLayout(context)
    ),
      ],
    );
  }
  Widget imageCardForPortraitLayout(BuildContext context,){
    return Container(
      width: allWidth(context)*0.83,
      height: allHeight(context)*0.5,
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: allWidth(context) * 0.83,
                  height: allHeight(context) * 0.5,
                  child: CarouselSlider(
                    items: slider(context),
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        aspectRatio: 1,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Positioned(
                  left: allWidth(context)*0.73,
                  top: allHeight(context)*0.009 ,
                  child: GestureDetector(
                    child: Container(
                      width: allWidth(context) * 0.12 ,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: imgList.map((url) {
                          int index = 3;
                          return Container(
                            width: allHeight(context)*0.008,
                            height:allHeight(context)*0.005,
                            margin: EdgeInsets.symmetric(
                              vertical: allHeight(context)*0.005, horizontal:  allWidth(context)*0.001,),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Palette.actHubGrey, width:  allWidth(context)*0.002,),
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Colors.black
                                    : Colors.white),
                          );
                        }).toList(),
                      ),
                    ),
                    onTap: (){
                    },
                  ),
                ),
                Positioned(
                  height: allHeight(context) * 0.48,
                  left: allWidth(context) * 0.05,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: allWidth(context) * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.map((url) {
                            int index = imgList.indexOf(url);
                            return Container(
                              width: allWidth(context)*0.015,
                              height: allWidth(context)*0.015,
                              margin: EdgeInsets.symmetric(
                                vertical: allHeight(context)*0.009, horizontal:  allWidth(context)*0.0025,),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Palette.actHubGrey, width:  allWidth(context)*0.002,),
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Palette.actHubGreen
                                      : Palette.white),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        width: allWidth(context) * 0.70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('Images/Like.svg',
                                    height:  allHeight(context)*0.025, color: Palette.actHubYellow),
                                Padding(
                                  padding:  EdgeInsets.only(left:  allWidth(context)*0.025,),
                                  child: Container(
                                    height: allHeight(context)*0.04,
                                    width: allWidth(context)*0.07,
                                    child: Align(
                                      child: AutoSizeText(
                                        '5',
                                        style: TextStyle(
                                            fontSize:20,
                                            color: Palette.actHubYellow),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('Images/dislike.svg',
                                    height:  allHeight(context)*0.025, color: Palette.actHubYellow),
                                Padding(
                                  padding:  EdgeInsets.only(left:  allWidth(context)*0.025,),
                                  child: Container(
                                    height: allHeight(context)*0.04,
                                    width: allWidth(context)*0.07,
                                    child: Align(
                                      child: AutoSizeText(
                                        '5',
                                        style: TextStyle(
                                            fontSize:20,
                                            color: Palette.actHubYellow),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('Images/view.svg',
                                    height: allHeight(context)*0.025, color: Palette.actHubYellow),
                                Padding(
                                  padding:  EdgeInsets.only(left:  allWidth(context)*0.025,),
                                  child: Container(
                                    height: allHeight(context)*0.04,
                                    width: allWidth(context)*0.07,
                                    child: Align(
                                      child: AutoSizeText(
                                        '5',
                                        style: TextStyle(
                                            fontSize:20,
                                            color: Palette.actHubYellow),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget PortraitLayout(BuildContext context,){
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight:allHeight(context) * 0.06,
        backgroundColor: Palette.scaffold,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: allHeight(context) * 0.03,
              width: allWidth(context) * 0.2,
              child: AutoSizeText(
                'Hiking',
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Palette.orange),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: allWidth(context) * 0.08),
              child: AutoSizeText(
                'Outdoor Activity',
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: 14,
                  color: Palette.actHubGreen.withOpacity(0.35),
                ),
              ),
            )
          ],
        ),
        actions: [
          isGuest
              ? Padding(
            padding: EdgeInsets.only(
                right: allWidth(context) * 0.1,
                top: allHeight(context) * 0.01),
            child: CircleAvatar(
              radius: allWidth(context) * 0.0603,
              backgroundImage:
              AssetImage("Images/gusetProfilepic.png"),
              backgroundColor: Palette.white,
            ),
          )
              : Padding(
            padding: EdgeInsets.only(
                right: allWidth(context) * 0.1,
                top: allHeight(context) * 0.01),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: allWidth(context) * 0.05,
                  backgroundImage: NetworkImage(
                      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                ),
                Positioned(
                    top: allHeight(context) * 0.032,
                    left: 0,
                    child: Container(
                      height:
                      allHeight(context) * 0.018,
                      width:
                      allWidth(context) * 0.034,
                      decoration: BoxDecoration(
                          color: Palette.online,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width:
                              allWidth(context) *
                                  0.0045,
                              color: Palette.white)),
                    ))
              ],
            ),
          )
        ],
      ),
      body:MediaQuery.of(context).size.height>MediaQuery.of(context).size.width? Container(
        height: allHeight(context),
        width: allWidth(context),
        child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int section, int index){
              return  Padding(
                padding: EdgeInsets.all(allWidth(context) * 0.02),
                child: textCardForPortraitLayout(context),
              );
            },
            options: CarouselOptions(
              height: allHeight(context) * 0.9,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              // autoPlay: false,
            )),
      ):Container(
        height: allHeight(context),
        width: allWidth(context),
        child: Center(
          child: SingleChildScrollView(
            child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int section, int index){
                  return  Padding(
                    padding: EdgeInsets.all(allWidth(context) * 0.02),
                    child: textCardForPortraitLayout(context),
                  );
                },
                options: CarouselOptions(
                  height: allHeight(context) * 0.9,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  // autoPlay: false,
                )),
          ),
        ),
      ),
    );
  }
}
