import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/testtttt.dart';

class addRouter  extends StatefulWidget {
  @override
  _addRouterState createState() => _addRouterState();
}

class _addRouterState extends State<addRouter> {
  Future getRouters() async {
    var  firestore=Firestore.instance;
    QuerySnapshot qn=await firestore.collection("Routers").getDocuments();
    //array of documents snapshot
    return qn.documents;
  }
  navigatetoDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder:(contex)=>routerDetails(post:post,) ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Add Router"),
      ),
       
       body: Container(
         child: FutureBuilder(
           future:getRouters() ,
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
class routerDetails extends StatefulWidget {
 // routerDetails({Key key}) : super(key: key);
  final DocumentSnapshot post;
  routerDetails({this.post});
  @override
  _routerDetailsState createState() => _routerDetailsState();
}

class _routerDetailsState extends State<routerDetails> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Router Details"),
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
                 color: Colors.white,), onPressed: () {
                   Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => mapa()),
              );

                 }),
               )
              
        ),
        
        
        ),
        
      ),
    );
  }
}