import 'package:flutter/material.dart';
import 'package:flutter_appp/addRepeater.dart';
import 'package:flutter_appp/addRouter.dart';

class addAcessPoint extends StatelessWidget {
   List<String> device=['Add router','Add repeater'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Add an access point"),
      ),
       body:ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
                    if(index==0){  
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => addRouter()),
              );}
                  
                   if(index==1){  
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => addRepeater()),
              );}
                  
                 
                },
                title: Text(device[index]),
                leading: (Icon(Icons.add)),
                
              ),
            );
          },
        )
     
    );
  }
}