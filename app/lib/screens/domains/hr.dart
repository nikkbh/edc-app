import 'package:app/screens/domains/create_meeting.dart';
import 'package:app/services/auth.dart';

import 'package:flutter/material.dart';
// import 'constants.dart';
// import 'router.dart';


void main() => runApp(HR());


// class HomeRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Named Routing',
//       initialRoute: hrRoute,
//       onGenerateRoute: Router.generateRoute,
//     );
//   }
//}

class HR extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Human Resources'),
              backgroundColor: Colors.orange,
              actions: <Widget>[
                FlatButton.icon(icon: Icon(Icons.exit_to_app),
                label: Text(""),
                onPressed: () async{
                  await _auth.signOutUser();
                },
                ),
              ]
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        elevation: 7.0,
                        child: Text("Create Meeting"),
                        textColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
                        shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                        color: Colors.black,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateMeeting()));
                        }
                ),
                  ]
                ),
              ],
            ),
    );
  }
}

