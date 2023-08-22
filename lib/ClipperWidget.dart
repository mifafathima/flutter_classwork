import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClipperExample(),
  ));
}

class ClipperExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Clippers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [

            ///ClipRect - to crop in rectangular way
            ClipRRect(
              child: Container(
                  child: Align(
                widthFactor: .5,
                //how much width and height we need to crop =>  max 1.0
                heightFactor: .6,
                child: Image.network(
                    "https://images.unsplash.com/photo-1595760780346-f972eb49709f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              )),
            ),

            ///ClipRoundedRect - to crop it in rounded way
            ClipRRect(
                borderRadius: BorderRadius.circular(300),
                //to crop in rounded ways

                child: Image.network(
                    "https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60")),

            ClipOval(
                child: Image.network(
                    "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60")
            ),
            ClipOval(
              child: Image.network("https://plus.unsplash.com/premium_photo-1691675470758-2a20b2be4423?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDk2fEZ6bzN6dU9ITjZ3fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
            ),

            ///ClipperCustom  : we can custom it using clipper dependency
            ClipPath(
              clipper: WaveClipperTwo(
                flip: true,
                reverse: true
              ),
              child:Image.network("https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            ),
            ClipPath(
              clipper: StarClipper(5),
              child:Image.network("https://images.unsplash.com/photo-1688494952956-ccf8c0042a9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDQxfENEd3V3WEpBYkV3fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
            )

          ],
        ),
      ),
    );
  }
}
