import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView1(),
  ));
}
class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ListView"),
      ),
      body: ListView(
        children: [
          Center(child: Text("Select your food from the menu",style:GoogleFonts.cookie(
            fontSize: 40,
            color: Colors.brown
          ),
          )),
          const Card(
            child: ListTile(
                title: Text("Burger"),
              subtitle: Text("\$50"),
              trailing: Icon(Icons.shopping_cart),
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/burger.jpg")),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text("Pizza"),
              subtitle: Text("\$250"),
              trailing: Icon(Icons.shopping_cart),
              leading: CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTug26w0h0kkYIimVYHNyGAJzwiGBhodIuEOQ&usqp=CAU")),


            ),
          ),
          const Card(
            child: ListTile(
              title: Text("French Fries"),
              subtitle: Text("\$80"),
              trailing: Icon(Icons.shopping_cart),
              leading: CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTedlwcMtg6q95pdawXytV7UMbs8WF5Bn4ZeQ&usqp=CAU")),


            ),
          ),
          const Card(
            child: ListTile(
              title: Text("Noodles"),
              subtitle: Text("\$190"),
              trailing: Icon(Icons.shopping_cart),
              leading: CircleAvatar(backgroundImage:  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShhbuBpqIMHMHsFu7t0xTYgaU17_d3FvG2bg&usqp=CAU")),


            ),
          ),


           const Card(
             child: ListTile(title: Text("Salad"),
                 subtitle: Text("\$120"),
               trailing: Icon(Icons.shopping_cart),
              leading:CircleAvatar(backgroundImage: NetworkImage("https://www.acouplecooks.com/wp-content/uploads/2022/03/Mango-Salad-002s.jpg"))
             ),
           ),

          // Text("Item 6"),
        ],
      ),
    );
  }
}
