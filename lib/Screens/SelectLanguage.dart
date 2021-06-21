import 'package:acthub/Api/translations.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:smart_select/smart_select.dart';

class SelectLanguage extends StatefulWidget {
  static const String id = 'SelectLanguage';
  const SelectLanguage({Key key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String _verticalGroupValue = "English";
  var toLanguageCode;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const values = <String>['Flutter', 'Dart', 'Firebase'];
  String selectedValue = values.first;

  final selectedColor = Colors.red;
  final unselectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 7),
              const Divider(indent: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFSearchBar(
                    searchList: Translations.languages,
                    searchQueryBuilder: (query, list) {
                      return list
                          .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                          .toList();
                    },
                    overlaySearchListItemBuilder: (item) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    },
                    onItemSelected: (item) {
                      setState(() {
                        print('$item');
                      });
                    },
                  ),
                  buildRadios(),
                ],
              ),
              const SizedBox(height: 7),
            ],
          ),
        ),
      ),
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
            print(selected);
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                  onTap: () async {
                    print(data);
                    setState(() {
                      this.selectedValue = data;
                      print(selectedValue);
                    });
                    toLanguageCode = Translations.getLanguageCode(selectedValue);
                    print(toLanguageCode);
                    final SharedPreferences prefs = await _prefs;
                    prefs.setString("ToLanguage", toLanguageCode);
                    print(prefs.getString("ToLanguage"));
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
                            color: Colors.black,
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
