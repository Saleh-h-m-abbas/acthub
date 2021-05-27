import 'dart:io';
import 'package:acthub/Api/translation_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {
  String defaultLocale;
  @override
  void initState() {
    checkDeviceLanguage();
    super.initState();
  }
  checkDeviceLanguage() async {
    Locale _locale;
    defaultLocale = Platform.localeName;
    print(_locale);
    print(defaultLocale);
    var arr = defaultLocale.split("_");
    print(arr[0]);
    String device_lang=arr[0];
    print(device_lang);
  //  final toLanguageCode = Translations.getLanguageCode(device_lang);
  //  print(toLanguageCode);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue[50],
        body: TranslationWidget(message: "hi", fromLanguage: "English", toLanguage: "Arabic", builder: (translatedMessage) =>
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                  child: Text(
                    translatedMessage,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
        )
      );

}
