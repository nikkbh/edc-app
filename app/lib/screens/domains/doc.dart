import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';

class Doc extends StatelessWidget {
  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Documentation'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          FlatButton.icon(icon: Icon(Icons.person),
          label: Text("Logout"),
          onPressed: () async{
            await _auth.signOutUser();
          },
          )
        ],
      ),
    );
  }
}