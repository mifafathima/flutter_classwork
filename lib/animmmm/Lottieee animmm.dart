import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Lotiee_animm(),
  ));
}
class Lotiee_animm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lottie Anim"),
      ),
      body: ListView(
        children: [
          Lottie.asset("assets/animations/Animation1.json",height: 460,width: 300),
          Lottie.network("https://lottie.host/c372ba00-c3a6-4dbf-b0b9-483461f5b481/FetDsv40Ax.json"),

        ],
      ),
    );
  }
}
