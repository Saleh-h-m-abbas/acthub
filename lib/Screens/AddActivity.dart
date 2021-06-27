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
    bool isPressed=false;
    double allWidth =MediaQuery.of(context).size.width;
    double allHeight = MediaQuery.of(context).size.height;
    if(allWidth>=allHeight){
      setState(() {
        allWidth=MediaQuery.of(context).size.height*1.5;
        allHeight=MediaQuery.of(context).size.width;
      });
    }
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

        toolbarHeight: allHeight*0.1,
      ),
      body: Container(

        child: SingleChildScrollView(
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:15 ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: allHeight*1.8,
                        width: allWidth*0.8,
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
                                      height: allHeight*0.04,
                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Title',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                  elevation: 5,
                                  child: Container(
                                      height: allHeight*0.06,
                                      width: allWidth*0.8,
                                      decoration: const BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child:TextField(
                                        cursorWidth: 2,
                                        cursorHeight:
                                        allHeight * 0.03,
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
                                        ),
                                        onTap: (){
                                          setState(() {
                                            isPressed=false;
                                          });
                                        },//decorat input text
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
                                      height: allHeight*0.04,

                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Description',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                  elevation: 5,
                                  child: Container(
                                      height: allHeight*0.12,
                                      width: allWidth*0.8,
                                      decoration: const BoxDecoration(
                                        color: Palette.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child:TextField(
                                        cursorWidth: 2,
                                        cursorHeight:
                                        allHeight * 0.03,
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
                                      height: allHeight*0.04,
                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Price',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
                                ),
                                Center(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                    elevation: 5,
                                    child: Container(
                                        height: allHeight*0.06,
                                        width: allWidth*0.4,
                                        decoration: const BoxDecoration(
                                          color: Palette.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child:TextField(
                                          cursorWidth: 2,
                                          cursorHeight:
                                          allHeight * 0.03,
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
                                      height: allHeight*0.04,
                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Dates',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
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
                                          shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                          elevation: 5,
                                          child: Container(
                                            height: allHeight*0.06,
                                            width: allWidth*0.38,
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
                                          shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                          elevation: 5,
                                          child: Container(
                                            height: allHeight*0.06,
                                            width: allWidth*0.38,
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
                                      height: allHeight*0.04,
                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Category',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
                                ),
                                Container(
                                  height: allHeight*0.1,
                                  width: allWidth*0.8,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: allHeight*0.06,
                                        width: allWidth*0.8,
                                        child: Center(
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                                elevation: 5,
                                                child: Container(
                                                    height: allHeight*0.06,
                                                    width: allWidth*0.3,
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
                                                shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                                elevation: 5,
                                                child: Container(
                                                    height: allHeight*0.06,
                                                    width: allWidth*0.3,
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
                                                shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                                elevation: 5,
                                                child: Container(
                                                    height: allHeight*0.06,
                                                    width: allWidth*0.3,
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
                                                shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                                elevation: 5,
                                                child: Container(
                                                    height: allHeight*0.06,
                                                    width: allWidth*0.3,
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
                                      height: allHeight*0.04,
                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Activity Location',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                  elevation: 5,
                                  child: Container(
                                      height: allHeight*0.06,
                                      width: allWidth*0.56,
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
                                      height: allHeight*0.03,
                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Image',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                  elevation: 5,
                                  child: Container(
                                      height: allHeight*0.3,
                                      width: allWidth*0.7,
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
                                      height: allHeight*0.04,
                                    ) ,
                                    title: Container(
                                        height: allHeight*0.03,
                                        child: AutoSizeText('Video',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.actHubGreen,
                                              fontSize: 20),
                                          maxLines: 1,
                                        )
                                    ),
                                    horizontalTitleGap: allWidth*0.01
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: isPressed?Palette.orange:Palette.actHubGreen.withOpacity(0.33),
                                  elevation: 5,
                                  child: Container(
                                      height: allHeight*0.3,
                                      width: allWidth*0.7,
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
                              height: allHeight*0.08,

                            )


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -8,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        child: Container(
                          height: 60,
                          width: 140,
                          decoration: BoxDecoration(

                            shape: BoxShape.rectangle,
                          ),
                          child: Center(
                            child: Text('Submit',style: TextStyle(
                                color: Palette.orange,fontSize: 30,fontWeight: FontWeight.bold
                            ),



                            ),
                          ),
                        ),

                      ),
                      onTap: (){},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}