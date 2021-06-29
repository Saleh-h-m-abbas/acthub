import 'dart:io';
import 'package:acthub/Api/translation_widget.dart';
import 'package:acthub/Api/translations.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {
  String defaultLocale;
  var fromLanguageCode;
  var toLanguageCode;
  @override
  void initState() {
    checkDeviceLanguage();
    super.initState();
  }
  checkDeviceLanguage() async {
    defaultLocale = Platform.localeName;
    print(defaultLocale);
    var arr = defaultLocale.split("_");
    String deviceLang=arr[0];
    print(deviceLang);
    fromLanguageCode = Translations.getLanguageFromCode("en"); //todo: DEVICE LANGUGE language from code
    print( fromLanguageCode);
    toLanguageCode = Translations.getLanguageFromCode(deviceLang); //todo: get language from code that will be convert to it by setting or by device origial language  also Shared Preferance
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue[50],
        body: TranslationWidget(message: "hi", fromLanguage: "English", toLanguage: "Arabic", builder: (translatedMessage) =>
            Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                TranslationWidget(message: "مرحبا", fromLanguage: fromLanguageCode, toLanguage: toLanguageCode, builder: (translatedMessage) =>
                    Text(
                      translatedMessage,
                      style:TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                        height: 50,
                        width: 130,
                        child: Image.asset('assets/acthublogo.png'))),
                SizedBox(
                  height: 5,
                ),
                TranslationWidget(message: "Login for full enjoyable experience", fromLanguage: fromLanguageCode, toLanguage: toLanguageCode, builder: (translatedMessage) =>
                    Text(
                      translatedMessage,
                      style:TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ),
              ],
            )
        )
      );

}
