import 'package:flutter/material.dart';
import 'package:flutter_appp/wall.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<wall> place=[
  wall(uid:'1',type:'cement',p1:Offset (-100, 0), p2:Offset(-100, 250)),
  wall(uid:'2',type:'cement',p1:Offset(-100, 0), p2:Offset(50, 0)),
  wall(uid:'3',type:'cement',p1:Offset(50, 250), p2: Offset(-100, 250)),
  wall(uid:'4',type:'cement',p1:Offset(50, 250), p2: Offset(50, 100)),
  wall(uid:'5',type:'cement',p1:Offset(50, 100), p2: Offset(50, 0)),
  wall(uid:'6',type:'cement',p1:Offset(50, 100), p2: Offset(150, 100)),
  wall(uid:'7',type:'cement',p1:Offset(50, 250), p2: Offset(150, 250)),
  wall(uid:'8',type:'cement',p1:Offset(50, 0), p2: Offset(150, 0)),
  wall(uid:'9',type:'cement',p1:Offset(150, 100), p2: Offset(150, 0)),
  wall(uid:'10',type:'cement',p1:Offset(150, 250), p2: Offset(150, 100)),
  ];
  

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
                    mapType: MapType.none,
                    // polygons: MapType,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );

    


    

  }
}