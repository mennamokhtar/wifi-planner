
import 'package:flutter/material.dart';

class wall{

  final String id;
  final String type;
  final Offset p1;
  final Offset p2;

// String get Id{
//   return id;
// }
// String get Type{
//   return type;
// }
// Polyline get poly{
//   return p;
// }
  const wall({Key key,this.id, this.type, this.p1,this.p2});
}