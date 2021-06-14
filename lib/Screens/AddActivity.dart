import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
class AddActivity extends StatefulWidget {

  static const String id = 'AddActivity';
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  @override
  Widget build(BuildContext context) {
    int index =0;
    return Scaffold(
      backgroundColor:Palette.scaffold,
      appBar: AppBar(
        elevation: 0,

       title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Add',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Palette.orange),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: AutoSizeText(
                'We are together',
                style: TextStyle(
                  fontSize: 14,
                  color: Palette.actHubGreen.withOpacity(0.35),
                ),
              ),
            )
          ],
        ),

        backgroundColor: Palette.scaffold,

        toolbarHeight: MediaQuery.of(context).size.height*0.1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Card(
        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height*1.8,
                        width: MediaQuery.of(context).size.width*0.8,

                        decoration: const BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                     'Images/title.png',
                                      height: MediaQuery.of(context).size.height*0.04,
                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Title',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: Palette.orange,
                                  elevation: 10,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.06,
                                    width: MediaQuery.of(context).size.width*0.8,
                                    decoration: const BoxDecoration(
                                      color: Palette.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child:TextField(
                                      cursorWidth: 2,
                                      cursorHeight:
                                      MediaQuery.of(context).size.height * 0.03,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(

                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        //to put border color white when the textfiled not clicked
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        //to set border color grey when the textfiled clicked
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                        ), //to set the color of hint black
                                      ), //decorat input text
                                    )

                                  ),

                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                      'Images/description.png',
                                      height: MediaQuery.of(context).size.height*0.04,

                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Description',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: Palette.orange,
                                  elevation: 10,
                                  child: Container(
                                      height: MediaQuery.of(context).size.height*0.12,
                                      width: MediaQuery.of(context).size.width*0.8,
                                      decoration: const BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child:TextField(
                                        cursorWidth: 2,
                                        cursorHeight:
                                        MediaQuery.of(context).size.height * 0.03,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(

                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          //to put border color white when the textfiled not clicked
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          //to set border color grey when the textfiled clicked
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                          ), //to set the color of hint black
                                        ), //decorat input text
                                      )

                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                      'Images/price.png',
                                      height: MediaQuery.of(context).size.height*0.04,
                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Price',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                                Center(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadowColor: Palette.orange,
                                    elevation: 10,
                                    child: Container(
                                        height: MediaQuery.of(context).size.height*0.06,
                                        width: MediaQuery.of(context).size.width*0.4,
                                        decoration: const BoxDecoration(
                                          color: Palette.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child:TextField(
                                          cursorWidth: 2,
                                          cursorHeight:
                                          MediaQuery.of(context).size.height * 0.03,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                            ),
                                            //to put border color white when the textfiled not clicked
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                              borderSide: BorderSide(color: Colors.white),
                                            ),
                                            //to set border color grey when the textfiled clicked
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                            ),
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.only(top:10.0,left: 15),
                                              child: Text(  '\$',
                                              style: TextStyle(
                                                color: Palette.orange,
                                                fontSize: 25
                                              ),
                                           ),
                                            )//to set the color of hint black
                                          ),

                                          //decorat input text
                                        )

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                      'Images/calendar.png',
                                      height: MediaQuery.of(context).size.height*0.04,
                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Dates',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left:12.0),
                                         child: Text('Start Date'),
                                       ),
                                       Card(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(20),
                                         ),
                                         shadowColor: Palette.orange,
                                         elevation: 10,
                                         child: Container(
                                             height: MediaQuery.of(context).size.height*0.06,
                                             width: MediaQuery.of(context).size.width*0.38,
                                             decoration: const BoxDecoration(
                                               color: Palette.white,
                                               borderRadius: BorderRadius.all(
                                                 Radius.circular(20),
                                               ),
                                             ),
                                             child:FlatButton(

                                                 child: FittedBox(
                                                   fit: BoxFit.contain,
                                                   child: Text.rich(
                                                     TextSpan(
                                                       style: Theme.of(context)
                                                           .textTheme
                                                           .headline4,
                                                       children: [
                                                         WidgetSpan(
                                                           child: Text('Start Date')
                                                         ),
                                                         WidgetSpan(
                                                           child: Icon(
                                                             Icons.keyboard_arrow_down,
                                                             color: Palette.orange
                                                           ),
                                                         ),
                                                         WidgetSpan(
                                                           child: SizedBox(width: 10),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                 )),

                                         ),
                                       ),
                                     ],
                                   ),
                                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left:12.0),
                                         child: Text('End Date'),
                                       ),
                                       Card(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(20),
                                         ),
                                         shadowColor: Palette.orange,
                                         elevation: 10,
                                         child: Container(
                                             height: MediaQuery.of(context).size.height*0.06,
                                             width: MediaQuery.of(context).size.width*0.38,
                                             decoration: const BoxDecoration(
                                               color: Palette.white,
                                               borderRadius: BorderRadius.all(
                                                 Radius.circular(20),
                                               ),
                                             ),
                                           child:FlatButton(

                                               child: FittedBox(
                                                 fit: BoxFit.contain,
                                                 child: Text.rich(
                                                   TextSpan(
                                                     style: Theme.of(context)
                                                         .textTheme
                                                         .headline4,
                                                     children: [
                                                       WidgetSpan(
                                                           child: Text('End Date')
                                                       ),
                                                       WidgetSpan(
                                                         child: Icon(
                                                             Icons.keyboard_arrow_down,
                                                             color: Palette.orange
                                                         ),
                                                       ),
                                                       WidgetSpan(
                                                         child: SizedBox(width: 10),
                                                       ),

                                                     ],
                                                   ),
                                                 ),
                                               )),

                                         ),
                                       ),
                                     ],
                                   )
                                 ],
                               )

                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                      'Images/category.png',
                                      height: MediaQuery.of(context).size.height*0.04,
                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Category',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                               Container(
                                 height: MediaQuery.of(context).size.height*0.1,
                                 width: MediaQuery.of(context).size.width*0.8,
                                 child: Column(
                                   children: [
                                     Container(
                                       height: MediaQuery.of(context).size.height*0.06,
                                       width: MediaQuery.of(context).size.width*0.8,
                                       child: Center(
                                         child: ListView(
                                           scrollDirection: Axis.horizontal,
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                shadowColor: Palette.orange,
                                                elevation: 10,
                                                child: Container(
                                                    height: MediaQuery.of(context).size.height*0.06,
                                                    width: MediaQuery.of(context).size.width*0.3,
                                                    decoration: const BoxDecoration(
                                                      color: Palette.white,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                    ),
                                                    child:Center(child: Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: AutoSizeText('Hiking',
                                                        style: TextStyle(
                                                            color: Palette.actHubGreen,
                                                            fontSize: 20),
                                                        maxLines: 1,
                                                      ),
                                                    ))

                                                ),
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                shadowColor: Palette.orange,
                                                elevation: 10,
                                                child: Container(
                                                    height: MediaQuery.of(context).size.height*0.06,
                                                    width: MediaQuery.of(context).size.width*0.3,
                                                    decoration: const BoxDecoration(
                                                      color: Palette.white,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                    ),
                                                    child:Center(child: Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: AutoSizeText('Hiking',
                                                        style: TextStyle(
                                                            color: Palette.actHubGreen,
                                                            fontSize: 20),
                                                        maxLines: 1,
                                                      ),
                                                    ))

                                                ),
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                shadowColor: Palette.orange,
                                                elevation: 10,
                                                child: Container(
                                                    height: MediaQuery.of(context).size.height*0.06,
                                                    width: MediaQuery.of(context).size.width*0.3,
                                                    decoration: const BoxDecoration(
                                                      color: Palette.white,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                    ),
                                                    child:Center(child: Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: AutoSizeText('Hiking',
                                                        style: TextStyle(
                                                            color: Palette.actHubGreen,
                                                            fontSize: 20),
                                                        maxLines: 1,
                                                      ),
                                                    ))

                                                ),
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                shadowColor: Palette.orange,
                                                elevation: 10,
                                                child: Container(
                                                    height: MediaQuery.of(context).size.height*0.06,
                                                    width: MediaQuery.of(context).size.width*0.3,
                                                    decoration: const BoxDecoration(
                                                      color: Palette.white,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                    ),
                                                    child:Center(child: Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: AutoSizeText('Hiking',
                                                        style: TextStyle(
                                                            color: Palette.actHubGreen,
                                                            fontSize: 20),
                                                        maxLines: 1,
                                                      ),
                                                    ))

                                                ),
                                              ),
                                            ],
                                          ),
                                       ),
                                     ),
                                     Container(
                                       width: MediaQuery.of(context).size.width * 0.1,
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children:[
                                           Container(
                                           width:
                                           MediaQuery.of(context).size.height*0.015,
                                         height:  MediaQuery.of(context).size.width*0.025,
                                           margin: EdgeInsets.symmetric(
                                             vertical: MediaQuery.of(context).size.height*0.009, horizontal:  MediaQuery.of(context).size.width*0.0025,),
                                           decoration: BoxDecoration(
                                               border: Border.all(
                                                 color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.0025,),
                                               shape: BoxShape.circle,
                                               color:  index ==0
                                                   ? Palette.actHubGreen
                                                   : Palette.white),
                                         ),
                                           Container(
                                             width:
                                             MediaQuery.of(context).size.height*0.015,
                                             height:  MediaQuery.of(context).size.width*0.025,
                                             margin: EdgeInsets.symmetric(
                                               vertical: MediaQuery.of(context).size.height*0.009, horizontal:  MediaQuery.of(context).size.width*0.0025,),
                                             decoration: BoxDecoration(
                                                 border: Border.all(
                                                   color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.0025,),
                                                 shape: BoxShape.circle,
                                                 color:  index ==1
                                                     ? Palette.actHubGreen
                                                     : Palette.white),
                                           ),
                                           Container(
                                             width:
                                             MediaQuery.of(context).size.height*0.015,
                                             height:  MediaQuery.of(context).size.width*0.025,
                                             margin: EdgeInsets.symmetric(
                                               vertical: MediaQuery.of(context).size.height*0.009, horizontal:  MediaQuery.of(context).size.width*0.0025,),
                                             decoration: BoxDecoration(
                                                 border: Border.all(
                                                   color: Palette.actHubGrey, width:  MediaQuery.of(context).size.width*0.0025,),
                                                 shape: BoxShape.circle,
                                                 color:  index ==1
                                                     ? Palette.actHubGreen
                                                     : Palette.white),
                                           )
                                         ]
                                       ),
                                     ),
                                   ],
                                 ),

                               )
                                ,
                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                      'Images/location1.png',
                                      height: MediaQuery.of(context).size.height*0.04,
                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Activity Location',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: Palette.orange,
                                  elevation: 10,
                                  child: Container(
                                      height: MediaQuery.of(context).size.height*0.06,
                                      width: MediaQuery.of(context).size.width*0.56,
                                      decoration: const BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child:Center(child: AutoSizeText('Palestine,Ramallah',
                                        style: TextStyle(

                                            color: Palette.actHubGreen,
                                            fontSize: 20),
                                        maxLines: 1,
                                      ))

                                  ),
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                      'Images/image.png',
                                      height: MediaQuery.of(context).size.height*0.03,
                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Image',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: Palette.orange,
                                  elevation: 10,
                                  child: Container(
                                      height: MediaQuery.of(context).size.height*0.3,
                                      width: MediaQuery.of(context).size.width*0.7,
                                      decoration: const BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child:Center(child:
                                      Image.asset('Images/image.png'))

                                  ),
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                    leading:Image.asset(
                                      'Images/video.png',
                                      height: MediaQuery.of(context).size.height*0.04,
                                    ) ,
                                    title: Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        child: AutoSizeText('Video',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: MediaQuery.of(context).size.width*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: Palette.orange,
                                  elevation: 10,
                                  child: Container(
                                      height: MediaQuery.of(context).size.height*0.3,
                                      width: MediaQuery.of(context).size.width*0.7,
                                      decoration: const BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child:Center(child:

                                      Image.asset('Images/v1.png',))

                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.08,
                            )


                          ],
                        ),
                      ),
                    ),
                  ),
                          GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 10,
                              child: Container(
                             height: 60,
                             width: 60,
                        decoration: BoxDecoration(

                                shape: BoxShape.circle,
                        ),
                             child: Icon(Icons.add,
                               size: 50,
                               color: Palette.orange,


                  ),
                      ),

                            ),
                            onTap: (){

                            },

                          )
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width*0.4,
                child: Image.asset('Images/ActHubG.png',fit: BoxFit.contain,)),
          ],
        ),
      ),
    );
  }
}
