import 'package:app/models/member.dart';
import 'package:app/screens/domains/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/cart.dart';
import 'package:app/models/catalog.dart';

import 'member_list.dart';

class MyCatalog extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        title: 'Attendance',
        home: Scaffold(
              appBar: AppBar(
                title: Text('Attendance Manager'),
                backgroundColor: Colors.orange,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 200.0,
                            child: MemberList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(bottom: 100.0) ),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
                            elevation: 7.0,
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),            
                            ),
                            color: Colors.black,
                            child: new Text("Review", style: TextStyle(fontSize: 20.0),),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCart()));
                            })
                        ],
                      ),
                  ],
                ),
              ),
              
            )
        );
  }
}

// class MyCatalog extends StatelessWidget {
//   @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           _MyAppBar(),
//           // _design(context),
//           SliverToBoxAdapter(child: SizedBox(height: 15)),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                 (context, index) => _BuildListView(index),
//                 childCount : 15,

//                 ),
//           ),
//           SliverGrid(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 1,
//             ),
//               delegate: SliverChildBuilderDelegate(
//                  (BuildContext context, int index) {
//                      return  _submit(context) ;
//                  },
//               childCount : 1,

//             ),
//           ),
          
//         ],
//       ),
//     );
//   }
// }

// class _MyAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       title: Text('Attendance'),
//       floating: true,
//     );
//   }
// }


// Widget _design(BuildContext context) {
//   return Container(
//       child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: <Widget>[
//       RaisedButton(
//         shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(18.0),
//             side: BorderSide(color: Colors.black)),
//         textColor: Colors.black,
//         color: Colors.white,
//         onPressed: () {},
//         child: new Text("Add"),
//       ),
//       RaisedButton(
//         shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(18.0),
//             side: BorderSide(color: Colors.black)),
//         textColor: Colors.black,
//         color: Colors.white,
//         onPressed: () {},
//         child: new Text("Delete"),
//       ),
//     ],
//   ));
// }

// Widget _submit(BuildContext context) {
//   return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//        ButtonTheme(
//         minWidth: 150,
//         height: 43,
//         child: RaisedButton(
//           shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(20.0),
//               side: BorderSide(color: Colors.black)),
//           textColor: Colors.black,
//           color: Colors.white,
//           onPressed:(){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart()));
//           }, 
//           child: new Text("Submit", style: TextStyle(fontSize: 24)),
//         ),
//       ),
  
//   ]);
// }

// class _AddButton extends StatelessWidget {
//   final Item item;

//   const _AddButton({Key ke, @required this.item}) : super(key: ke);

//   @override
//   Widget build(BuildContext context) {
//     var cart = Provider.of<CartModel>(context);

//      return FlatButton(
//       onPressed: cart.items.contains(item) ? () => cart.removeSelectedItem(item) : () => cart.add(item),
//       child: cart.items.contains(item)
//           ? Icon(Icons.remove_circle, semanticLabel: 'ADDED')
//           : Icon(Icons.add_circle),
//     );
      
//   }
// }



// class _BuildListView extends StatelessWidget {
//   final int index;
//   final Member member;
//   _BuildListView(this.index, {Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var catalog = Provider.of<CatalogModel>(context);
//     final memberSe = Provider.of<List<Member>>(context);
//     Item getById(int id) => Item(id, member[id % memberSe.length]);

//     Item getByPosition(int position) {
//     // In this simplified case, an item's position in the catalog
//     // is also its id.
//     return getById(position);
//   }
//     var item = catalog.getByPosition(index);

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: LimitedBox(
//         maxHeight: 48,
//         child: Row(
//           children: [
//             AspectRatio(
//               aspectRatio: 1,
//             ),
//             SizedBox(width: 24),
//             Expanded(
//               child: Text(item.name),
//             ),
//             SizedBox(width: 24),
//             _AddButton(item: item),
//           ],
//         ),
//       ),
//     );
//   }
// }
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


