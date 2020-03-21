import 'package:app/screens/wrapper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());     //root widget MyApp

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}