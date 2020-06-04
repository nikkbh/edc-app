import 'package:app/models/cart.dart';
import 'package:app/models/member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {

  
  @override
  Widget build(BuildContext context) {

    final Member member;
    final memberSe = Provider.of<List<Member>>(context);
    var cart = Provider.of<CartModel>(context);
    //print(memberSe.documents);
    
    return ListView.builder(
      
      itemCount: memberSe.length,
      itemBuilder: (context, index){
      return Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
        child: ListTile(
          title: Text("${member.name}"),
          trailing: FlatButton(
            onPressed: cart.items.contains(member) ? () => cart.removeSelectedItem(index) : () => cart.add(index),
            child: cart.items.contains(member)
                ? Icon(Icons.remove_circle, semanticLabel: 'ADDED')
                : Icon(Icons.add_circle),
          ),
        ),
      );
    },
    );
  }
}

class _AddButton extends StatelessWidget {
final Member member;

  const _AddButton({Key ke, @required this.member}) : super(key: ke);
  
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

     return FlatButton(
      onPressed: cart.items.contains(member) ? () => cart.removeSelectedItem(index) : () => cart.add(index),
      child: cart.items.contains(member)
          ? Icon(Icons.remove_circle, semanticLabel: 'ADDED')
          : Icon(Icons.add_circle),
    );
      
  }
}
class MemberTile extends StatelessWidget {

  final Member member;
  
  MemberTile({this.member});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
          title: Text("${member.name}"),
          trailing: _AddButton(member: member),
    );
  }
}