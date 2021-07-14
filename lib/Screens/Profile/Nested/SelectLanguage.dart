import 'dart:async';
import 'package:acthub/Api/translations.dart';
import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

double allHeight(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.height:MediaQuery.of(context).size.width;
}
double allWidth(BuildContext context){
  return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?
  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.85;
}

class SelectLanguage extends StatefulWidget {
  static const String id = 'SelectLanguage';
  const SelectLanguage({Key key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var toLanguageCode;
  var toLanguageWord;
  String defultLanguage;
  String selectedValue;
  final selectedColor = Colors.red;
  final unselectedColor = Colors.black;


  Future<void> SetStringSharedPreferance(String shared,String languagecode)  {
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        prefs.setString(shared, languagecode);
      })();
    });
  }
  getStringSharedPreferance() {
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        defultLanguage= prefs.getString("Language");
        print(defultLanguage);
        selectedValue = Translations.languages.reduce((value, element) => defultLanguage );
      })();
    });
  }
  void initState() {
    Timer(Duration(seconds: 0), () => {getStringSharedPreferance()});
    (() async {
      selectedValue = Translations.languages.reduce((value, element) => defultLanguage );
    })();
    super.initState();
  }





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
          'Language',
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
      body: languageDesign(context),
    );
  }
  Widget languageDesign(BuildContext context){
    Color shadow = Palette.actHubGreen.withOpacity(0.33);
    return MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Hero(
            tag: 'search',
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
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
                width: allWidth(context) * 0.95,
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
        buildRadios(),
        SafeArea(child: Container(
            height: allHeight(context) * 0.1,
            width:allWidth(context) * 0.4,
            child: Image.asset(
              'Images/ActHubOLogo.png',
              fit: BoxFit.contain,
            )),),
      ],
    ):ListView(
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
                width: allWidth(context),
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
        buildRadios(),
        SafeArea(child: Container(
            height: allHeight(context) * 0.1,
            width:allWidth(context) * 0.4,
            child: Image.asset(
              'Images/ActHubOLogo.png',
              fit: BoxFit.contain,
            )),),
      ],
    );
  }
  Widget buildRadios() => Theme(
    data: Theme.of(context).copyWith(
      unselectedWidgetColor: unselectedColor,
    ),
    child: Column(
      children: Translations.languages.map((String data) {
        final selected = this.selectedValue == data;
        final color = selected ? selectedColor : unselectedColor;
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
              onTap: () async {
                setState(() {
                  this.selectedValue = data;
                  toLanguageCode = Translations.getLanguageCode(selectedValue);
                  toLanguageWord = selectedValue;
                (() async {
                  await SetStringSharedPreferance("LanguageCode",toLanguageCode);
                  await SetStringSharedPreferance("Language",toLanguageWord);
                })();
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
                      data,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16.0,
                        color: color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
        );
      }).toList(),


    ),
  );
}