import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView_with_builder(),
  ));
}
class ListView_with_builder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Card(
          child: Center(
            child:
            Image.asset("assets/images/burger.jpg")
          ),
        );
      },
      itemCount: 4,),
    );
  }
}
