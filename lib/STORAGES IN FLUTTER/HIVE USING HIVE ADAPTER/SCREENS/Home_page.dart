import 'package:flutter/material.dart';

class Hive_Home extends StatelessWidget {
 String? email;
 Hive_Home({this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome $email"),
      ),
    );
  }
}
