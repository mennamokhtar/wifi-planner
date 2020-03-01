import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint( //                       <-- CustomPaint widget
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    //                                             <-- Insert your painting code here.

    
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}