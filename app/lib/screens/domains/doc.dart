import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
//import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class Doc extends StatefulWidget {
  Doc() : super();
  final String title = 'Firebase Storage'; 
  @override
  _DocState createState() => _DocState();
}

class _DocState extends State<Doc> {
  final AuthService _auth = AuthService();
  String _path;
  String _extension;
  FileType _ftype = FileType.any;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<StorageUploadTask> _tasks = <StorageUploadTask>[];


  openFileExplorer() async{
    try{
      _path = await FilePicker.getFilePath(type: _ftype, fileExtension: _extension);
      uploadToFirebase();
      
    }catch(e){
      print("Unsupported Operation"+ e.toString());
    }
     if(!mounted){return;}
  }
  
  uploadToFirebase(){
    String fileName = _path.split('.').last;
    String filePath = _path;
    upload(fileName, filePath);
  }

  upload(fileName, filePath){
    _extension = fileName.toString().split('.').last;
    StorageReference storageReference = FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask uploadTask = 
    storageReference.putFile(File(filePath),
    StorageMetadata(
      contentType: '$_ftype/$_extension',
    ));
    setState(() {
      _tasks.add(uploadTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    _tasks.forEach((StorageUploadTask task){
      final Widget tile = UploadTaskListTile(
        task: task,
        onDismissed:(){
          setState(() {
            _tasks.remove(task);
          });
        },
        onDownload: (){
          downloadFile(task.lastSnapshot.ref);
        },
      );
      children.add(tile);
    });
    return new MaterialApp(
    home:Scaffold(
     key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Documentation'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          FlatButton.icon(icon: Icon(Icons.person),
          label: Text("Logout"),
          onPressed: () async{
            await _auth.signOutUser();
          },
          )
        ],
      ),
      body: Container(
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(30.0)),
                    RaisedButton(
                      onPressed: (){
                        //openFileExplorer();
                      },
                      child: Text('Upload Document'),
                      color: Colors.black,
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
                      shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 200.0,
                        child: ListView(
                          children: children, 
                        ),
                      )
                    )
                  ],
            ),
        ],
      ),
    ),
    ),
    );
  }
  Future<void> downloadFile(StorageReference ref) async{
    final String url = await ref.getDownloadURL();
    final http.Response downloadData = await http.get(url);
    final Directory systemTempDir = Directory.systemTemp;
    final File tempFile = File('${systemTempDir.path}/tmp.pdf');
    if(tempFile.existsSync()){
      await tempFile.delete();
    }
    await tempFile.create();
    final StorageFileDownloadTask task = ref.writeToFile(tempFile);
    final int byteCount = (await task.future).totalByteCount;
    var bodyBytes = downloadData.bodyBytes;
    final String name = await ref.getName();
    final String path = await ref.getPath();
    print('Success\nDownloaded $name\nUrls: $url\nPath: $path\nBytes Count: $byteCount');
  }
}

class UploadTaskListTile extends StatelessWidget {
  const UploadTaskListTile({Key key, this.task, this.onDismissed, this.onDownload}) : super(key: key);

  final StorageUploadTask task;
  final VoidCallback onDismissed;
  final VoidCallback onDownload;

  String get status{
    String result;
    if(task.isComplete){
      if(task.isSuccessful){
        result = 'Complete';
      }else if(task.isCanceled){
        result = 'Cancelled';
      }else{
        result = 'Failed Error ${task.lastSnapshot.error}';
      }
    }else if(task.isInProgress){
      result = 'Uploading';
    }else if(task.isPaused){
      result = 'Paused';
    }
    return result;
  }

  String bytesTransferrred(StorageTaskSnapshot snapshot){
    return '${snapshot.bytesTransferred}/${snapshot.totalByteCount}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (BuildContext context, AsyncSnapshot<StorageTaskEvent> asyncSnapshot){
        Widget subtitle;
        if(asyncSnapshot.hasData){
          final StorageTaskEvent event = asyncSnapshot.data;
          final StorageTaskSnapshot snapshot = event.snapshot;
          subtitle = Text('$status: ${bytesTransferrred(snapshot)} bytes sent');
        }else{
          subtitle = const Text('starting... ');
        }
        return Dismissible(
          key: Key(task.hashCode.toString()),
          onDismissed: (_) => onDismissed, 
          child: ListTile(
            title:Text('Upload Task #${task.hashCode}'),
            subtitle: subtitle,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Offstage(
                  offstage: !task.isInProgress,
                  child: IconButton(
                    icon: const Icon(Icons.pause), 
                    onPressed: () => task.pause()),   
                ),
                Offstage(
                  offstage: !task.isPaused,
                  child: IconButton(
                    icon: const Icon(Icons.file_upload), 
                    onPressed: () => task.resume()),   
                ),
                Offstage(
                  offstage: task.isComplete,
                  child: IconButton(
                    icon: const Icon(Icons.cancel), 
                    onPressed: () => task.cancel()),   
                ),
                Offstage(
                  offstage: !(task.isComplete && task.isSuccessful),
                    child: IconButton(
                    icon: const Icon(Icons.file_download), 
                    onPressed: () => onDownload()),   
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}