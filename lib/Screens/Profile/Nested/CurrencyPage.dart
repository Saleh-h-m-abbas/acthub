import 'package:acthub/Classes/Currencies.dart';
import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  static const String id = 'CurrencyPage';
  const CurrencyPage({Key key}) : super(key: key);


  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  Color shadow = Palette.actHubGreen.withOpacity(0.33);
  final selectedColor = Colors.red;
  final unselectedColor = Colors.black;
  String selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette
      .scaffold,
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
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  height:allHeight(context) * 0.06,
                  width: allWidth(context) * 0.90,
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
            height: allHeight(context)*0.74,
            child:
            Center(
              child: ListView(
                  children: Currencies.CurrenciesList()
                      .map<DropdownMenuItem<Currencies>>(
                        (e) =>
                        DropdownMenuItem<Currencies>(
                          value: e,
                          child:
                          Column(
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                      onTap: () async {
                                        //print(e.name);
                                        setState(() {
                                          this.selectedValue = e.name;
                                          print(selectedValue);
                                        });
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: 370.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.16),
                                                  offset: Offset(0, 3.0),
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                fontFamily: 'Segoe UI',
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Positioned(
                                            left: 15,
                                            child:  Image.asset(e.flag ,width: 30,height:30 ,),),
                                          Positioned(
                                            left:allWidth(context)*0.7,
                                            child: Text(e.symbol),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )),
                                )]
                          ),
                        ),
                  ).toList()


              ),
            ),
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
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Hero(
                tag: 'search',
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height:allHeight(context) * 0.06,
                    width: allWidth(context) * 0.90,
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
              height: allHeight(context)*0.68,
              child:
              Column(
                  children: Currencies.CurrenciesList()
                      .map<DropdownMenuItem<Currencies>>(
                        (e) =>
                        DropdownMenuItem<Currencies>(
                          value: e,
                          child:
                          Column(
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                      onTap: () async {
                                        print(e.name);
                                        setState(() {
                                          this.selectedValue = e.name;
                                          print(selectedValue);
                                        });
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: 370.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.16),
                                                  offset: Offset(0, 3.0),
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                fontFamily: 'Segoe UI',
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Positioned(
                                            left: 15,
                                            child:  Image.asset(e.flag ,width: 30,height:30 ,),),
                                          Positioned(
                                            left:allWidth(context)*0.7,
                                            child: Text(e.symbol),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )),
                                )]
                          ),
                        ),
                  ).toList()


              ),
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
  }
}