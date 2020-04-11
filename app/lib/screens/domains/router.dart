
import 'package:app/screens/domains/create_meeting.dart';
import 'package:app/screens/domains/hr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case hrRoute :
        return MaterialPageRoute(builder: (context) => HR());
        break;
      case createRoute :
        return MaterialPageRoute(builder: (context) => CreateMeeting());
        break;
      default: 
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text("No route defined for${settings.name}")
          ),
        ));
    }
  }
}