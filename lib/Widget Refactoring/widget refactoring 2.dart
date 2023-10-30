import 'package:flutter/material.dart';

import 'MyRefactoring widget.dart';

void main() {
  runApp(MaterialApp(
    home: Refactoring3(),
  ));
}

class Refactoring3 extends StatelessWidget {
  const Refactoring3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refactoring 3"),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return MyRefactoringWidget(
              rimage: Image.network(
                  "https://images.unsplash.com/photo-1693478134665-f8921620dbd4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDE3fDZzTVZqVExTa2VRfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
              bgcolor: Colors.lime,
              label: Text("Moon Phase"),
              ricon: Icon(Icons.access_time_filled_rounded),

            );
          },itemCount: 10,),
    );
  }
}
