import 'package:app/models/user.dart';
import 'package:app/screens/authenticate/authenticate.dart';
import 'package:app/screens/domains/doc.dart';
import 'package:app/screens/domains/hr.dart';
import 'package:app/screens/home/home.dart';
//import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
   //final AuthService _auth = AuthService();

    //defining the user id
     final String hrd = "QNptUa0HIOWJbfjbsu2Wzi18HWW2";
    final String docd = "9MaBLWxIlCQYEo5MsMRH1BFQDzS2";

    // return either home or authenticate
    if(user == null){
      return Authenticate();
    }else{
      if(user.uid == hrd){return HR();}
      else if(user.uid == docd){return Doc();}
      else{return Home();}
    }
    
     
  }
}