import 'package:app/models/member.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String mid;
  DatabaseService({this.mid});

  //collection reference
  final CollectionReference membersCollection = Firestore.instance.collection('memberSe');

  // Future updateUserData(String name) async{
  //   return await membersCollection.document(mid).setData({
  //     'name': name,
  //   });
  // }

  //member list from snapshot
  List<Member> _memberListfromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Member(
        name: doc.data['name'] ?? '',
      );
    }).toList();
  }

  //get members stream

  Stream<List<Member>> get memberSe{
    return membersCollection.snapshots().map(_memberListfromSnapshot);
  }
}