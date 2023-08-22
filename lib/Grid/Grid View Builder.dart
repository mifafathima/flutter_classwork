import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView_Builder(),
  ));
}

class GridView_Builder extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView Builder"),
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemCount: 9,
          itemBuilder: (context,index){
        return Card(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("item"),
                Icon(Icons.ac_unit_sharp)
              ]
              ,
            ),
          ));
      }
      )
      );

  }
}
