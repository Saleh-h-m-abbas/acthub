import 'package:acthub/Classes/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({Key key}) : super(key: key);
  static const String id = 'SignUpFormPage';

  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    child: Image.asset(
                      'Images/HeaderLogoB.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      PaymentInformation(context),
                      GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10,
                          child: Container(
                              width: 310,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Palette.actHubGreen,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.white)),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Container(
                  height: 50,
                  width: 130,
                  child: Image.asset('Images/ActHubG.png')),
            )
          ],
        ),
      ),
    );
  }

  Column UserForm(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              //onPressed:() => Navigator.pop(context, false),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        SizedBox(
          height: 150,
        ),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 380,
                      width: 351,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'FULL NAME ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'EMAIL ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'PASSWORD ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'BIRTHDAY ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'COUNTRY ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'STATE ',
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, bottom: 20),
              child: Container(
                  height: 100,
                  width: 100,
                  child: Text(
                    'User',
                    style: TextStyle(
                        color: Palette.actHubGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 360.0),
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Image.asset(
                    'Images/user.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380.0),
              child: Center(
                  child: Text(
                'User',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column CompanyInformation(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              //onPressed:() => Navigator.pop(context, false),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        SizedBox(
          height: 150,
        ),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 380,
                      width: 351,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'COMPANY NAME ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'EMAIL ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'PASSWORD ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'COUNTRY ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'CITY ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'PHONE ',
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, bottom: 20),
              child: Container(
                  height: 100,
                  child: Text(
                    'Company Information',
                    style: TextStyle(
                        color: Palette.actHubGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 360.0),
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Image.asset(
                    'Images/serviceProvider.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380.0),
              child: Center(
                  child: Text(
                'Service Provider',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column PaymentInformation(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              //onPressed:() => Navigator.pop(context, false),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        SizedBox(
          height: 150,
        ),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 300,
                      width: 351,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'CREDIT NUMBER',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'NAME ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'CVV ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                hintText: 'What do people call you?',
                                labelText: 'DATE ',
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, bottom: 20),
              child: Container(
                  height: 100,
                  child: Text(
                    'Payment Information',
                    style: TextStyle(
                        color: Palette.actHubGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280.0),
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Image.asset(
                    'Images/advertiser.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Center(
                  child: Text(
                'Advertiser',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
