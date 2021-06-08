import 'package:acthub/Classes/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:acthub/Classes/validator.dart';
import 'package:acthub/Screens/Nested/Email_Password_Signin_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class test1 extends StatefulWidget {
  const test1({Key key}) : super(key: key);

  @override
  _test1State createState() => _test1State();
}

class _test1State extends State<test1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("test"),
    );
  }
}


class CreatePasswordForm extends StatefulWidget {
  final FocusNode passwordFocusNode;
  final String uid;
  const CreatePasswordForm({
    Key key,
    this.passwordFocusNode,
    this.uid,
  }) : super(key: key);
  @override
  _CreatePasswordFormState createState() => _CreatePasswordFormState();
}

class _CreatePasswordFormState extends State<CreatePasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  CollectionReference usersdatabase =
  FirebaseFirestore.instance.collection('users');
  var firebaseUser = FirebaseAuth.instance.currentUser;
  bool _isSingningUp = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Email_Password_Signin_Page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                CustomFormField(
                  controller: _passwordController,
                  focusNode: widget.passwordFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validatePassword(
                    password: value,
                  ),
                  isObscure: true,
                  label: 'Password',
                  hint: 'Enter your password',
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          _isSingningUp
              ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFF57C00),
              ),
            ),
          )
              : Padding(
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFFF57C00),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  widget.passwordFocusNode.unfocus();
                  setState(() {
                    _isSingningUp = true;
                  });
                  if (_registerFormKey.currentState.validate()) {
                    usersdatabase
                        .doc(widget.uid)
                        .set({
                      'password':_passwordController.text,
                    })
                        .then((value) => print("User Added"))
                        .catchError((error) => print("Failed to add user: $error"));
                  }
                  setState(() {
                    _isSingningUp = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:  Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                _routeToSignInScreen(),
              );
            },
            child: Text(
              'Already have an account? Sign in',
              style: TextStyle(
                color:  Colors.black,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
