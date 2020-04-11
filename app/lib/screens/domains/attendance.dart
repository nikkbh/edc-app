
import 'package:app/review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'review_attendance.dart';


void main() => runApp(Attendance());

class Attendance extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<ReviewBloc>(
      create: (context)=> ReviewBloc(),
        child: MaterialApp(
        title: 'Attendance',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Attendance Manager'),
              backgroundColor: Colors.orange,
            ),
            body: SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  BuildListView(),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewAttendance()));
                        })
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

// Widget _design() {
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

// Widget _submit(){
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Padding(padding: EdgeInsets.only(bottom: 100.0) ),
//       RaisedButton(
//         padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
//         elevation: 7.0,
//         textColor: Colors.white,
//         shape: new RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30.0),            
//         ),
//         color: Colors.black,
//         child: new Text("Review", style: TextStyle(fontSize: 20.0),),
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewAttendance()));
//         })
//     ],
//   );
// }

// Widget _submit(BuildContext context) {
//   return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//     Padding(
//       padding: const EdgeInsets.all(10),
//       child: ButtonTheme(
//         minWidth: 150,
//         height: 43,
//         child: RaisedButton(
//           shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(20.0),
//               side: BorderSide(color: Colors.black)),
//           textColor: Colors.black,
//           color: Colors.white,
//           onPressed: () {},
//           child: new Text("Submit", style: TextStyle(fontSize: 20)),
//         ),
//       ),
//     ),
//   ]);
// }

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  final List<String> items =
      new List<String>.generate(30, (i) => "Names ${i + 1}");
      
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ReviewBloc>(context);
    int totalCount = 0;
    if(bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return SizedBox(
      height: 578,
      child: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int index) {
            return Card(
              shape:
                  RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              child: new Dismissible(
                  key: new Key(items[index]),
                  onDismissed: (direction) {
                    items.removeAt(index);
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("Marked Present"),
                    ));
                    bloc.addToCart(index);
                  },
                  background: new Container(
                    color: Colors.red,
                  ),
                  child: new ListTile(title: Text("${items[index]}"))),
            );
          }),
    );
  }
}
