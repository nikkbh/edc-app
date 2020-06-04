import 'package:app/models/member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/review_bloc.dart';

class MemberTileCart extends StatelessWidget {

  final Member member;
  MemberTileCart({this.member});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
          title: Text("${member.name}"),
    );
  }
}


class ReviewAttendance extends StatefulWidget {
  ReviewAttendance({Key key}) : super(key: key);

  @override
  _ReviewAttendanceState createState() => _ReviewAttendanceState();
}

class _ReviewAttendanceState extends State<ReviewAttendance> {

  var bloc;
  @override
  void didChangeDependencies() {
    // bloc = MovieDetailBlocProvider.of(context);
    // bloc.fetchTrailersById(movieId);
    bloc = Provider.of<ReviewBloc>(context);
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final memberSeCart = Provider.of<List<Member>>(context);
    // var bloc = Provider.of<ReviewBloc>(context);
    var cart = bloc.cart;
    //cart['name'] = "";
    
    return Scaffold(
      appBar: AppBar(
        title: new Text('Review Attendance'),
      ),
      body: ListView.builder(
        itemCount: memberSeCart.length,
        itemBuilder: (context, index){
          int memberIndex = cart.keys.toList()[index];
          //int count = cart[memberIndex];
          return ListTile(
            title: Text('${memberSeCart[memberIndex].name}'),
            trailing: FlatButton.icon(
            splashColor: Colors.blueGrey,
            icon: Icon(Icons.cancel),
            label: Text(''),
            onPressed: (){
              bloc.clear(memberIndex);
              //bloc.addToCart(index);
            }, 
            ),
          );
        }
      ),
    );
  }  
}