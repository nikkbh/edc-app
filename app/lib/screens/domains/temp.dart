// import 'dart:html';

import 'package:app/services/auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:documents_picker/documents_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class DOC extends StatefulWidget {
  @override
  _DOCState createState() => _DOCState();
}

class _DOCState extends State<DOC> {

  final AuthService _auth = AuthService();

  File sampleDocument;
  File _docPath;
  //final bool _uploaded = false;

  void openFileExplorer() async{
    try{
      _docPath = await FilePicker.getFile(type: FileType.any, fileExtension: 'pdf');
      //uploadToFirebase();
      
    }on PlatformException catch(e){
      print("Unsupported Operation"+ e.toString());
    }
     if(!mounted) return;
    setState(() {
      sampleDocument = _docPath;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Documentation"),
        //centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          FlatButton.icon(icon: Icon(Icons.exit_to_app),
          label:Text(""),
          onPressed: () async{
            await _auth.signOutUser();
          },
          )
        ],
      ),
      body: Center(
        child: sampleDocument==null? Text("Select a file") : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openFileExplorer,
        child: Icon(Icons.file_upload),
      ),
    );
  }

  Widget enableUpload(){
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(30.0)),
          RaisedButton(
            elevation: 7.0,
            child: Text("Upload Document"),
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
            shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
            color: Colors.black,
            onPressed:(){
              final StorageReference firebasestorageRef = 
                FirebaseStorage.instance.ref().child('Report.pdf');
              final StorageUploadTask task = 
                firebasestorageRef.putFile(sampleDocument);
              if(task.isSuccessful){
                setState(() {
                  Text("Document Uploaded");
                });
              }
            }
          ),
        ],
      ),
    );
  }
}