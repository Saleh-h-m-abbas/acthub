import 'package:flutter/material.dart';
class BillingPage extends StatefulWidget {
  const BillingPage({Key key}) : super(key: key);
  static const String id = 'BillingPage';

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Billing Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
