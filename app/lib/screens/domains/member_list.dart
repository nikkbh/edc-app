import 'package:app/models/member.dart';
import 'package:app/screens/domains/member_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../review_bloc.dart';

class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {

  
  @override
  Widget build(BuildContext context) {

    
    final memberSe = Provider.of<List<Member>>(context);
    var bloc = Provider.of<ReviewBloc>(context);
    int totalCount = 0;
    if(bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    //print(memberSe.documents);
    
    return ListView.builder(
      
      itemCount: memberSe.length,
      itemBuilder: (context, index){
      return Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
        child: new Dismissible(
           key: UniqueKey(),//(memberSe.toString()[index]),
          onDismissed: (direction){
            memberSe.removeAt(index);
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text("Marked Present"),
            ));    
           bloc.addToCart(index);
          },
          background: new Container(
             color: Colors.red,
          ),
        child: new MemberTile(member: memberSe[index]),
        ),
      );
    },
    );
  }
}

