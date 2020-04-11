import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/review_bloc.dart';


class ReviewAttendance extends StatelessWidget {
  ReviewAttendance({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ReviewBloc>(context);
    var cart = bloc.cart;
    return Scaffold(
      appBar: AppBar(
        title: new Text('Review Attendance'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          int memberIndex = cart.keys.toList()[index];
          int count = cart[memberIndex];
          return ListTile(
            title: Text('Name'),
            trailing: FlatButton.icon(
            splashColor: Colors.blueGrey,
            icon: Icon(Icons.cancel),
            label: Text(''),
            onPressed: (){
              bloc.clear(memberIndex);
            }, 
            ),
          );
        }
      ),
    );
  }  
}