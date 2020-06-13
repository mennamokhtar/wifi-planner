import 'package:flutter/material.dart';

class help extends StatelessWidget {
  String g='insert a csv file contains the data of the place. then, put the mark on the desired location of the access point then press save and the heatmap will be displayed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Help"),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child:Text("Insert a csv file contains the data of the place. then, put the mark on the desired location of the access point then press save and the heatmap will be displayed",
              style: TextStyle(fontSize: 25),
              
              )
            )
          ],
        ),
      ),
     
    );
  }
}