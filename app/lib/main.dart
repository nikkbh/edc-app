import 'package:app/screens/wrapper.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/user.dart';

void main() => runApp(MyApp());     //root widget MyApp

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   
      return StreamProvider<User>.value(
        value: AuthService().user, 
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}