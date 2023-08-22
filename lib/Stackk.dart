import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Stack1(),
  ));
}
class Stack1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stack UI"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: 380,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               image: const DecorationImage(
                 fit: BoxFit.cover,
                   image: NetworkImage("https://images.unsplash.com/photo-1651598335167-a77ab62737aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDR8Q0R3dXdYSkFiRXd8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60")),
             ),
            ),
            const Positioned(
                top: 26,
                right: 25,
                child: Text("ICICI Bank",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
            ),

            const Positioned(
              top: 26,
                left: 25,
                child: Text("C r e d i t  C a r d",style: TextStyle(color: Colors.white,fontSize: 20),)
            ),
            Positioned(
              left: 30,
                top: 60,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage("assets/icons/chip.png"))
                  ),
                )),
            const Positioned(
              left: 20,
                bottom: 80,
                child: Text("2 3 4   1 2 3 4   7 7 7   2 2",
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: 30
                  ),)),
            const Positioned(
              left: 25,
                bottom: 65,
                child: Text("0123",style: TextStyle(color: Colors.white),)),
            const Positioned(
              left: 25,
              bottom: 19,
              child: Text("M I F A F A T H I M A",style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
            const Positioned(
              bottom: 65,
              right: 120,
              child: Text("Valid : 09/25",style: TextStyle(color: Colors.white,fontSize: 11),),
              ),
            const Positioned(
              bottom: 58,
                right: 159,
                child: Text("thru",style: TextStyle(color: Colors.white,fontSize: 10),),
            ),
            Positioned(
              right: 25,
              bottom: 15,
              child: Container(
                height: 70,
                width: 60,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage("assets/icons/mastercard.png"))
                ),
              )
            )

          ],
        ),
      ),
    );
  }
}
