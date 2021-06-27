import 'package:flutter/material.dart';
class CurrencyPage extends StatefulWidget {
  static const String id = 'Currency Page';
  const CurrencyPage({Key key}) : super(key: key);


  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Currency Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
