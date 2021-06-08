import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
class SubCategoryPage extends StatefulWidget {
  static const String id = 'SubCategoryPage';

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}
class _SubCategoryPageState extends State<SubCategoryPage> {
  bool isGuest = true;
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
        toolbarHeight: MediaQuery.of(context).size.height*0.074,
        elevation: 0,
        backgroundColor: Palette.scaffold,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width*0.55,
              child: AutoSizeText(
                'Discover',
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Palette.orange),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.03,
                width: MediaQuery.of(context).size.width*0.5,
                child: AutoSizeText(
                  'Outdoor activities',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
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
          Padding(
            padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.15, top: MediaQuery.of(context).size.height*0.01),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height*0.03,
                  backgroundColor: Palette.white,
                  backgroundImage:isGuest? AssetImage('Images/gusetProfilepic.png'):NetworkImage(
                      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                ),
               isGuest ? Container() : Positioned(
                   top: 35,
                   left: 0,
                   child: Container(
                     height: 15,
                     width: 15,
                     decoration: BoxDecoration(
                         color: Palette.online,
                         shape: BoxShape.circle,
                         border: Border.all(width: 2.0, color: Palette.white)),
                   )),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
      Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.007),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.37,
          width: MediaQuery.of(context).size.width,

          child: Main_Category_Card(
              context,
              "Hiking Tour",
              "Unlock your full potential with our hiking tour." +
                  "Explore the best hiking sights with us!!"),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Sub_Category_Card(context, 'Hiking'),
              Sub_Category_Card(context, 'Hiking')
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
    Widget Main_Category_Card(
      BuildContext context, String category, String description) {
    return CarouselSlider.builder(
      itemCount: 3,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.5,
          enlargeCenterPage:false,
      ),
      itemBuilder: (context, index, realIdx) {
        return Card(
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

              ),
              Positioned(
                top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.22,
                left: MediaQuery
                    .of(context)
                    .size
                    .width * 0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.045,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: AutoSizeText(
                        '$category',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      height: MediaQuery.of(context).size.height*0.07,
                      child: AutoSizeText(
                        '$description',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
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
        );
      }
    );
  }
  Padding Sub_Category_Card(BuildContext context, String subCategory) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Row(
        children: [
          Stack(
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
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.045,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: AutoSizeText(
                      '$subCategory',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.19,
              ),
            ],
          ),
          Stack(
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
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.045,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: AutoSizeText(
                      '$subCategory',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.19,
              ),
            ],
          )
        ],
      ),
    );
  }
}
