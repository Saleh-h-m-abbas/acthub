
import 'package:currency_picker/currency_picker.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Demo for currency picker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: (Currency currency) {
                print('Select currency: ${currency.name}');
              },
              favorite: ['SEK'],
            );
          },
          child: const Text('Show currency picker'),
        ),
      ),
    );
  }
}
