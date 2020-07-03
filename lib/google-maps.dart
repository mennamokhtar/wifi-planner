// import 'package:flutter/material.dart';
// import 'package:flutter_appp/wall.dart';
// import 'package:google_map_polyline/google_map_polyline.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// //void main() => runApp(MyApp());

// class google_maps extends StatefulWidget {
//   @override
//   _google_mapsState createState() => _google_mapsState();
// }

// class _google_mapsState extends State<google_maps> {

//    // List<wall> place=[  
//   // wall(id:'1',type:'cement',p1:Offset (-100, 0), p2:Offset(-100, 250)),
//   // wall(id:'2',type:'cement',p1:Offset(-100, 0), p2:Offset(50, 0)),
//   // wall(id:'3',type:'cement',p1:Offset(50, 250), p2: Offset(-100, 250)),
//   // wall(id:'4',type:'cement',p1:Offset(50, 250), p2: Offset(50, 100)),
//   // wall(id:'5',type:'cement',p1:Offset(50, 100), p2: Offset(50, 0)),
//   // wall(id:'6',type:'cement',p1:Offset(50, 100), p2: Offset(150, 100)),
//   // wall(id:'7',type:'cement',p1:Offset(50, 250), p2: Offset(150, 250)),
//   // wall(id:'8',type:'cement',p1:Offset(50, 0), p2: Offset(150, 0)),
//   // wall(id:'9',type:'cement',p1:Offset(150, 100), p2: Offset(150, 0)),
//   // wall(id:'10',type:'cement',p1:Offset(150, 250), p2: Offset(150, 100)),
//   //];

//       Set<Polyline> polylines={};

//       // List <wall>walls=[
//       //   new wall(id: '1',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 1'),
//       //      visible: true,
//       //      points: [LatLng(-100,0),LatLng(-100, 250)])
//       //   ),
//       //    new wall(id: '2',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 2'),
//       //      visible: true,
//       //      points: [LatLng(-100,0),LatLng(50, 0)])
//       //   ),
//       //    new wall(id: '3',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 3'),
//       //      visible: true,
//       //      points: [LatLng(50,250),LatLng(-100, 250)])
//       //   ),
//       //    new wall(id: '4',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 4'),
//       //      visible: true,
//       //      points: [LatLng(50,250),LatLng(50, 100)])
//       //   ),
//       //    new wall(id: '5',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 5'),
//       //      visible: true,
//       //      points: [LatLng(50,100),LatLng(50, 0)])
//       //   ),
//       //    new wall(id: '6',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 6'),
//       //      visible: true,
//       //      points: [LatLng(50,100),LatLng(150, 100)])
//       //   ),
//       //    new wall(id: '7',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 7'),
//       //      visible: true,
//       //      points: [LatLng(50,250),LatLng(150, 250)])
//       //   ),
//       //    new wall(id: '8',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 8'),
//       //     visible: true,
//       //      points: [LatLng(50,0),LatLng(150, 0)])
//       //   ),
//       //    new wall(id: '9',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 9'),
//       //      visible: true,
//       //     points: [LatLng(150,100),LatLng(150, 0)])
//       //   ),
//       //    new wall(id: '10',
//       //   type: 'cement',
//       //   p: new Polyline(
//       //     polylineId: PolylineId( 'wall 10'),
//       //     visible: true,
//       //     points: [LatLng(150,250),LatLng(150, 100)])
//       //   ),
//       // ];
  

//   GoogleMapController mapController;
//   final Set <Polyline> polyline={};
//   List<LatLng> coo;
//   GoogleMapPolyline googleMapPolyline=
//    new GoogleMapPolyline(apiKey: "AIzaSyDb3px5Nq0X-m_0hUrW5RTHXpPdfgLfooQl");
   
//     getSomePoint() async {
//      coo=await googleMapPolyline.getCoordinatesWithLocation(
//        origin: LatLng(150,250), 
//        destination: LatLng(150,100),
//         mode: RouteMode.driving
//        );
//     }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getSomePoint();
//   }
   

//   final LatLng _center = const LatLng(150,100);



//   Set<Polyline> polylines_set(List <wall> polyys, Set<Polyline> Polylines) {
//     //Polylines.clear();
//    // int i=0;

//     polyys.forEach((PolyObj) {
// // for(var i=1;i<walls.length;i++){
// //       Polylines.add(polyys[i].p);
// //       print(polyys[i].p.toString());}

//       // switch (PolyObj['type']) {
//       //   case 'route':
//       //     Polylines.add(walls.points, walls.id));
//       //     break;

//       //   default:
//       //     break;
//       // }
//     });

//     return Polylines;
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     polyline.add(Polyline(
//       polylineId: PolylineId('value'),
//       visible: true,
//       points: coo,
//       width: 4,
//       color: Colors.black,
//       startCap: Cap.roundCap,
//       endCap: Cap.buttCap
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),



//         body: Stack(
//           children: <Widget>[
//             Center(
//               child:SizedBox(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height,
//                   child: GoogleMap(
//                     onMapCreated: _onMapCreated,
//                    // polylines:polylines_set(walls, polylines) ,
//                      mapType: MapType.none,
//                      initialCameraPosition: CameraPosition(
//                       target: _center,
//               zoom: 11.0,
//             ),
//            ),
//            ),
//           ),
//           ],
//         ),
//       ),
//     );

    


//   }
// }