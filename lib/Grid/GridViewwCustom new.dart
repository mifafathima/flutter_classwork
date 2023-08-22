import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridCustom2(),
  ));
}
class GridCustom2 extends StatelessWidget {
  var images = [
    "https://media.istockphoto.com/id/1306883952/photo/drinks-with-blur-beach-and-sunset-in-background.webp?b=1&s=170667a&w=0&k=20&c=TMm73db9gjtW65EXHFxqdC95969SPYMiWbIIVu2NsPM=",
    "https://media.istockphoto.com/id/1391731544/photo/cookie-ice-blended-high-resolution-stock-photo.jpg?s=612x612&w=0&k=20&c=fy3G0aum5u4IapRDTXO2smf1bGRcrTjCh_ZmnNhit8s=",
    "https://media.istockphoto.com/id/157509191/photo/double-espresso-shot.jpg?s=612x612&w=0&k=20&c=HOOwVH_kMb8iRAGDFAc6b7tG3ENQZh6bbXt0Doo78zc=",
    "https://media.istockphoto.com/id/1286336843/photo/image-of-knickerbocker-glass-of-strawberry-milkshake-smoothie-topped-with-whipped-cream-and.jpg?s=612x612&w=0&k=20&c=htU9jdASVcAlS8xupq0RG-9ZGfZv1XBfvqnqL2XGACo=",
  ];
  var name =[
    "Passion delight",
    "Oreo frappucchino",
    "Espresso",
    "Vanilla shake"
  ];
  var price =[
  "\$120",
  "\$50",
  "\$250",
  "\$300",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView Custom"),
      ),
      body: GridView.custom(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              ),
          childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           fit: BoxFit.fitHeight,
                          //           image: NetworkImage(images[index]),)),
                          //
                          // ),
                          Image.network(images[index]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(name[index],style: GoogleFonts.lobster(
                            fontSize: 20,
                          ),),
                          Text(price[index],style: GoogleFonts.aBeeZee(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),)

                        ],
                      ),
                    ),
              ),
              childCount: 4)),
    );
  }
}
