import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

final List<String> imgList = [
  'https://www.routesnorth.com/wp-content/uploads/2019/04/kjerag-boulder.jpg',
  'https://static.bhphotovideo.com/explora/sites/default/files/styles/top_shot/public/New-Hiking.jpg?itok=p0tfoXXi',
  'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,g_xy_center,h_800,q_50,w_640,x_576,y_183/v1/clients/texas/ritaarias17_instagram_5053966003_68c2771e-bece-4fe0-81d5-59ac10ef4622.jpg'
];

List<Widget> slider(BuildContext context) {
  return imgList
      .map(
        (item) => Container(
          width: MediaQuery.of(context).size.width * 0.85,
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
              backgroundColor: Palette.orange,
              title: Column(
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
                    color: Colors.pink,

                    child: AutoSizeText(
                      'Hiking', // name of activity
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Palette.orange),
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
                      color: Colors.pink,
                      child: AutoSizeText(
                        'Outdoor activites',
                        overflow: TextOverflow.visible, //name of main category
                        style: TextStyle(
                          fontSize: 14,
                          color: Palette.actHubGreen.withOpacity(0.35),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              actions: [
                Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.0242,right: MediaQuery.of(context).size.width*0.0242 ),
                      child: CircleAvatar(
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
                            .width * 0.07,
                        backgroundImage: NetworkImage(
                            'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.14,),
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .width > 500
                            ? MediaQuery
                            .of(context)
                            .size
                            .width * 0.015 : MediaQuery
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
            body: Container(
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
                SizedBox(height:MediaQuery.of(context).size.height*0.4),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),

                  ),
                  elevation: 5,
                  child: Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(MediaQuery.of(context).size.height*0.02)),
                      child: Padding(
                        padding:  EdgeInsets.only(
                          top: MediaQuery.of(context).size.height*0.15,
                          left:MediaQuery.of(context).size.height*0.07,
                          right:  MediaQuery.of(context).size.height*0.07,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.04,
                                  width:constraints.maxWidth*0.4,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: AutoSizeText(
                                          'Hiking Tour',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                          ),
                                        ),
                                        height: MediaQuery.of(context).size.height*0.03,
                                        width: MediaQuery.of(context).size.width*0.234,
                                      ),
                                      Container(
                                        child: AutoSizeText(
                                          '200\$',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Palette.actHubGreen,
                                          ),
                                        ),
                                        height: MediaQuery.of(context).size.height*0.028,
                                        width: MediaQuery.of(context).size.width*0.1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.03,
                                  width:constraints.maxWidth*0.4,
                                  child: AutoSizeText(
                                    'Difficulty level: Medium',
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.actHubGreen,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.025,
                                  width:constraints.maxWidth*0.4,
                                  child: AutoSizeText(
                                    '7Km long',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.actHubGreen,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.025,
                                  width:constraints.maxWidth*0.4,
                                  child: AutoSizeText(
                                    'From Ain Fawar to Wadi Qelt\n',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.actHubGreen,
                                    ),
                                  ),
                                ),
                                Container(
                                  height:MediaQuery.of(context).size.height*0.05,
                                  width:constraints.maxWidth*0.4,
                                  child: AutoSizeText(
                                    'Unlock your full potential with our hiking tour.Explore the best hiking sights with us!!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Palette.actHubGreen,
                                    ),

                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height*0.009,
                                      bottom: MediaQuery.of(context).size.height*0.009),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.022,
                                    width:constraints.maxWidth*0.2,
                                    child: AutoSizeText(
                                      'Guide : Yazan Tayyah',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.actHubGreen,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_enabled_rounded,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:MediaQuery.of(context).size.width*0.002),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.022,
                                        width:constraints.maxWidth*0.2,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                      padding: EdgeInsets.only(left:
                                      MediaQuery.of(context).size.width*0.002),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.022,
                                        width:constraints.maxWidth*0.2,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:
                                      MediaQuery.of(context).size.width*0.002,),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.022,
                                        width:constraints.maxWidth*0.2,
                                        child: AutoSizeText(
                                          'tayyahyazan@gmail.com',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
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
                SizedBox(height:MediaQuery.of(context).size.height*0.4),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),

                  ),
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02)),
                    child: Padding(
                      padding:  EdgeInsets.only(
                          top: MediaQuery.of(context).size.height*0.08,
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
                                  child: AutoSizeText(
                                    'Hiking Tour',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.actHubGreen,
                                    ),
                                  ),
                                  height: MediaQuery.of(context).size.height*0.03,
                                  width: MediaQuery.of(context).size.width*0.234,
                                ),
                                Container(
                                  child: AutoSizeText(
                                    '200\$',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.actHubGreen,
                                    ),
                                  ),
                                  height: MediaQuery.of(context).size.height*0.028,
                                  width: MediaQuery.of(context).size.width*0.1,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.03,
                            width: MediaQuery.of(context).size.width*0.5,
                            child: AutoSizeText(
                              'Difficulty level: Medium',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                color: Palette.actHubGreen,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.025,
                            width: MediaQuery.of(context).size.width*0.135,
                            child: AutoSizeText(
                              '7Km long',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                color: Palette.actHubGreen,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.025,
                            width: MediaQuery.of(context).size.width*0.4 ,
                            child: AutoSizeText(
                              'From Ain Fawar to Wadi Qelt\n',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                color: Palette.actHubGreen,
                              ),
                            ),
                          ),
                          Container(
                            height:MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.9,
                            child: AutoSizeText(
                              'Unlock your full potential with our hiking tour.Explore the best hiking sights with us!!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Palette.actHubGreen,
                              ),

                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                                top: MediaQuery.of(context).size.height*0.009, bottom: MediaQuery.of(context).size.height*0.009),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.03,
                              width: MediaQuery.of(context).size.width*0.43,
                              child: AutoSizeText(
                                'Guide : Yazan Tayyah',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.actHubGreen,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                                right: MediaQuery.of(context).size.width*0.025, bottom: MediaQuery.of(context).size.height*0.009),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_enabled_rounded,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.022,
                                        width: MediaQuery.of(context).size.width*0.22,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                        height: MediaQuery.of(context).size.height*0.022,
                                        width: MediaQuery.of(context).size.width*0.23,
                                        child: AutoSizeText(
                                          '+02 2815291',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02,),
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.022,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: AutoSizeText(
                                    'tayyahyazan@gmail.com',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
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
          left: MediaQuery.of(context).size.width*0.01,
            right: MediaQuery.of(context).size.width*0.01,
            child: imageCard(context)),
      ],
    );
  }
  Widget imageCard(BuildContext context,) {
    return LayoutBuilder(

      builder: (context,constraints) {
        return Container(
          width: MediaQuery.of(context).size.width*0.83,
          height: MediaQuery.of(context).size.height*0.52,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height:  MediaQuery.of(context).size.height*0.01,
                ),
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
                      top: MediaQuery.of(context).size.height*0.005 ,
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
                                MediaQuery.of(context).size.height*0.008:
                                MediaQuery.of(context).size.width*0.018,
                                margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height*0.009, horizontal:  MediaQuery.of(context).size.width*0.0025,),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.0025,),
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Palette.actHubGreen
                                        : Palette.white),
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
                                  width: constraints.maxWidth>constraints.maxHeight?
                                  MediaQuery.of(context).size.height*0.015:
                                  MediaQuery.of(context).size.width*0.025,
                                  height: constraints.maxWidth>constraints.maxHeight?
                                  MediaQuery.of(context).size.height*0.015:
                                  MediaQuery.of(context).size.width*0.025,
                                  margin: EdgeInsets.symmetric(
                                      vertical: MediaQuery.of(context).size.height*0.009, horizontal:  MediaQuery.of(context).size.width*0.0025,),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.0025,),
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
                                        height:  MediaQuery.of(context).size.height*0.03, color: Palette.actHubYellow),
                                    Padding(
                                      padding: EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.025,),
                                      child: AutoSizeText(
                                        '5',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Palette.actHubYellow),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('Images/dislike.svg',
                                        height:  MediaQuery.of(context).size.height*0.03, color: Palette.actHubYellow),
                                    Padding(
                                      padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.025,),
                                      child: AutoSizeText(
                                        '5',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Palette.actHubYellow),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('Images/view.svg',
                                        height: MediaQuery.of(context).size.height*0.03, color: Palette.actHubYellow),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width*0.025, right:  MediaQuery.of(context).size.width*0.027,),
                                      child: AutoSizeText(
                                        '5',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Palette.actHubYellow),
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
