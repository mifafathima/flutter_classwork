import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Expandedd1(),
  ));
}

class Expandedd1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("example"),
          Expanded(child: Image.network("https://images.unsplash.com/photo-1691241829157-1f272cb7fad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8eGpQUjRobGtCR0F8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60")),
          Expanded(child: Image.network("https://images.unsplash.com/photo-1691357045157-8ff460d12231?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDR8eGpQUjRobGtCR0F8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60")),
          Expanded(child: Image.network("https://images.unsplash.com/photo-1691241829157-1f272cb7fad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8eGpQUjRobGtCR0F8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60")),
          Expanded(child: Image.network("https://images.unsplash.com/photo-1691357045157-8ff460d12231?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDR8eGpQUjRobGtCR0F8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60")),


        ],
      ),
    );
  }
}
