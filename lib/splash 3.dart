import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_classwork/Registration%20Page.dart';
import 'package:flutter_classwork/stateful%20loginpage.dart';

import 'Loginpage.dart';




void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash3(),
  ));
}

class Splash3 extends StatefulWidget{   //splash3 is initially immutable and we change the state
  @override
  State<Splash3> createState() => Splash3State();   //createState() will create a mutable state for splash3

}

class Splash3State extends State<Splash3>{
  @override
  void initState() {   //what will happen when the app or page is first launched
    Timer( Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegistrationPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       decoration: const BoxDecoration(
           image: DecorationImage(
             fit: BoxFit.cover,
               image: AssetImage("assets/images/bgimage2.jpg"))),
       child: const Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("WELCOME",style: TextStyle(fontSize: 30,color: Colors.white),)
           ],
         ),
         //child: Image.asset("assets/icons/location icon.png",height: 200,width: 200,),
       ),
     ),
   );
  }
}