import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RiveAnimExample(),
  ));
}

class RiveAnimExample extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: RiveAnimation.asset("assets/animations/cutecake.riv",fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
