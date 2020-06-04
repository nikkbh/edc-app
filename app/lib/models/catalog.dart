import 'package:app/models/member.dart';
import 'package:flutter/material.dart';




class CatalogModel  {
  final Member member;
  
  CatalogModel({this.member});

  // static List<String> itemNames = [
  //   'Code Smell',
  //   'Control Flow',
  //   'Interpreter',
  //   'Recursion',
  //   'Sprint',
  //   'Heisenbug',
  //   'Spaghetti',
  //   'Hydra Code',
  //   'Off-By-One',
  //   'Scope',
  //   'Callback',
  //   'Closure',
  //   'Automata',
  //   'Bit Shift',
  //   'Currying',
  // ];

  // Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  // Item getByPosition(int position) {
  //   // In this simplified case, an item's position in the catalog
  //   // is also its id.
  //   return getById(position);
  // }


}


// @immutable 
// class Item {
//   final int id ;
//   final String name ;

//   Item(this.id , this.name);

//   @override
//   int get hashCode => id;

//   @override
//   bool operator ==(Object other) => other is Item && other.id == id;
  
// }