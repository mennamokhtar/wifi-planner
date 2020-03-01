import 'package:flutter/material.dart';
import 'package:flutter_appp/authenticate.dart';
import 'package:flutter_appp/home.dart';
import 'package:flutter_appp/user.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user=Provider.of<User>(context);
   



    // return either the Home or Authenticate widget
    // return Authenticate();
    if (user==null){
     return Authenticate();
    }
    else{
      return Home();
    }
  }
} 