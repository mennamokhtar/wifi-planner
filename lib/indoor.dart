
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/files.dart';
import 'API.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:flutter_appp/addAcessPoint.dart';
import 'package:flutter_appp/database.dart';
import 'package:flutter_appp/heatmap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_appp/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_appp/files.dart';
import 'package:flutter_appp/addRouter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class indoor extends StatefulWidget {
    static String ID;
  indoor({Key key}) : super(key: key);

  @override
  _indoorState createState() => _indoorState();
}

class _indoorState extends State<indoor> {
 final Set<Polyline> _polyline = {};
 final Set<Polyline> _poly = {};
 final Set<Polyline> polyline = {};
  List<LatLng> latlang_points = List<LatLng>(); 
List<LatLng>finished_points  = List<LatLng>(); 
List<LatLng>finished_points2  = List<LatLng>(); 
   GoogleMapController mapController;
   String d=UploadMultipleImageDemo.data;
  //  List<LatLng> latlngSegment1 = [LatLng(10,10),LatLng(5, 3)];
  //  List<LatLng> latlngSegment2 = [LatLng(5,3),LatLng(0,0)];
  //  List<LatLng> latlngSegment3 = [LatLng(0,0),LatLng(5, 5)];
  final LatLng _center = const LatLng(0, 0);
  void initState() {
     markers=Set.from([]);
  }
Set<Marker>markers;
  // @override

  void _onMapCreated(GoogleMapController controller) {
    manipulation();
     setState(() {

    mapController = controller;
    _polyline.add( new Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: finished_points,
        width: 2,
        color: Colors.black,
        
      ));     
       _polyline.add( new Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: finished_points2,
        width: 2,
        color: Colors.black,
        
      ));   
      });
    
  }
  void manipulation(){
    List<String> points = List<String>();
    List<String> s= d.split(" ");
    for(var i = 1; i < s.length; i++){
      // print(i);
      String sss="";
      String x="";
      String x2="";
      int repeate;
      int z=0;
      int y=0;
      int z2=0;
      int y2=0;
      repeate=s[i].indexOf('repeate');
      if(repeate>0){
      List <String> rep= s[i].split("repeate");
      for(int t=1;t<rep.length;t++){
  
      int m=rep[t].indexOf("(");
      int n=rep[t].indexOf(")");
      for(int j=m+1;j<n;j++){
      sss=sss+rep[t][j];
 print(rep[t][j]);
//  print(m);
 }

 points.add(sss);
 sss="";
   m=rep[t].lastIndexOf("(");
   n=rep[t].lastIndexOf(")");
  for(int j=m+1;j<n;j++){
    sss=sss+rep[t][j];
//  print(rep[t][j]);
//  print(m);
 }
 print(sss);
 points.add(sss);
}
print(sss);
print("da repeate");
      }
      z=s[i].indexOf('(');
      y=s[i].indexOf(')');
      z2=s[i].lastIndexOf('(');
      y2=s[i].lastIndexOf(')');
      for(var j=z+1; j<y; j++){
       x=x+s[i][j].toString();
      }
      points.add(x);
      for(var j=z2+1; j<y2; j++){
       x2=x2+s[i][j].toString(); 
      }
      
      points.add(x2);
    }
  //  List<LatLng> latlang_points = List<LatLng>();
  
    for(int i=0;i<points.length;i++){
      List c=points[i].split(",");
      String lat=c[0];
      String lng=c[1];
      var latitude = double.parse(lat);
      var longitude = double.parse(lng);
      print(latitude);
      LatLng latlng=new LatLng(latitude,longitude);
      latlang_points.add(latlng);
      // latlngSegment1.add();
    }

    for(int i=0;i<latlang_points.length;i=i+2){
      if(i==0){
        finished_points.add(latlang_points[i]);
        finished_points.add(latlang_points[i+1]);
        
      }
      else{
         LatLng current=latlang_points[i];
         LatLng previous=latlang_points[i-1];
        if(current==previous){
          finished_points.add(current);
          finished_points.add(latlang_points[i+1]);
        
        }
        else{
finished_points2.add(current);
finished_points2.add(latlang_points[i+1]);
        
        }
      }
    }
     print(latlang_points);
 print("hhhhhooooo");
     print(finished_points);
     print(finished_points2);
    //  print(points);
    //  print(points.length);
    
}  
     String url;    
    String x;   
     String s="user id:";
         String space="  ";
          String QueryText = 'Query';
          String router=routerDetails.s;
  Widget build(BuildContext context) {
 User user = Provider.of<User>(context);
     return Scaffold(
       backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("heyy"),
      ),
        body: Stack(
          children:<Widget>[
             Container(
                 child: Center(
            child:SizedBox(
               width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                
               child: GoogleMap(
            markers:markers,
                 onTap: (pos) async{
                           await database(uid: user.uid).updateUserData(
                          
                           d,
                          routerDetails.s,
                           x=pos.toString(),
                           user.uid,
                           '0',
                          );
                           indoor.ID=user.uid;
                           url = 'http://10.0.2.2:5000/api?Query=' +space.toString()+router.toString()+space.toString()+x.toString()+space.toString()+d.toString()+space.toString()+user.uid.toString()+space.toString();
                              s = await Getdata(url);
                              var DecodedData = jsonDecode(s);
                              setState(() {
                                QueryText = DecodedData['Query'];
                              });
    // you have latitude and longitude here 
    print(pos);
    Marker m=Marker(
      markerId: MarkerId('1'),
     
      //icon: customicon,
      position: pos
    );
     setState((){
 markers.add(m);
      });
   
    //  latitude = latLng.latitude;
    //  longitude = latLng.longitude;
     
  },
               polylines: _polyline,
            //  polylines:_poly,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
            
            ),
             mapType: MapType.none,
          ),
            ),
            ),
             ),
                          Stack(  
            children: <Widget>[ 
               
              // Container(
               
              //    margin: EdgeInsets.only(top:MediaQuery.of(context).size.height-600  ),
              //   child: RaisedButton(
                   
              //          shape: RoundedRectangleBorder(
              //            borderRadius: new BorderRadius.circular(10.0),
              //          ),
              
              //        child:new Icon(
              //          Icons.add,
              //          color: Colors.white,),
              //         color: Colors.black,
              //         elevation: 4.0,
              //         onPressed: () {
              //       Navigator.push(
              //        context,
              //        MaterialPageRoute(builder: (context) => addAcessPoint()),
              //       );
                 
              
        
              //          },
              //       ),
              // ),
            
             Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height-650  ),
               child: FloatingActionButton.extended(
                  
                onPressed: () async {
        //  Navigator.push(
        //              context,
        //              MaterialPageRoute(builder: (context) => heatmap()),
        //             );
        
           

                         
              //    http.Client().close();
                          
                            
                           Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => meeeeeee()),
                    );



                },
                tooltip: 'Choose file to import', 
               backgroundColor: Colors.black,
               //icon:Icon(Icons.add),
               label: Text('save'),
            ),
             )
    
                  ],
                  ) ,
          ],
        ) );
  }
}
