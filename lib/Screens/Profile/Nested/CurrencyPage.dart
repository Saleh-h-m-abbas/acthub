import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.85;
}
class CurrencyPage extends StatefulWidget {
  static const String id = 'Currency Page';
  const CurrencyPage({Key key}) : super(key: key);


  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  Color shadow = Palette.actHubGreen.withOpacity(0.33);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar:  AppBar(
        centerTitle: true,
        toolbarHeight: allHeight(context)*0.08,
        backgroundColor: Palette.scaffold,
        elevation: 0,
        title: AutoSizeText(
          'Currency',
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
          style: TextStyle(
            color: Palette.orange,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial_Rounded_MT",
            fontSize: 25,
          ),
        ),
        leading:  Container(
          height: MediaQuery.of(context).size.width * 0.05,
          width: MediaQuery.of(context).size.width * 0.15,
          child: FittedBox(
            fit: BoxFit.fill,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Palette.actHubGreen,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Hero(
              tag: 'search',
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  height:allHeight(context) * 0.06,
                  width: allWidth(context) * 0.87,
                  child: Center(
                    child: TextField(
                      cursorWidth: 2,
                      cursorHeight:
                      allHeight(context) * 0.03,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          size: allHeight(context)*0.03,
                          color: Palette.actHubGreen.withOpacity(0.33),
                        ),
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
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: allWidth(context)*0.9,
            height: allHeight(context)*0.68,
            child: ListView.builder(itemCount:10,itemBuilder: (BuildContext context, int index){
              return Padding(
                padding:EdgeInsets.only(top: 15.0),
                child: GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(allHeight(context)*0.02),
                    ),
                    elevation: 5,
                    shadowColor: shadow,
                    child: Container(
                      height: allHeight(context)*0.07,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(allHeight(context)*0.02),
                      ),
                      child: Center(
                        child: AutoSizeText('USD',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Segoe UI",

                          ),

                        ),
                      ),

                    ),
                  ),
                ),
              );
            }),
          ),
          SafeArea(child: Container(
              height: allHeight(context) * 0.1,
              width:allWidth(context) * 0.4,
              child: Image.asset(
                'Images/ActHubOLogo.png',
                fit: BoxFit.contain,
              )),),
        ],
      ):SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Hero(
                tag: 'search',
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    height:allHeight(context) * 0.06,
                    width: allWidth(context) * 0.87,
                    child: Center(
                      child: TextField(
                        cursorWidth: 2,
                        cursorHeight:
                        allHeight(context) * 0.03,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Palette.actHubGreen.withOpacity(0.33),
                            size:allHeight(context)*0.03,
                          ),
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: allWidth(context)*0.9,
              height: allHeight(context)*0.7,
              child: ListView.builder(itemCount:10,itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding:EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(allHeight(context)*0.02),
                      ),
                      elevation: 5,
                      shadowColor: shadow,
                      child: Container(
                        height: allHeight(context)*0.07,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(allHeight(context)*0.02),
                        ),
                        child: Center(
                          child: AutoSizeText('USD',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Segoe UI",

                            ),

                          ),
                        ),

                      ),
                    ),
                  ),
                );
              }),
            ),
            SafeArea(child: Container(
                height: allHeight(context) * 0.1,
                width:allWidth(context) * 0.4,
                child: Image.asset(
                  'Images/ActHubOLogo.png',
                  fit: BoxFit.contain,
                )),),
          ],
        ),
      ),

    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Demo for currency picker')),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         showCurrencyPicker(
    //           context: context,
    //           showFlag: true,
    //           showCurrencyName: true,
    //           showCurrencyCode: true,
    //           onSelect: (Currency currency) {
    //             print('Select currency: ${currency.name}');
    //           },
    //           favorite: ['SEK'],
    //         );
    //       },
    //       child: const Text('Show currency picker'),
    //     ),
    //   ),
    // );
  }
}