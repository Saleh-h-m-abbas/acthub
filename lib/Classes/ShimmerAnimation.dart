import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'Palette.dart';
class ShimmerAnimation{
  Widget homePageShimmerAnimation(BuildContext context){
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Palette.scaffold,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Palette.orange,
                  ),),
                Padding(
                  padding: const EdgeInsets.only(left: 65.0),
                  child: Text('Have a nice day',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Palette.actHubGreen.withOpacity(0.72),
                      )),
                )
              ],),
          ],
        ),
        actions: [
          Shimmer.fromColors(
            baseColor: Palette.actHubGreen.withOpacity(0.35),
            highlightColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.5,right: 10),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Palette.actHubGreen.withOpacity(0.35),
                  ),


                ],
              ),
            ),
          )
        ],
      ),
      body:Shimmer.fromColors(
        baseColor: Palette.actHubGreen.withOpacity(0.35),
        highlightColor: Colors.white,
        child: Column(
          children: [
            // the first list view
            Container(
              height:MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 10, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height:MediaQuery.of(context).size.height*0.22,
                      color: Palette.actHubGreen.withOpacity(0.35),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    height:MediaQuery.of(context).size.height*0.22,
                    color: Palette.actHubGreen.withOpacity(0.35),
                  ),

                ],
              ),
            ),
            //the second list view
            Column(
              children: [
                SizedBox(height:10,),
                Container(
                  height:MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.22,
                              height:MediaQuery.of(context).size.height*0.22,
                              color: Palette.actHubGreen.withOpacity(0.35),),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.22,
                                height:MediaQuery.of(context).size.height*0.22,
                                color: Palette.actHubGreen.withOpacity(0.35),)
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.22,
                              height:MediaQuery.of(context).size.height*0.22,
                              color: Palette.actHubGreen.withOpacity(0.35),),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.22,
                                height:MediaQuery.of(context).size.height*0.22,
                                color: Palette.actHubGreen.withOpacity(0.35),)
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.22,
                              height:MediaQuery.of(context).size.height*0.22,
                              color: Palette.actHubGreen.withOpacity(0.35),),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.22,
                                height:MediaQuery.of(context).size.height*0.22,
                                color: Palette.actHubGreen.withOpacity(0.35),)
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.22,
                              height:MediaQuery.of(context).size.height*0.22,
                              color: Palette.actHubGreen.withOpacity(0.35),),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.22,
                                height:MediaQuery.of(context).size.height*0.22,
                                color: Palette.actHubGreen.withOpacity(0.35),)
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.08,
                              height:MediaQuery.of(context).size.height*0.22,
                              color: Palette.actHubGreen.withOpacity(0.35),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.08,
                              height:MediaQuery.of(context).size.height*0.22,
                              color: Palette.actHubGreen.withOpacity(0.35),
                            ),)
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height:10,),
              ],
            ),
            // //the search bar
            Card(
              color: Palette.actHubGreen.withOpacity(0.35),
              child: Container(

                height:MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width*0.87,


              ),
            ),
            SizedBox(height:10,),
            // the 3rd list view
            Container(
              height:MediaQuery.of(context).size.width*0.65,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,),
                    child: Column(
                      children: [
                        Container(
                          color: Palette.actHubGreen.withOpacity(0.35),

                          width:MediaQuery.of(context).size.width*0.42,
                          height:MediaQuery.of(context).size.width*0.3,


                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            color: Palette.actHubGreen.withOpacity(0.35),

                            width:MediaQuery.of(context).size.width*0.42,
                            height:MediaQuery.of(context).size.width*0.3,


                          ),
                        ),
                      ],
                    ),


                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      color: Palette.actHubGreen.withOpacity(0.35),

                      width:MediaQuery.of(context).size.width*0.43,
                      height:MediaQuery.of(context).size.width*0.65,


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
  Widget MapPageShimmerAnimation(BuildContext context){
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.15,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Discover',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Palette.orange,
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 65.0),
                          child: Text('Near You',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Palette.orange,
                              )),
                        )
                      ],),
                  ),
                  Shimmer.fromColors(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Palette.actHubGreen.withOpacity(0.35),
                      ),
                    ),
                    baseColor: Palette.actHubGreen.withOpacity(0.35),
                    highlightColor: Colors.white,
                  ),
                ],
              ),
            ),
            Shimmer.fromColors(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height ,
                color: Palette.actHubGreen.withOpacity(0.35),
              ),
              baseColor: Palette.actHubGreen.withOpacity(0.35),
              highlightColor: Colors.white,
            ),


          ],
        ),
      ),


    );

  }
}