import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

 class _App extends State<App> {
  @override
  String _filePath;
  String _openResult;
  List<List<dynamic>> data = [];

 
  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath(
          type: FileType.CUSTOM, fileExtension: 'csv');
      if (filePath == '') {
        return;
      }
      print("Path: " + filePath);
      setState(() {
        this._filePath = filePath;
      });
    } on PlatformException catch (e) {
      print("Error picking file: " + e.toString());
    }
  }
  

  Future<File> get _localFile async {
    final path = await _filePath;
    return File('$path');
  }

   
  Future<int> readContents() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If we encounter an error, return 0
      return 0;
    }
  }
  loadAsset()async{
      final mydata=await rootBundle.loadString(_filePath);
    print (mydata);
    List<List<dynamic>> csvTable=CsvToListConverter().convert(mydata);
    data=csvTable ;
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Insert CSV file"),
      ),
                   body:RaisedButton(
                     shape: RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(18.0),
                     ),
                    child: const Text('Done'),
                    textColor: Colors.white,
                    color: Colors.black,
                    elevation: 4.0,
                    //splashColor: Colors.black,
                    onPressed: () async{
                 
                       print('Verifying click done'); 
                            await loadAsset();
                    //   Show contents of the file
        
                     },
                  ),
            
            floatingActionButton: FloatingActionButton.extended(
              onPressed: getFilePath,
              tooltip: 'Choose file to import',
              icon: Icon(Icons.add),
              label:Text('insert a file'),
             backgroundColor: Colors.black,
            )
    );
  }

 }
