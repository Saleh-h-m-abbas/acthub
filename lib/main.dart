import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

}



class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SecondScreen()
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xff566357),
      body: Column(
        children: [
          SizedBox(height:130),
          Container(

            child: Center(
              child: Image.asset('assets/Final Logo with layers_2.png'),
            ),
          ),
          Stack(
            children: [
              ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  height: 480,

                  color: Color(0xffF9A559),),
              ),
              ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  height: 440,
                  decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                       // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  height: 430,
                  color: Color(0xff566357),),
              ),
            ],
          ),
        ],
      ),

       // This trailing comma makes auto-formatting nicer for build methods.
      // body: Container(
      //   width: MediaQuery.of(context).size.width,
      //   height:MediaQuery.of(context).size.height,
      //   child: Image.asset('assets/Group 4765.png'),
      // ),
    );
  }
}
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-400);
    var firstControlPoint = Offset(size.width - size.width/1.7, size.height-100);
    var firstEndPoint = Offset(size.width , size.height-300 );
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height-100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}
class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
          },
          child: Text('Go back!'),

        ),
      ),
    );
  }
}