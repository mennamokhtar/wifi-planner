import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/database.dart';
import 'package:flutter_appp/files.dart';
import 'package:flutter_appp/indoor.dart';
import 'package:flutter_appp/testtttt.dart';
import 'package:flutter_appp/user.dart';
import 'package:provider/provider.dart';

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
  static String s;
  final DocumentSnapshot post;
  repeaterDetails({this.post});
  @override
  _repeaterDetailsState createState() => _repeaterDetailsState();
}
class _repeaterDetailsState extends State<repeaterDetails> {
   String d=UploadMultipleImageDemo.data;

  @override
  Widget build(BuildContext context) {
     User user = Provider.of<User>(context);
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
           subtitle: Text(widget.post.data["info"],
           style: TextStyle(
          color: Colors.black,)
          ),
          trailing:
               CircleAvatar(
                 radius: 30,
                backgroundColor: Color(0xFF000000),
                                child: IconButton(icon: Icon(Icons.add,
                 color: Colors.white,),
                  onPressed: () async{
                    //  await database(uid: user.uid).updateUserData(
                   
                    //    d,
                    //   repeaterDetails.s=widget.post.data["name"],
                    //   'hooooooo',
                    //       user.uid,
                    //   );
                   Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => indoor()),
              );

                 }),
               )
              
        ),
        ),
      ),
    );
  }
}