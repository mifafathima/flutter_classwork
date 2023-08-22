import 'package:flutter/material.dart';

class StatefulPage2 extends StatefulWidget {
  final String name;   //we give final so there is no need of null check

  final String location;

  int? phone;

   StatefulPage2({super.key, required this.name, required  this.location,   this.phone});

  @override
  State<StatefulPage2> createState() => _StatefulPage2State();
}

class _StatefulPage2State extends State<StatefulPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name),
              Text(widget.location),
              Text('${widget.phone}')
            ],
          ),
        ),
      ),

    );
  }
}
