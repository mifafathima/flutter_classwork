import 'package:flutter/material.dart';
import 'package:flutter_classwork/Passing%20data%20between%20screens/using%20constructor/to_stateful_page.dart';
import 'package:flutter_classwork/Passing%20data%20between%20screens/using%20constructor/to_stateless_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DataPage(),
  ));
}

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passing data between screens using constuctor"),
      ),
      body: Center(
        child: Container(
          height: 250,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StatelessPage1(
                            name: "L U M I N A R",
                            location: "Kakkanad, Kochi",
                            Phone: 987635636746)));
                  },
                  child: Text("To Stateless page")),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StatefulPage2(name : "LUMINAR TECHNOLAB",location : "Kakkanad,Kochi" , phone: 9876543245)));
                  },
                  child: Text("To Stateful page")),
            ],
          ),
        ),
      ),
    );
  }
}
