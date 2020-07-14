import 'package:flutter/material.dart';
//import 'package:flutter_appp/insertFile.dart';
import 'package:flutter_appp/auth.dart';
import 'package:flutter_appp/help.dart';
import 'package:flutter_appp/homeItems.dart';
import 'package:flutter_appp/indoor.dart';
import 'package:flutter_appp/your_places.dart';
//import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appp/addAcessPoint.dart';
class UploadMultipleImageDemo extends StatefulWidget {
  //global variable
  static String data;
  UploadMultipleImageDemo() : super();

  final String title = 'Firebase Storage';

  @override
  UploadMultipleImageDemoState createState() => UploadMultipleImageDemoState();
}

 
class UploadMultipleImageDemoState extends State<UploadMultipleImageDemo> {


  final AuthService _auth=AuthService();
  List<homeItems> choices=
  [
    // homeItems(name:'Your Places',icon:Icon(Icons.home)),
  homeItems(name:'Insert A New Place',icon:Icon(Icons.add)),
  homeItems(name:'Help',icon:Icon(Icons.help))];
  String _path;
  String s='hiiiii';
  Map<String, String> _paths;
  String _extension;
  FileType _pickType;
  bool _multiPick = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<StorageUploadTask> _tasks = <StorageUploadTask>[];
  //User user = Provider.of<User>(context);
  //User user =Provider.of<User>(context);

  void openFileExplorer() async {
    try {
      _path = null;
      if (_multiPick) {
        _paths = await FilePicker.getMultiFilePath(
            type: _pickType, fileExtension: _extension);
      } else {
        _path = await FilePicker.getFilePath(
            type: _pickType, fileExtension: _extension);
      }
      uploadToFirebase();
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
  }

  uploadToFirebase() {
    if (_multiPick) {
      _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});
    } else {
      String fileName = _path.split('/').last;
      String filePath = _path;
      upload(fileName, filePath);
      loadAsset(_path);
    }
  }
   loadAsset(String path)async{
      String  mydata=await rootBundle.loadString(path);
    UploadMultipleImageDemo.data=mydata;
  // elly zawedtooooo
    print(UploadMultipleImageDemo.data);
     Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => addAcessPoint()),
              );
 
  
  
  }

  upload(fileName, filePath) {
    _extension = fileName.toString().split('.').last;
   // StorageReference storageRef =
     //   FirebaseStorage.instance.ref().child(fileName);
    //final StorageUploadTask uploadTask = storageRef.putFile(
      //File(filePath),
      //torageMetadata(
      //  contentType: '$_pickType/$_extension',
    //   ),
    // );
    // setState(() {
    //   _tasks.add(uploadTask);
    // });
  }

  String _bytesTransferred(StorageTaskSnapshot snapshot) {
    return '${snapshot.bytesTransferred}/${snapshot.totalByteCount}';
  }
  String d=UploadMultipleImageDemo.data;
  String router;

  
  @override
  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('WiFi Planner'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions:<Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed:()async{
              await _auth.signOut();
              
               },)
        ],
        ) ,
        body:ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
              //     if(index==0){  
              //  Navigator.push(
              //  context,
              //  MaterialPageRoute(builder: (context) => your_places()),
              // );}
              // else 
              if(index==0){  
                 openFileExplorer();
              }
              else if(index==1){  
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => help()),
              );}           
              
                 
                },
                title: Text(choices[index].name),
                leading: (choices[index].icon),
                
              ),
            );
          },
        )
        
       

      );
  }
}
