import 'package:flutter/material.dart';
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key key}) : super(key: key);
  static const String id = 'LanguageScreen';

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
        child: Center(child: Text('Hello')),
      ),
    );
  }
}
