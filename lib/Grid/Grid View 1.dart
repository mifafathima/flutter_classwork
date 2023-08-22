import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView1(),
  ));
}

class GridView1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Grid View"),
      ),
      body: GridView(gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
      // SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2),
        children:
          List.generate(15, (index) => Card(
            color: Colors.brown,
            child:Center(
            child: Icon(Icons.account_circle),
          )),

      ),
    ));
  }
}
