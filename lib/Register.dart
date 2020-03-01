 import 'package:flutter/material.dart';
import 'package:flutter_appp/auth.dart';
import 'package:flutter_appp/loading.dart';

class Register  extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth=AuthService();
  final _formKey= GlobalKey<FormState>();
     bool loading = false;
  String email='';
  String password='';
  String error='';
  // String user_name='';
  // String phone_number='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
       backgroundColor: Colors.brown[100],
       appBar: AppBar(
         backgroundColor: Colors.brown[400],
         elevation: 0.0,
         title: Text ('Sign up to WiFi Planner'),
         actions: <Widget>[
           FlatButton.icon( 
              icon: Icon(Icons.person), 
              label: Text('Sign in'),
           onPressed: (){
             widget.toggleView();
           }
           )
         ],
       ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
        child:Form(
          key:_formKey,
          child:Column(
            children:<Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration:InputDecoration(
                 hintText: 'Email', 
                ) ,
                validator: (val)=>val.isEmpty?'Enter an email':null, 
                onChanged:(val){
                  setState(()=>email=val);

              }
              ),
               SizedBox(height:20.0),
              TextFormField(
                decoration:InputDecoration(
                 hintText: 'Password', 
                ) ,
                 validator: (val)=>val.length<4?'Enter a password 4+ chars long':null, 
                obscureText: true,
                onChanged:(val){
                  setState(()=>password=val);

              }
              ) ,
              // SizedBox(height:20.0),
              // TextFormField(
              //   // obscureText: true,
              //   onChanged:(val){
              //     setState(()=>user_name=val);

              // }
              // ),
              // SizedBox(height:20.0),
              // TextFormField(
              //   obscureText: true,
              //   onChanged:(val){
              //     setState(()=>phone_number=val);

              // }
              // ) ,
              SizedBox(height: 20.0),
              RaisedButton(
                color:Colors.pink[400],
                child: Text( 
                  'Register',
                  style: TextStyle(color:Colors.white),
                  ),
                  onPressed:()async {
                 if(_formKey.currentState.validate()){
                   setState(()=>loading=true);
                   dynamic result=await _auth.registerWithEmailAndPassword(email,password);
                    if (result==null){

                      setState((){
                        error='please enter a valid email';
                         loading=false;
                         });

                    }
                 }

                  }

              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style:TextStyle(color:Colors.red, fontSize:14.0),

              ),
              
            ],
          
        ),
     
      )

     )
     );
  }
}