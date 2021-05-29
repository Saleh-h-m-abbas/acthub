import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubCategoryPage extends StatefulWidget {
  static const String id = 'SubCategoryPage';

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
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
              'Discover',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Palette.orange),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                'Outdoor activities',
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
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.37,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              children: [
                Main_Category_Card(
                    context,
                    "Hiking Tour",
                    "Unlock your full potential with our hiking tour." +
                        "Explore the best hiking sights with us!!"),
                Main_Category_Card(
                    context,
                    "Hiking Tour",
                    "Unlock your full potential with our hiking tour." +
                        "Explore the best hiking sights with us!!"),
                Main_Category_Card(
                    context,
                    "Hiking Tour",
                    "Unlock your full potential with our hiking tour." +
                        "Explore the best hiking sights with us!!"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Sub_Category_Card(context, "Hiking"),
                    Sub_Category_Card(context, "Camping"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Sub_Category_Card(context, "Climbing"),
                    Sub_Category_Card(context, "Biking"),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  Padding Main_Category_Card(
      BuildContext context, String category, String description) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaQU4Bm0cXJvDKldO7wUCeWFy_b8J8pzdIWA&usqp=CAU',
                    )),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.height * 0.37,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.22,
              left: MediaQuery.of(context).size.width * 0.04,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '$category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                      SvgPicture.asset(
                        'Images/Like.svg',
                        height: 22,
                        color: Color(0xFFFFD98E),
                      ),
                      Text(
                        ' 4',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: AutoSizeText(
                      '$description',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      minFontSize: 12,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding Sub_Category_Card(BuildContext context, String subCategory) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaQU4Bm0cXJvDKldO7wUCeWFy_b8J8pzdIWA&usqp=CAU',
                    )),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.18,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                '$subCategory',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.18,
          ),
        ],
      ),
    );
  }
}
