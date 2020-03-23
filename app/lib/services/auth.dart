import 'package:app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FIrebasse user
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user)=> _userFromFirebaseUser(user)); OR
    .map(_userFromFirebaseUser);
  }

  //sign in anonymously
  // Future signInAnon() async {
  //   try{
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return _userFromFirebaseUser(user);
  //   }catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  //sign in with email & pass
  Future signInEmailandPass(String uname, String pass) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: uname, password: pass);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //sign out
  Future signOutUser() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}