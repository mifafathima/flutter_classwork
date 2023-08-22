import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView_Count(),
  ));
}

class GridView_Count extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView Count"),
      ),
      body: GridView.count(crossAxisCount: 3,
          children: 
        List.generate(20, (index) => Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello there"),
              SizedBox(height: 20,),
              Icon(Icons.ac_unit_sharp)
            ],
          ),
        ))    
        
      ),
      
    
    );
  }
}
