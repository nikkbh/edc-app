import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('Sign In'),
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        
      ),
    );
  }
}