//import 'package:app/review_bloc.dart';
import 'package:app/screens/wrapper.dart';
import 'package:app/services/auth.dart';
import 'package:app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/user.dart';
import 'package:app/models/catalog.dart';
import 'package:app/models/cart.dart';

import 'models/member.dart';
//import 'review_bloc.dart';

void main() => runApp(MyApp());     //root widget MyApp

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MultiProvider(providers: [
      StreamProvider<User>.value(value: AuthService().user),
      // ChangeNotifierProvider<ReviewBloc>(create: (context)=>ReviewBloc(),),
      Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      StreamProvider<List<Member>>.value(value: DatabaseService().memberSe),
    ],
    child: MaterialApp(
      home: Wrapper(),
    ),
    );  
    //   return StreamProvider<User>.value(
    //     value: AuthService().user, 
    //     child: ChangeNotifierProvider<ReviewBloc>(
    //       create: (context)=>ReviewBloc(),
    //       child: MaterialApp(
    //         home: Wrapper(),
    //       ),
    //     ),
    // );
  }
}