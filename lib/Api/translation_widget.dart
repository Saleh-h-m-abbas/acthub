import 'package:acthub/Api/translation_api.dart';
import 'package:acthub/Api/translations.dart';
import 'package:flutter/material.dart';

class TranslationWidget extends StatefulWidget {
  final String message;
  String fromLanguage = 'English';
  String toLanguage = 'Arabic';
  final Widget Function(String translation) builder;

  TranslationWidget({Key key, this.message, this.builder}) : super(key: key);

  @override
  _TranslationWidgetState createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> {
  String translation;
  @override
  Widget build(BuildContext context) {
    final toLanguageCode = Translations.getLanguageCode(widget.toLanguage);
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

  MessageWidget(translatedMessage) {
    String translatedMessage;
    String Data;
    // @override
    // Widget build(BuildContext context) {
    // }

    TranslationWidget(
        message: translatedMessage,
        builder: (newText) {
          setState(() {
            Data = newText;
          });
          return Text(Data);
          // return Text(
          //   newText,
          //   style: TextStyle(color: Colors.black),
          // );
        });
    // return Data;
  }
}
