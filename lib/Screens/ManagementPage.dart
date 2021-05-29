import 'package:acthub/Classes/Palette.dart';
import 'package:acthub/Screens/ActivityPage.dart';
import 'package:acthub/Screens/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key key}) : super(key: key);
  static const String id = 'ManagementPage';

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  bool guestOrUser = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return new Future.value(false);
        },
        child: MaterialApp(
          home: guestOrUser ? userPage() : guestPage(),
        ));
  }

  Widget guestPage() {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Palette.scaffold,
        title: Text(
          'Management',
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Palette.orange),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 52.0, top: 10.5),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('Images/gusetProfilepic.png'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 15),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Palette.orange),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sgined in first to access this feature.',
                        //name of main category
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Palette.actHubGreen.withOpacity(0.35),
                        ),
                      ),
                      Image.asset(
                        'Images/human.png',
                        height: MediaQuery.of(context).size.height * 0.45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "you haven't signed in yet. please sign in\n to manage your activity in application.",
                          style: TextStyle(
                            fontSize: 19,
                            color: Palette.actHubGreen.withOpacity(0.50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 318,
                          height: 45,
                          child: ElevatedButton(
                              child: Text('Sign in',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )), //to style the text of buttons
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff475EEE) // background
                                  // foreground
                                  ), //to set the color of buttons
                              onPressed: () {
                                Navigator.pushNamed(context, SignIn.id);
                              }),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userPage() {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Palette.scaffold,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved', // name of activity
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Palette.orange),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                'activites', //name of main category
                style: TextStyle(
                  fontSize: 14,
                  color: Palette.actHubGreen.withOpacity(0.35),
                ),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 52.0, top: 10.5),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                ),
                Positioned(
                    top: 35,
                    left: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Palette.online,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0, color: Palette.white)),
                    ))
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              userPageDesign(
                  'https://www.routesnorth.com/wp-content/uploads/2019/04/kjerag-boulder.jpg'),
              userPageDesign(
                  'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,g_xy_center,h_800,q_50,w_640,x_576,y_183/v1/clients/texas/ritaarias17_instagram_5053966003_68c2771e-bece-4fe0-81d5-59ac10ef4622.jpg'),
              userPageDesign(
                  'https://lh3.googleusercontent.com/proxy/KWB7B_f2Ay26McmQbgXWl42Kg7jWVF7RyYtihw1Xl0NjBxKTz1tIDDx7A6ZDUdIpa6NloU50qW5hbrmQFc6TWfIVAQNqiU1SCZkcprTdEB-yJ3HyJbVo0L28bDJodbdHQsOS68oYcQ5vDMYmQLtWnCE0bF9eKvxfQFOQhldm18WrzNFJhJ4syWqbMDEq6Xm9wilNPyMUlf1GP6s4HTvHFXPSobm9coH5e2HZc9kt5O3QSjMOeGYo'),
              userPageDesign(
                  'https://www.routesnorth.com/wp-content/uploads/2019/04/kjerag-boulder.jpg'),
              userPageDesign(
                  'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,g_xy_center,h_800,q_50,w_640,x_576,y_183/v1/clients/texas/ritaarias17_instagram_5053966003_68c2771e-bece-4fe0-81d5-59ac10ef4622.jpg'),
              userPageDesign(
                  'https://lh3.googleusercontent.com/proxy/KWB7B_f2Ay26McmQbgXWl42Kg7jWVF7RyYtihw1Xl0NjBxKTz1tIDDx7A6ZDUdIpa6NloU50qW5hbrmQFc6TWfIVAQNqiU1SCZkcprTdEB-yJ3HyJbVo0L28bDJodbdHQsOS68oYcQ5vDMYmQLtWnCE0bF9eKvxfQFOQhldm18WrzNFJhJ4syWqbMDEq6Xm9wilNPyMUlf1GP6s4HTvHFXPSobm9coH5e2HZc9kt5O3QSjMOeGYo'),
              userPageDesign(
                  'https://www.routesnorth.com/wp-content/uploads/2019/04/kjerag-boulder.jpg'),
              userPageDesign(
                  'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,g_xy_center,h_800,q_50,w_640,x_576,y_183/v1/clients/texas/ritaarias17_instagram_5053966003_68c2771e-bece-4fe0-81d5-59ac10ef4622.jpg'),
              userPageDesign(
                  'https://lh3.googleusercontent.com/proxy/KWB7B_f2Ay26McmQbgXWl42Kg7jWVF7RyYtihw1Xl0NjBxKTz1tIDDx7A6ZDUdIpa6NloU50qW5hbrmQFc6TWfIVAQNqiU1SCZkcprTdEB-yJ3HyJbVo0L28bDJodbdHQsOS68oYcQ5vDMYmQLtWnCE0bF9eKvxfQFOQhldm18WrzNFJhJ4syWqbMDEq6Xm9wilNPyMUlf1GP6s4HTvHFXPSobm9coH5e2HZc9kt5O3QSjMOeGYo'),
            ],
          ),
        ),
      ),
    );
  }

  Widget userPageDesign(String imgURL) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ActivityPage.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(17.0)),
                  child: Image.network(
                    imgURL,
                    fit: BoxFit.fill,
                  )),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.070) / 2,
              left: 25,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'Images/Like.svg',
                    height: 30,
                    color: Palette.orange,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.2),
                    child: Text(
                      'Hiking Tour',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.35),
                              offset: Offset(5, 5))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
