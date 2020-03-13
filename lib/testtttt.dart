import 'package:flutter/material.dart';
import 'package:flutter_appp/addAcessPoint.dart';
//import 'accesspoint.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMapPolyline extends StatefulWidget {
  @override
  _TestMapPolylineState createState() => _TestMapPolylineState();
}

class _TestMapPolylineState extends State<TestMapPolyline> {

  final Set<Polyline> _polyline = {};                 

  GoogleMapController controller;                     
  
  List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List();
  List<LatLng> latlngSegment3 = List();

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
    //line segment 1
    latlngSegment1.add(_lat4);
    latlngSegment1.add(_lat8);
    latlngSegment1.add(_lat7);
    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat4);


    // //line segment 2
    // latlngSegment2.add(_lat5);
    // latlngSegment2.add(_lat2);
    // latlngSegment2.add(_lat7);
    // latlngSegment2.add(_lat6);
    //  latlngSegment2.add(_lat5);
    //line segment 3
    latlngSegment3.add(_lat3);
    latlngSegment3.add(_lat2);
    latlngSegment3.add(_lat5);
    latlngSegment3.add(_lat6);
    //latlngSegment3.add(_lat2);
  }

 button(){
  Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => addAcessPoint()),
              );
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
         
          
             Stack(    children: <Widget>[  
             Container(
         alignment: Alignment.topRight,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => addAcessPoint()),
                  );

            },
          ),
        
      ),

      
Positioned(
                   // height: 50,
                    width: MediaQuery.of(context).size.width,
                    bottom:MediaQuery.of(context).size.height-150,
     
     child: Container(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Text('save'),
            onPressed: () {
              

            },
          ),
        ),
      
                )   ]) 
    
        ],
     ) );
    
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

      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[0].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));
      
      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points:latlngSegment1  ,
        width: 2,
        color: Colors.black,
      ));
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line2'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points: latlngSegment2,
      //   width: 2,
      //   color: Colors.red,
      // ));
          _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment3,
        width: 2,
        color: Colors.black,
      ));
      
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[3].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));
      
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[4].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));
      
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[5].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));
      
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[6].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));
      
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[7].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));
      
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[8].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));
      
      // _polyline.add(Polyline(
      //   polylineId: PolylineId('line1'),
      //   visible: true,
      //   //latlng is List<LatLng>
      //   points:  walls[9].p.points,
      //   width: 2,
      //   color: Colors.blue,
      // ));

      //different sections of polyline can have different colors
      
    });
  }
}