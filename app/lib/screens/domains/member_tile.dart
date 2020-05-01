import 'package:flutter/material.dart';
import 'package:app/models/member.dart';




class MemberTile extends StatelessWidget {

  final Member member;
  
  MemberTile({this.member});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
          title: Text("${member.name}"),
    );
  }
}

