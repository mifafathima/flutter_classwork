import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MySplash(),
  ));
}


class MySplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///set background color way 1
      //backgroundColor: Colors.orangeAccent,
        body: Container(
          ///set background color way 2 using gradient inside container
          decoration: const BoxDecoration(
          //     gradient: LinearGradient(   //gradient and image ca
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [
          //   Colors.pink,
          //   Colors.purpleAccent,
          //   Colors.pinkAccent
          // ])

              ///set background color way 3 using image
            image: DecorationImage(
              fit: BoxFit.cover,
                image: AssetImage("assets/images/bg image.jpg")
            )

             
    ),
          
          
          child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.account_circle,
            //   size: 70,
            //   color: Colors.pinkAccent,
            // ),
            Image.asset(
              "assets/icons/location icon.png",
              height: 200,
              width: 200,
            ),
            const Text(
              "My Application",
              style: TextStyle(
                  color: Colors.pink, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
      ),
    ),
        ));
  }
}
