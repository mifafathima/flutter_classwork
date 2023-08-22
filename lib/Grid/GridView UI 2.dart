import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView3(),
  ));
}

class GridView3 extends StatelessWidget {

var images = [
  "https://media.istockphoto.com/id/952079442/photo/female-leather-bag.webp?b=1&s=170667a&w=0&k=20&c=bV57JWallZX99GCX9-Wj7qRfu8z88h8wqak6jiG8icA=",
  "https://images.unsplash.com/photo-1577803645773-f96470509666?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3VuZ2xhc3Nlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://media.istockphoto.com/id/1068843992/photo/luxury-watch-isolated-on-white-background-with-clipping-path-gold-watch-women-watch-female.webp?b=1&s=170667a&w=0&k=20&c=dmdny56LLRNpW_l4oQ1LyWtDBqBB4APRHlKaqOz7uZY=",
  "https://images.unsplash.com/photo-1618274158630-bc47a614b3a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGhpZ2glMjBoZWVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
  "https://media.istockphoto.com/id/1317457980/photo/beautiful-girl-wearing-golden-jewerly-a-golden-necklace-and-golden-rings.jpg?s=612x612&w=0&k=20&c=4cPQmuaYcoNUZ8xWjRVplRij_dwLHnU2r7We4JReJI4=",
  "https://images.unsplash.com/photo-1609178016676-dfbdbdeaddbb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hhbm5lbCUyMHBlcmZ1bWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",





];
var name = [
  "Lavie",
  "Stella",
  "Fossil",
  "Givenchy",
  "Oralia green",
  "Channel",


];
var price =[
  "\$120",
  "\$50",
  "\$250",
  "\$300",
  "\$80",
  "\$5540"
  
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.drag_handle),
        centerTitle: true,
        title: Text("SHEIN"),
       actions: [
         Icon(Icons.search),
         SizedBox(width: 20,),
         Icon(Icons.shopping_cart)
       ],

      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 30
          ),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage(images[index]))
                        ),
                      ),
                      Text(name[index],style: GoogleFonts.lobster(
                        fontSize: 30
                      ),),
                      Text(price[index],style: GoogleFonts.cinzel(
                        fontSize: 20
                      ),)
                    ],
                  ),
                ),
              ),
            );

          },itemCount: 6,),
    );
  }
}
