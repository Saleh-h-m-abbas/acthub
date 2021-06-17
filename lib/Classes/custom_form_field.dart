import 'package:acthub/Design/Button.dart';
import 'package:flutter/material.dart';
import 'package:acthub/Classes/authentication.dart';
import 'package:acthub/Classes/validator.dart';
import 'package:acthub/Screens/Nested/Email_Password_Register_Page.dart';
import 'package:acthub/Screens/Nested/user_info_screen_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:acthub/Screens/Nested/Email_Password_Signin_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


//*********************************************************************8
class SignInForm extends StatefulWidget {
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const SignInForm({
    Key key,
    this.emailFocusNode,
    this.passwordFocusNode,
  }) : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _signInFormKey = GlobalKey<FormState>();

  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
          child: Form(
      key: _signInFormKey,
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 24.0,
              ),
              child: Column(
                children: [
                  CustomFormField(
                    controller: _emailController,
                    focusNode: widget.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateEmail(
                      email: value,
                    ),
                    label: 'Email',
                    hint: 'Enter your email',
                  ),
                  SizedBox(height: 16.0),
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
            _isSigningIn
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
                          widget.emailFocusNode.unfocus();
                          widget.passwordFocusNode.unfocus();

                          setState(() {
                            _isSigningIn = true;
                          });

                          if (_signInFormKey.currentState.validate()) {
                            User user =
                                await Authentication.signInUsingEmailPassword(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => UserInfoScreenEmail(
                                    user: user,
                                  ),
                                ),
                              );
                            }
                          }
                          setState(() {
                            _isSigningIn = false;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: Text(
                'Don\'t have an account? Sign up',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
            )
          ],
      ),
    ),
        ));
  }
}

//*********************************************************************8
class RegisterForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const RegisterForm({
    Key key,
    this.nameFocusNode,
    this.emailFocusNode,
    this.passwordFocusNode,
  }) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();
  CollectionReference usersdatabase =
      FirebaseFirestore.instance.collection('users');
  var firebaseUser = FirebaseAuth.instance.currentUser;
  bool _isSingningUp = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Email_Password_Signin_Page(),
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
                  controller: _nameController,
                  focusNode: widget.nameFocusNode,
                  keyboardType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  isCapitalized: true,
                  validator: (value) => Validator.validateName(
                    name: value,
                  ),
                  label: 'Name',
                  hint: 'Enter your name',
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  controller: _emailController,
                  focusNode: widget.emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  label: 'Email',
                  hint: 'Enter your email',
                ),
                SizedBox(height: 16.0),
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
                        widget.emailFocusNode.unfocus();
                        widget.passwordFocusNode.unfocus();

                        setState(() {
                          _isSingningUp = true;
                        });

                        if (_registerFormKey.currentState.validate()) {
                          User user =
                              await Authentication.registerUsingEmailPassword(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            context: context,
                          );
                          print(user.email);
                          print(user.uid);
                          usersdatabase
                              .doc(user.uid)
                              .set({
                                'email': user.email,
                                'GoogleEmail': "",
                                'FacebookEmail': "",
                                'providerId': "password",
                                'uid': user.uid,
                                'password': _passwordController.text
                              })
                              .then((value) => print("User Added"))
                              .catchError((error) =>
                                  print("Failed to add user: $error"));
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => UserInfoScreenEmail(
                                  user: user,
                                ),
                              ),
                            );
                          }
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
                            color: Colors.black,
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
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//*********************************************************************8
class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Text('Send Request'),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                  SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      "Please Check your email to Reset your password",
                      style: TextStyle(
                          color: Colors.redAccent, letterSpacing: 0.5),
                    ),
                  );
                },
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
