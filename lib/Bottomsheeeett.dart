import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Bottomsheet1(),
  ));
}

class Bottomsheet1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom sheet"),
      ),
      body: Center(
          child: GestureDetector(
              //can use InkWell also for performing events
              onDoubleTap: () => showSheet(context),
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1675011400562-e0e49dfd07b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
                height: 300,
                width: 300,
              ))),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                ),
                title: Text("WhatsApp"),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.purple,
                ),
                title: Text("InstaGram"),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                title: Text("Facebook"),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
                title: Text("Twitter"),
              ),
            ],
          ));
        });
  }
}
