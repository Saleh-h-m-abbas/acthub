import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:shimmer/shimmer.dart';

import 'Palette.dart';

class ShimmerAnimation {
  Widget homePageShimmerAnimation(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Color(0xffE0E0E0),
          child: Column(
            children: [
              // the first list view
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.22,
                        color: Palette.actHubGreen.withOpacity(0.35),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.22,
                      color: Palette.actHubGreen.withOpacity(0.35),
                    ),
                  ],
                ),
              ),
              //the second list view
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      children: [
                        CetegoryWidget1(context),
                        SizedBox(
                          width: 5,
                        ),
                        CetegoryWidget1(context),
                        SizedBox(
                          width: 5,
                        ),
                        CetegoryWidget1(context),
                        SizedBox(
                          width: 5,
                        ),
                        CetegoryWidget1(context),
                        SizedBox(
                          width: 5,
                        ),
                        CetegoryWidget1(context),
                        SizedBox(
                          width: 5,
                        ),
                        CetegoryWidget1(context),
                      ],
                    ),
                  ),
                ],
              ),
              // //the search bar
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Palette.actHubGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.87,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // the 3rd list view
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 270,
                  width: double.infinity,
                  child: StaggeredGridView.countBuilder(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 4,
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 5,
                    ),
                    staggeredTileBuilder: (int index) => index % 3 == 0
                        ? StaggeredTile.count(4, 2.5)
                        : StaggeredTile.count(2, 3),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding Adv_example_card1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.22,
        ),
      ),
    );
  }

  GFImageOverlay CetegoryWidget1(BuildContext context) {
    return GFImageOverlay(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(20.0),
      borderRadius: BorderRadius.circular(10),
      image: null,
      colorFilter:
          new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
    );
  }
}
