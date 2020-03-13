import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addRepeater  extends StatefulWidget {
  @override
  _addRepeaterState createState() => _addRepeaterState();
}

class _addRepeaterState extends State<addRepeater> {
  Future getRepeater() async {
    var  firestore=Firestore.instance;
    QuerySnapshot qn=await firestore.collection("Repeaters").getDocuments();
    //array of documents snapshot
    return qn.documents;
  }
  navigatetoDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder:(contex)=>repeaterDetails(post:post,) ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Add a repeater"),
      ),
       body: Container(
         child: FutureBuilder(
           future:getRepeater() ,
           builder: (_ ,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
           return Center(
            child:Text("loading..."),
           );
          } 
          else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_,index){
                return ListTile(
                 title:Text(snapshot.data[index].data["name"]),
                 
               onTap: ()=>navigatetoDetail(snapshot.data[index]),
                );

            });

            

          }
         }),
       ),
    );
  }
}

class repeaterDetails extends StatefulWidget {
 // routerDetails({Key key}) : super(key: key);
  final DocumentSnapshot post;
  repeaterDetails({this.post});
  @override
  _repeaterDetailsState createState() => _repeaterDetailsState();
}

class _repeaterDetailsState extends State<repeaterDetails> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("repeater Details"),
      ),
          body: Container(
        child:Card(
        child:ListTile(
          title: Text(widget.post.data["name"]),
          subtitle: Text(widget.post.data["info"]),
        ),
        ),
      ),
    );
  }
}