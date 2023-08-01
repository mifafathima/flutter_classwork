import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_classwork/stateful%20loginpage.dart';

import 'Loginpage.dart';




void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash3(),
  ));
}

class Splash3 extends StatefulWidget{   //
  @override
  State<Splash3> createState() => Splash3State();

}

class Splash3State extends State<Splash3>{
  @override
  void initState() {
    Timer( Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage2()));
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