import 'package:flutter/material.dart';

void main(){         //to execute the programme main is mandatory
  //runApp(initial route) attach the widget tree to the UI
  runApp(MaterialApp(     //default theme of our app
    home: SplashPage(),   //initial page
  ));
}
class SplashPage extends StatelessWidget{   //this page does not undergo any changes
  @override
  Widget build(BuildContext context){  //locate widget position in widget tree
    //entire screen
    return Scaffold(
      appBar:AppBar(title:Text("My Splash Page") ,
      )
    );
  }

}