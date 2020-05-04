import 'package:app/screens/domains/attendance.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class CreateMeeting extends StatelessWidget {
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Meeting'),
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
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BasicDateTime(),
              MyHomePage(),
            ]
          ),
        ),
      );
  }
}

class BasicDateTime extends StatelessWidget {
  final format = DateFormat("dd-MM-yyyy");
  final _format = DateFormat("HH-mm");
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Date
            Container(
              margin: EdgeInsets.all(30.0),
              padding: EdgeInsets.only(left: 9.0,right: 9.0),
              height: 45.0,

              child: DateTimeField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Date",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1990),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                },
              ),
            ),

            //time
            Container(
              margin: EdgeInsets.only(left: 30.0,right: 30.0,bottom: 30.0),
              padding: EdgeInsets.only(left: 9.0,right: 9.0),
              height: 45.0,

              child: DateTimeField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Time",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
                format: _format,
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.convert(time);
                },
              ),
            ),

            //Descritpion
            Container(
              margin: EdgeInsets.only(left: 30.0,right: 30.0,bottom: 30.0),
              padding: EdgeInsets.only(left: 9.0,right: 9.0),
              height: 45.0,
              
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   hintText: "Enter title/description",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
                validator: (value3) {
                  if (value3.isEmpty) {
                    return 'Please enter Something';
                  }
                  return null;
                },
              )
            ),

            
          ]
        ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
@override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: value1,
                onChanged: (bool value) {
                  setState(() {
                    value1 = value;
                  });
                },
              ),
              Text('FE',
                style: new TextStyle(fontSize: 16.0),),
              
              Checkbox(
                value: value2,
                onChanged: (bool value) {
                  setState(() {
                    value2 = value;
                  });
                },
              ),
              Text('SE',
                style: new TextStyle(fontSize: 16.0),),
              
              Checkbox(
                value: value3,
                onChanged: (bool value) {
                  setState(() {
                    value3 = value;
                  });
                },
              ),
              Text('TE',
                style: new TextStyle(fontSize: 16.0),),
              
              // Checkbox(
              //   value: value4,
              //   onChanged: (bool value) {
              //     setState(() {
              //       value4 = value;
              //     });
              //   },
              // ),
              // Text('BE',
              //   style: new TextStyle(fontSize: 16.0),
              //   ),
              
            ]
          ),

          Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.only(left: 9.0,right: 9.0),
            child: RaisedButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  splashColor: Colors.grey,
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 34.5),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Attendance()));//path to go on the next screen
                  },
                  child: Text('Take Attendance',
                    style: TextStyle(fontSize: 20.0,)
                  ),
                ),
          ),
        ]
      ),
    );
  }
}