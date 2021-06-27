import 'package:acthub/Classes/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({Key key}) : super(key: key);
  static const String id = 'SignUpFormPage';

  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {

  @override
  Widget build(BuildContext context) {
    bool isUser=true; // make it true to show the user form

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                'Images/HeaderLogoB.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.26,
              ),
              Positioned(
                top:MediaQuery.of(context).size.height*0.07,
                child: Container(
                  height: MediaQuery.of(context).size.width*0.1,
                  width:MediaQuery.of(context).size.width*0.1,

                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios,size: 30,),
                      onPressed: () => Navigator.pop(context),

                    ),
                  ),
                ),
              ),
            ],
          ),
          isUser?UserForm(context) :Advertiser_SP_Info(context,serviceProvider: false),
          SizedBox(
            height: MediaQuery.of(context).size.height *0.03,
          ),
          GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Container(
                  width: MediaQuery.of(context).size.width*0.73,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: const BoxDecoration(
                    color: Palette.actHubGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.007),
                      child: AutoSizeText(isUser?'Sign Up':'Next',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Palette.white)),
                    ),
                  )),
            ),

          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *0.03,
          ),
          Container(
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width*0.4,
              child: Image.asset('Images/ActHubG.png',fit: BoxFit.contain,)),
        ],
      ),
    );
  }

  UserForm(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.01),
            Card(
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
                  width:MediaQuery.of(context).size.width*0.9,
                  height:MediaQuery.of(context).size.height*0.47,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
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
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
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
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
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
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
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
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
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
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
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
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
          left:MediaQuery.of(context).size.width*0.08,
          child: Container(
            width: MediaQuery.of(context).size.width*0.25,
            height:MediaQuery.of(context).size.height*0.08,
            child: AutoSizeText(
              'User',
              style: TextStyle(
                  color: Palette.actHubGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.46),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 10,
            child: GFImageOverlay(
              image:AssetImage('Images/user.png') ,
              width: MediaQuery.of(context).size.width*0.77,
              height: MediaQuery.of(context).size.height*0.08,
              borderRadius: BorderRadius.circular(18),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.04,
                  child: Center(
                    child: AutoSizeText(
                      "user",
                      style: TextStyle(
                          fontSize:25,
                          fontWeight: FontWeight.bold,
                          color: Palette.white),
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),

      ],
    );

  }
  Advertiser_SP_Info(BuildContext context, {bool serviceProvider}) {
    // make it true to show the payment information when the selected user is Service Provider or advertiser
    bool nextIsPressed=true;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.01),
            Card(
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
                  width:MediaQuery.of(context).size.width*0.9,
                  height:MediaQuery.of(context).size.height*0.47,
                  child: SingleChildScrollView(
                    child:nextIsPressed?
                       Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.03),
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
                    ):Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                  color: Colors.black, fontSize: 12),
                              hintText: 'What do people call you?',
                              labelText: 'COMPANY / NAME ',
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
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
          left:MediaQuery.of(context).size.width*0.08,
          child: Container(
           width: MediaQuery.of(context).size.width*0.35,
            height:MediaQuery.of(context).size.height*0.08,
            child: AutoSizeText(
              nextIsPressed?'Payment Info': serviceProvider? 'Service Provider':'Advertiser',
              style: TextStyle(
                  color: Palette.actHubGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.46),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 10,
            child: GFImageOverlay(
              image:AssetImage(  serviceProvider?  'Images/serviceProvider.png': 'Images/advertiser.png',) ,
              width: MediaQuery.of(context).size.width*0.77,
              height: MediaQuery.of(context).size.height*0.08,
              borderRadius: BorderRadius.circular(18),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.04,
                  child: Center(
                    child: AutoSizeText(
                      "user",
                      style: TextStyle(
                          fontSize:25,
                          fontWeight: FontWeight.bold,
                          color: Palette.white),
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),

      ],
    );

  }

}