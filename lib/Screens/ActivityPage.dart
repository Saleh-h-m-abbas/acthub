import 'package:acthub/Classes/Palette.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        height: MediaQuery.of(context).size.height * 0.9,
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 110, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Hiking Tour',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.actHubGreen,
                                        ),
                                      ),
                                      Text(
                                        '200\$',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.actHubGreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Difficulty level: Medium',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen,
                                  ),
                                ),
                                Text(
                                  '7Km long',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen,
                                  ),
                                ),
                                Text(
                                  'From Ain Fawar to Wadi Qelt\n',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.actHubGreen,
                                  ),
                                ),
                                Text(
                                  'Unlock your full potential with our hiking tour.\nExplore the best hiking sights with us!!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Palette.actHubGreen,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 15),
                                  child: Text(
                                    'Guide : Yazan Tayyah',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.actHubGreen,
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
                                            child: Text(
                                              '+02 2815291',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
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
                                            child: Text(
                                              '+02 2815291',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
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
                                      child: Text(
                                        'tayyahyazan@gmail.com',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
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
                ),
              ),
            ),
            imageCard(context),
          ],
        ),
      ),
    );
  }

  Widget imageCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: CarouselSlider(
                    items: slider(context),
                    options: CarouselOptions(
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
