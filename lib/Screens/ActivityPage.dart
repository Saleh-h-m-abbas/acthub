import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

final List<String> imgList = [
  'https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/10/15/09/istock-483629308.jpg?width=982&height=726&auto=webp&quality=75',
  'https://q-xx.bstatic.com/xdata/images/hotel/840x460/131656046.jpg?k=40adadc416cd277d71a72d0d97b9d77d00e4278bef3713164403b17afe4178ca&o=',
  'https://d3hne3c382ip58.cloudfront.net/files/uploads/bookmundi/resized/cmsfeatured/trekking-in-japan-1560935848-785X440.jpg'
];

List<Widget> slider(BuildContext context) {
  return imgList
      .map(
        (item) =>MediaQuery.of(context).size.width>500? Container(
      width: MediaQuery.of(context).size.width * 0.83,
      height: MediaQuery.of(context).size.height * 0.4,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(17.0)),
          child: Image.network(
            item,
            fit: BoxFit.fill,
          )),
    ):Container(
      width: MediaQuery.of(context).size.width * 0.83,
      height: MediaQuery.of(context).size.height * 0.5,
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

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key key}) : super(key: key);
  static const String id = 'ActivityPage';

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Palette.scaffold,
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Palette.actHubGreen,
                    ),
                    onPressed: () => Navigator.pop(context)),
                elevation: 0,
                centerTitle: false,
                toolbarHeight: MediaQuery
                    .of(context)
                    .size
                    .width > 500 ? MediaQuery
                    .of(context)
                    .size
                    .height * 0.13 : MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                backgroundColor: Palette.scaffold,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .width > 500 ? MediaQuery
                              .of(context)
                              .size
                              .height * 0.06 : MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.4,
                          child: AutoSizeText(
                            'Hiking',
                            textAlign: TextAlign.start ,
                            overflow: TextOverflow.visible,
                            maxLines: 1,// name of activity
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Palette.orange,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery
                                  .of(context)
                                  .size
                                  .width > 500 ? MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.03 : MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.08),
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .width > 500 ? MediaQuery
                                .of(context)
                                .size
                                .height * 0.05 : MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.32,
                            child: AutoSizeText(
                              'Outdoor activites',
                              textAlign: TextAlign.start ,
                              overflow: TextOverflow.visible,
                              maxLines: 1,  //name of main category
                              style: TextStyle(
                                fontSize: 14,
                                color: Palette.actHubGreen.withOpacity(0.35),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery
                              .of(context)
                              .size
                              .width > 500
                              ?
                          MediaQuery
                              .of(context)
                              .size
                              .width * 0.03 :
                          MediaQuery
                              .of(context)
                              .size
                              .width * 0.065,
                          backgroundImage: NetworkImage(
                              'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width*0.043:MediaQuery.of(context).size.width*0.09,
                          right:  MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width*0.015:MediaQuery.of(context).size.width*0.06,
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .width > 500
                                ? MediaQuery
                                .of(context)
                                .size
                                .width * 0.017 : MediaQuery
                                .of(context)
                                .size
                                .width * 0.04,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width > 500 ? MediaQuery
                                .of(context)
                                .size
                                .width * 0.07 : MediaQuery
                                .of(context)
                                .size
                                .width * 0.09,
                            decoration: BoxDecoration(
                                color: Palette.online,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.0, color: Palette.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
              body: MediaQuery
                  .of(context)
                  .size
                  .width>500?Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int section, int index) {
                    return Padding(
                      padding: EdgeInsets.all(MediaQuery
                          .of(context)
                          .size
                          .width>500?MediaQuery
                          .of(context)
                          .size
                          .width * 0.01:MediaQuery
                          .of(context)
                          .size
                          .width * 0.02),
                      child: textCard(context),
                    );
                  },
                  options: CarouselOptions(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.9,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    // autoPlay: false,
                  ),
                ),
              ):Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int section, int index) {
                    return Padding(
                      padding: EdgeInsets.all(MediaQuery
                          .of(context)
                          .size
                          .width>500?MediaQuery
                          .of(context)
                          .size
                          .width * 0.01:MediaQuery
                          .of(context)
                          .size
                          .width * 0.02),
                      child: textCard(context),
                    );
                  },
                  options: CarouselOptions(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.9,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    // autoPlay: false,
                  ),
                ),
              ),

            ),
          );
        }
    );
  }

  Widget textCard(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth>constraints.maxHeight?
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),

                    ),
                    elevation: 5,
                    child: Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width *0.55,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(MediaQuery.of(context).size.height*0.02)),
                        child: Padding(
                          padding:  EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.05,
                            left:MediaQuery.of(context).size.height*0.05,
                            right:  MediaQuery.of(context).size.height*0.05,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex:12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.07,
                                      width:MediaQuery.of(context).size.width*0.22,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                'Hiking Tour',
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Palette.actHubGreen,
                                                ),
                                              ),
                                            ),
                                            height: MediaQuery.of(context).size.height*0.07,
                                            width: MediaQuery.of(context).size.width*0.12,
                                          ),
                                          // Container(
                                          //   child: Align(
                                          //     alignment: Alignment.centerRight,
                                          //     child: AutoSizeText(
                                          //       '200.88\$',
                                          //       maxLines: 1,
                                          //       textAlign: TextAlign.start,
                                          //       overflow: TextOverflow.visible,
                                          //       style: TextStyle(
                                          //         fontSize: 15,
                                          //         fontWeight: FontWeight.bold,
                                          //         color: Palette.actHubGreen,
                                          //       ),
                                          //     ),
                                          //   ),
                                          //   height: MediaQuery.of(context).size.height*0.07,
                                          //   width: MediaQuery.of(context).size.width*0.1,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.05,
                                      width: MediaQuery.of(context).size.width*0.24,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: AutoSizeText(
                                          'Difficulty level: Medium',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                          ),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.visible,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.05,
                                      width:MediaQuery.of(context).size.width*0.15,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: AutoSizeText(
                                          '7Km - 9km long',
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                          ),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width:MediaQuery.of(context).size.width*0.25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: AutoSizeText(
                                          'From Ain Fawar to Wadi Qelt\n',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                          ),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:MediaQuery.of(context).size.height*0.07,
                                      width:MediaQuery.of(context).size.width*0.33,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: AutoSizeText(
                                          'Unlock your full potential with our hiking tour.Explore the best hiking sights with us!!',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Palette.actHubGreen,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex:11,
                                child: Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.07,
                                      width: MediaQuery.of(context).size.width*0.25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: AutoSizeText(
                                          'Guide : Yazan Tayyah',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_enabled_rounded,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left:MediaQuery.of(context).size.width*0.005),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.05,
                                            width: MediaQuery.of(context).size.width*0.13,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '+02 2815291',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'Images/whatsapp.svg',
                                          height: MediaQuery.of(context).size.height*0.045,
                                          color: Color(0xFF566357)
                                              .withOpacity(0.35),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left:MediaQuery.of(context).size.width*0.008),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.05,
                                            width: MediaQuery.of(context).size.width*0.13,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '+02 2815291',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: Colors.grey,
                                          size:20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left:
                                          MediaQuery.of(context).size.width*0.002,),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.06,
                                            width: MediaQuery.of(context).size.width*0.18,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                'tayyahyazan@gmail.com',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.02,left: MediaQuery.of(context).size.width*0.1),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: AutoSizeText(
                                            '200.88\$',
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.visible,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                            ),
                                          ),
                                        ),
                                        height: MediaQuery.of(context).size.height*0.07,
                                        width: MediaQuery.of(context).size.width*0.15,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ):
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),

                    ),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.38,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02)),
                      child: Padding(
                        padding:  EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.047,
                            left:MediaQuery.of(context).size.height*0.02,
                            right:MediaQuery.of(context).size.height*0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.04,
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
                                    height: MediaQuery.of(context).size.height*0.04,
                                    width: MediaQuery.of(context).size.width*0.3,
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
                                    height: MediaQuery.of(context).size.height*0.04,
                                    width: MediaQuery.of(context).size.width*0.2,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.03,
                              width: MediaQuery.of(context).size.width*0.5,

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
                              height: MediaQuery.of(context).size.height*0.03,
                              width: MediaQuery.of(context).size.width*0.5,

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
                              height: MediaQuery.of(context).size.height*0.03,
                              width: MediaQuery.of(context).size.width*0.5,

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
                              height:MediaQuery.of(context).size.height*0.06,
                              width: MediaQuery.of(context).size.width*0.9,
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
                              height: MediaQuery.of(context).size.height*0.04,
                              width: MediaQuery.of(context).size.width*0.6,
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
                                      size:25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        width: MediaQuery.of(context).size.width*0.22,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Colors.grey,
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
                                      height: MediaQuery.of(context).size.height*0.026,
                                      color: Color(0xFF566357)
                                          .withOpacity(0.35),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        width: MediaQuery.of(context).size.width*0.22,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Colors.grey,
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
                                  size:25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02,),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.03,
                                    width: MediaQuery.of(context).size.width*0.7,
                                    child: Align(
                                      child: AutoSizeText(
                                        'tayyahyazan@gmail.com',
                                        style: TextStyle(
                                          color: Colors.grey,
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
        MediaQuery
            .of(context)
            .size
            .width>500?Positioned(
            left: MediaQuery.of(context).size.width*0.01,
            right: MediaQuery.of(context).size.width*0.01,
            bottom:  MediaQuery.of(context).size.height*0.37,
            child:  imageCard(context)):Positioned(
            left: MediaQuery.of(context).size.width*0.01,
            right: MediaQuery.of(context).size.width*0.01,
            bottom:  MediaQuery.of(context).size.height*0.339,
            child:  imageCard(context)),
      ],
    );
  }
  Widget imageCard(BuildContext context,) {
    return LayoutBuilder(

        builder: (context,constraints) {
          return MediaQuery.of(context).size.width>500?Container(
            width: MediaQuery.of(context).size.width*0.83,
            height: MediaQuery.of(context).size.height*0.37,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.83,
                      height: MediaQuery.of(context).size.height * 0.37,
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
                      left: MediaQuery.of(context).size.width*0.45,
                      top: MediaQuery.of(context).size.height*0.012,
                      child: GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1 ,
                          height: MediaQuery.of(context).size.height*0.05,


                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imgList.map((url) {
                              int index = 3;
                              return Container(
                                width: MediaQuery.of(context).size.width*0.01,
                                height: MediaQuery.of(context).size.height*0.02,
                                margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height*0.002, horizontal:  MediaQuery.of(context).size.width*0.0001,),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.002,),
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
                      height: MediaQuery.of(context).size.height * 0.35,
                      left: MediaQuery.of(context).size.width * 0.03,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Row(
                              children: imgList.map((url) {
                                int index = imgList.indexOf(url);
                                return Container(
                                  width: MediaQuery.of(context).size.width*0.01,
                                  height: MediaQuery.of(context).size.width*0.01,
                                  margin: EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context).size.height*0.009, horizontal:  MediaQuery.of(context).size.width*0.0025,),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.002,),
                                      shape: BoxShape.circle,
                                      color: _current == index
                                          ? Palette.actHubGreen
                                          : Palette.white),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.83,
                            height: MediaQuery.of(context).size.height*0.07,
                            child: Center(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('Images/like.svg',
                                          height:  MediaQuery.of(context).size.height*0.04, color: Palette.actHubYellow),
                                      Padding(
                                        padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.01,),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.1,
                                          width: MediaQuery.of(context).size.width*0.07,
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
                                  Padding(
                                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('Images/dislike.svg',
                                            height:  MediaQuery.of(context).size.height*0.04, color: Palette.actHubYellow),
                                        Padding(
                                          padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.01,),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.07,
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
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.12),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('Images/view.svg',
                                            height:  MediaQuery.of(context).size.height*0.04, color: Palette.actHubYellow),
                                        Padding(
                                          padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.01,),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.07,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ):Container(
            width: MediaQuery.of(context).size.width*0.83,
            height: MediaQuery.of(context).size.height*0.5,
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.83,
                        height: MediaQuery.of(context).size.height * 0.5,
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
                        left: MediaQuery.of(context).size.width*0.73,
                        top: MediaQuery.of(context).size.height*0.009 ,
                        child: GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12 ,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: imgList.map((url) {
                                int index = 3;
                                return Container(
                                  width: constraints.maxWidth>constraints.maxHeight?
                                  MediaQuery.of(context).size.height*0.008:
                                  MediaQuery.of(context).size.width*0.018,
                                  height: constraints.maxWidth>constraints.maxHeight?
                                  MediaQuery.of(context).size.height*0.005:
                                  MediaQuery.of(context).size.width*0.01,
                                  margin: EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context).size.height*0.005, horizontal:  MediaQuery.of(context).size.width*0.001,),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.002,),
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
                        height: MediaQuery.of(context).size.height * 0.48,
                        left: MediaQuery.of(context).size.width * 0.05,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imgList.map((url) {
                                  int index = imgList.indexOf(url);
                                  return Container(
                                    width: MediaQuery.of(context).size.width*0.015,
                                    height: MediaQuery.of(context).size.width*0.015,
                                    margin: EdgeInsets.symmetric(
                                      vertical: MediaQuery.of(context).size.height*0.009, horizontal:  MediaQuery.of(context).size.width*0.0025,),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.002,),
                                        shape: BoxShape.circle,
                                        color: _current == index
                                            ? Palette.actHubGreen
                                            : Palette.white),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('Images/like.svg',
                                          height:  MediaQuery.of(context).size.height*0.025, color: Palette.actHubYellow),
                                      Padding(
                                        padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.025,),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.07,
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
                                          height:  MediaQuery.of(context).size.height*0.025, color: Palette.actHubYellow),
                                      Padding(
                                        padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.025,),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.07,
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
                                          height: MediaQuery.of(context).size.height*0.025, color: Palette.actHubYellow),
                                      Padding(
                                        padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.025,),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.07,
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
    );
  }
}
