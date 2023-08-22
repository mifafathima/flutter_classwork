import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView_Custom(),
  ));
}
class GridView_Custom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text("GridView Count"),
    ),
    body:GridView.custom(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3), childrenDelegate:SliverChildListDelegate(
    List.generate(7, (index) => Container(
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1690848095491-942c798366b8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3Nnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"))
              ),
            ),
            Text("Laviee",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("\$ 250",style: TextStyle(fontSize: 15),)
            
          ],
        ),
      )
      ),
    ))
    ) );
  }
}