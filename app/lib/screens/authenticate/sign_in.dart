import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
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
        child: RaisedButton(
          child: Text("Sign in anonymously"),
          onPressed: () async{
            dynamic res = await _auth.signInAnon();
            if(res== null){
              print("Error signing in!");
            }else{
              print("Signed in!");
              print(res.uid);
            }
          }),
        
      ),
    );
  }
}