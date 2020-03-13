import 'package:flutter/material.dart';
import 'package:flutter_appp/auth.dart';
import 'package:flutter_appp/google-maps.dart';
import 'package:flutter_appp/help.dart';
import 'package:flutter_appp/homeItems.dart';
import 'package:flutter_appp/insertFile.dart';
import 'package:flutter_appp/testtttt.dart';
import 'package:flutter_appp/your_places.dart';

class Home extends StatelessWidget {
  final AuthService _auth=AuthService();
  List<homeItems> choices=[homeItems(name:'Your Places',icon:Icon(Icons.home))
  ,homeItems(name:'Insert A New Place',icon:Icon(Icons.add)),
  homeItems(name:'Help',icon:Icon(Icons.help))];
  
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
          itemCount: 3,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
                  if(index==0){  
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => your_places()),
              );}
              else if(index==1){  
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => TestMapPolyline()),//maps l gdeeda tesettttt
              );}
              else if(index==2){  
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