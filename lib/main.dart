import 'package:flutter/material.dart';
import 'package:flutter_appp/auth.dart';
import 'package:flutter_appp/user.dart';
import 'package:flutter_appp/wrapper.dart';
import 'package:provider/provider.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
} 