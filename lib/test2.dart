import 'package:flutter/material.dart';
import 'package:flutter_appp/addAcessPoint.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapa extends StatefulWidget {
  @override
  _mapaState createState() => _mapaState();
}

class _mapaState extends State<mapa> {

  final Set<Polyline> _polyline = {};  
             
  GoogleMapController controller;                     
  
  List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List();
  List<LatLng> latlngSegment3 = List();
  List<LatLng> latlngSegment4 = List();

  static LatLng _lat1 = LatLng(0,0);
  static LatLng _lat2 = LatLng(0,5);
  static LatLng _lat3 = LatLng(10,5);
  static LatLng _lat4 = LatLng(10,0);
  static LatLng _lat5 = LatLng(5,5);
  static LatLng _lat6 = LatLng(5,10);
  static LatLng _lat7 = LatLng(0,10);
  static LatLng _lat8 = LatLng(10,10);
  LatLng _lastMapPosition = _lat5;

  @override
  void initState() {
    super.initState();


//       latlngSegment2.add(_wall1Lat1);
//       latlngSegment2.add(_wall1Lat2);       latlngSegment2.add(_wall2Lat1); latlngSegment2.add(_wall2Lat2);
//       latlngSegment2.add(_wall3Lat1);latlngSegment2.add(_wall3Lat2); latlngSegment2.add(_wall4Lat1);
// latlngSegment2.add(_wall4Lat2); latlngSegment2.add(_wall5Lat1);latlngSegment2.add(_wall5Lat2);latlngSegment2.add(_wall6Lat1);
// latlngSegment2.add(_wall6Lat2); latlngSegment2.add(_wall7Lat1);latlngSegment2.add(_wall7Lat2);latlngSegment2.add(_wall8Lat1);
// latlngSegment2.add(_wall8Lat2); latlngSegment2.add(_wall9Lat1); latlngSegment2.add(_wall9Lat2); latlngSegment2.add(_wall10Lat1);
// latlngSegment2.add(_wall10Lat2);
    //line segment 1
    latlngSegment2.add(_lat4);
    latlngSegment2.add(_lat5);
    latlngSegment1.add(_lat4);
    latlngSegment1.add(_lat8);
    latlngSegment1.add(_lat7);
    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat4);
    //line segment 3
    latlngSegment3.add(_lat3);
    latlngSegment3.add(_lat2);
    latlngSegment3.add(_lat5);
    latlngSegment3.add(_lat6);
//     //latlngSegment3.add(_lat2);
// latlngSegment4.add(_lat8);
// latlngSegment4.add(_lat5);


  }
   void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      // for(int i=0;i<walls.length;i++){
      //  _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points: walls[i].p.points,
      //   width: 2,
      //   color: Colors.black,
      // ));
      // }

     
      
      _polyline.add( Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points:latlngSegment1  ,
        width: 2,
        color: Colors.black,
      ));
      
          _polyline.add( new Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment3,
        width: 2,
        color: Colors.black,
        
      ));
      
      //   _polyline.add(new Polyline(
      //   polylineId: PolylineId('line2'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points: latlngSegment4,
      //   width: 2,
      //   color: Colors.red
      // ));
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
        children: <Widget>[
          Container(
            child: Center(
            child:SizedBox(
               width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                
                child: GoogleMap(
            //that needs a list<Polyline>
            polylines: _polyline,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _lastMapPosition,
              zoom: 20.0,
            ),
            mapType: MapType.none,
            
        ),
        
            ),
            ),
          ),
         
          
             Stack(  
            children: <Widget>[ 
               
              Container(
               
                 margin: EdgeInsets.only(top:MediaQuery.of(context).size.height-600  ),
                child: RaisedButton(
                   
                       shape: RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(10.0),
                       ),
              
                     child:new Icon(
                       Icons.add,
                       color: Colors.white,),
                      color: Colors.black,
                      elevation: 4.0,
                      onPressed: () {
                    Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => addAcessPoint()),
                    );
                 
              
        
                       },
                    ),
              ),
            
             Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height-650  ),
               child: FloatingActionButton.extended(
                  
                onPressed: (){
        
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