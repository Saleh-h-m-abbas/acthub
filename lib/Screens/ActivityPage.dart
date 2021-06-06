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
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Palette.actHubGreen,
            ),
            onPressed: () => Navigator.pop(context)),
        centerTitle: false,
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Palette.scaffold,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hiking', // name of activity
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Palette.orange),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                'Outdoor activites', //name of main category
                style: TextStyle(
                  fontSize: 14,
                  color: Palette.actHubGreen.withOpacity(0.35),
                ),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 52.0, top: 10.5),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                ),
                Positioned(
                    top: 35,
                    left: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Palette.online,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0, color: Palette.white)),
                    ))
              ],
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int section, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: textCard(context),
            );
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.9,
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            // autoPlay: false,
          ),
        ),
      ),
    );
  }

  Widget textCard(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),

              ),
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 46, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      Container(
                        height: MediaQuery.of(context).size.height*0.02,
                        width: MediaQuery.of(context).size.width*0.335,
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
                        height: MediaQuery.of(context).size.height*0.02,
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
                        height: MediaQuery.of(context).size.height*0.02,
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

                        height:MediaQuery.of(context).size.height*0.04,
                        width: MediaQuery.of(context).size.width*0.65,
                        child: AutoSizeText(
                          'Unlock your full potential with our hiking tour.\nExplore the best hiking sights with us!!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Palette.actHubGreen,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 15),
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
                        padding: const EdgeInsets.only(
                            right: 8.0, bottom: 10),
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
                                  padding: EdgeInsets.only(left: 8),
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
                                  height: 20,
                                  color: Color(0xFF566357)
                                      .withOpacity(0.35),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
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
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.022,
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Text(
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
        ),
        Positioned(
          left: 5,
            right: 5,
            child: imageCard(context)),
      ],
    );
  }

  Widget imageCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.83,
      height: MediaQuery.of(context).size.height*0.52,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
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
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Palette.actHubGrey, width: 2),
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
                                SvgPicture.asset('Images/Like.svg',
                                    height: 25, color: Palette.actHubYellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
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
                                    height: 25, color: Palette.actHubYellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
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
                                    height: 25, color: Palette.actHubYellow),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 13.0),
                                  child: Text(
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
}
