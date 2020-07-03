// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// // import 'package:flutter/material.dart';
// // import 'package:flutter_appp/wall.dart';
// // import 'package:google_map_polyline/google_map_polyline.dart';
// //import 'package:google_maps_flutter/google_maps_flutter.dart';
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: HomeWidget(),
//       ),
//     );
//   }
// }

// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CustomPaint( //                       <-- CustomPaint widget
//         size: Size(300, 300),
//         painter: MyPainter(),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter { //         <-- CustomPainter class
//   @override
//  void paint(Canvas canvas, Size size) {
//     final pointMode = ui.PointMode.polygon;
//   final points = [
//     Offset(50, 100),
//     Offset(150, 75),
//     Offset(250, 250),
//     Offset(130, 200),
//     Offset(270, 100),
//   ];
//   final paint = Paint()
//     ..color = Colors.black
//     ..strokeWidth = 4
//     ..strokeCap = StrokeCap.round;
//     canvas.drawPoints(pointMode, points, paint);
//     canvas.drawLine(Offset.zero, Offset(30,40),
//     paint);
// }

//   @override
//   bool shouldRepaint(CustomPainter old) {
//     return false;
//   }
// }
