import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_appp/indoor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/testtttt.dart';
class meeeeeee extends StatefulWidget {
  //global variable
  static String data;


  meeeeeee() : super();

  final String title = 'Firebase Storage';

  @override
  _meeeeeeeState createState() => _meeeeeeeState();
}


class _meeeeeeeState extends State<meeeeeee> {
  String s;
  final FirebaseStorage storage = FirebaseStorage(
      app: Firestore.instance.app,
      storageBucket: 'gs://planner-72a47.appspot.com');
      //gs://planner-72a47.appspot.com

  Uint8List imageBytes;
  String errorMsg;


  _meeeeeeeState() {
  
    String k=indoor.ID;
   print(k) ;
   print('yarab');
                     
     storage.ref().child(k).getData(10000000).then((data) =>


                setState(() {
                  imageBytes = data;
                })
        ).catchError((e) =>
                setState(() {
                  errorMsg = e.error;
                })
        );
  }

  @override
  Widget build(BuildContext context) {
    var img = imageBytes != null ? Image.memory(
        imageBytes,
        fit: BoxFit.cover,
      ) : Text(errorMsg != null ? errorMsg : "Loading...");

    return new Scaffold(
       backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Heatmap"),
      ),
        // appBar: new AppBar(
        //   title: new Text(widget.title),
        // ),
        body: new ListView(
          children: <Widget>[
            img,
          ],
        ));
  }
}

