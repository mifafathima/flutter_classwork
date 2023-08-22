import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView_Extent(),
  ));
}
class GridView_Extent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView Extent"),
      ),
      body: GridView.extent(maxCrossAxisExtent: 4,
        children:
          List.generate(20, (index) => Card(
            color: Colors.amber,
            child: Column(
              children: [
                Text("HI max"),
                SizedBox(height: 20,),
                Icon(Icons.ac_unit_sharp)
              ],
            ),
          ))

      ),
    );
  }
}
