import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: RefHome(),
  ));
}

class RefHome extends StatelessWidget {
  var images1 = [
    "https://media.istockphoto.com/id/952079442/photo/female-leather-bag.webp?b=1&s=170667a&w=0&k=20&c=bV57JWallZX99GCX9-Wj7qRfu8z88h8wqak6jiG8icA=",
    "https://images.unsplash.com/photo-1577803645773-f96470509666?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3VuZ2xhc3Nlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://media.istockphoto.com/id/1068843992/photo/luxury-watch-isolated-on-white-background-with-clipping-path-gold-watch-women-watch-female.webp?b=1&s=170667a&w=0&k=20&c=dmdny56LLRNpW_l4oQ1LyWtDBqBB4APRHlKaqOz7uZY=",
    "https://images.unsplash.com/photo-1618274158630-bc47a614b3a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGhpZ2glMjBoZWVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
    "https://media.istockphoto.com/id/1317457980/photo/beautiful-girl-wearing-golden-jewerly-a-golden-necklace-and-golden-rings.jpg?s=612x612&w=0&k=20&c=4cPQmuaYcoNUZ8xWjRVplRij_dwLHnU2r7We4JReJI4=",
    "https://images.unsplash.com/photo-1609178016676-dfbdbdeaddbb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hhbm5lbCUyMHBlcmZ1bWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
  ];
  var name1 = [
    "Lavie",
    "Stella",
    "Fossil",
    "Givenchy",
    "Oralia green",
    "Channel",


  ];
  var price1 =[
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
        title: Text("GridView using Refactoring"),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return MyWidget(MyImage:NetworkImage(images1[index]), name: name1[index], price: price1[index],);
          },itemCount: 6,),
    );
  }
}

class MyWidget extends StatelessWidget {
  //column widgets cannot be null

 final ImageProvider MyImage;
 final String name;
 final String price;

   const MyWidget({
    super.key,
    required this.MyImage,
     required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:MyImage)),
          ),
          Text(name,
            style: GoogleFonts.playfairDisplay(fontSize: 20),
          ),
          Text(price),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  label: Text("WishList")),
              SizedBox(width: 10,),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                  label: Text("Add to Cart")),
            ],
          )
        ],
      ),
    );
  }
}
