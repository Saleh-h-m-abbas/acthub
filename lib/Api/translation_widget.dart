import 'package:acthub/Api/translation_api.dart';
import 'package:acthub/Api/translations.dart';
import 'package:flutter/material.dart';


class TranslationWidget extends StatefulWidget {
  final String message;
  final String fromLanguage;
  final String toLanguage;
  final Widget Function(String translation) builder;

  const TranslationWidget({
    @required this.message,
    @required this.fromLanguage,
    @required this.toLanguage,
    @required this.builder,
    Key key,
  }) : super(key: key);
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
            return buildWaiting();
          default:
            if (snapshot.hasError) {
              translation = 'Could not translate due to Network problems';
            } else {
              translation = snapshot.data;
            }
            return widget.builder(translation);
        }
      },
    );
  }

  Widget buildWaiting() =>
      translation == null ? Container() : widget.builder(translation);
}





class MessageWidget extends StatelessWidget {
  final String translatedMessage;

  const MessageWidget({
    @required this.translatedMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
          child: buildMessage(),
        ),
      ],
    );
  }
  Widget buildMessage() => Column(
    children: <Widget>[
      Text(
        translatedMessage,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

