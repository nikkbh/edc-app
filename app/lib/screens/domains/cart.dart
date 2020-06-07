import 'package:flutter/material.dart';
import 'package:app/models/member.dart';
class Cart extends StatefulWidget {
  final List<Member> _cart;
  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Member> _cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Review Attendance'),
      ),
      body: ListView.builder(
        itemCount: _cart.length,
        itemBuilder: (context, index){
          var item = _cart[index];
          return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  title: Text(item.name),
                  trailing: GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          _cart.remove(item);
                        });
                      }),
                ),
              ),
            );
        }
      ),
    );
  }
}