import 'dart:async';

import 'package:acthub/Api/translation_api.dart';
import 'package:acthub/Api/translations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationWidget extends StatefulWidget {
  final String message;
  String fromLanguage = 'English';
  String toLanguage ;
  final Widget Function(String translation) builder;

  TranslationWidget({Key key, this.message, this.builder}) : super(key: key);

  @override
  _TranslationWidgetState createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String defultLanguage;
  String defultLanguageCode;

  getStringSharedPreferance() {
    setState(() {
      (() async {
        final SharedPreferences prefs = await _prefs;
        defultLanguage= prefs.getString("Language");
        defultLanguageCode= prefs.getString("LanguageCode");
      })();
    });
  }
  void initState() {
    Timer(Duration(seconds: 0), () => {getStringSharedPreferance()});
    super.initState();
  }
  String translation;
  @override
  Widget build(BuildContext context) {
    final toLanguageCode = Translations.getLanguageCode(defultLanguage);
    return FutureBuilder(
      future: TranslationApi.translate(widget.message, toLanguageCode),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return translation == null
                ? Container()
                : widget.builder(translation);
          default:
            if (snapshot.hasError) {
              translation = widget.message;
            } else {
              translation = snapshot.data;
            }
            return widget.builder(translation);
        }
      },
    );
  }

  messageWidget(translatedMessage) {
    String translatedMessage;
    String data;
    TranslationWidget(
        message: translatedMessage,
        builder: (newText) {
          setState(() {
            data = newText;
          });
          return Text(data);
        });
  }
}
