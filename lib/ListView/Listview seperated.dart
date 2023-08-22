import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView_Seperated(),
  ));
}
class ListView_Seperated extends StatelessWidget {
  var name =["January","February","March","April","May","June","July","August","September","October","November","December"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ListView Seperated"),
        ),
        body: ListView.separated(itemBuilder: (context, index) {
          return SizedBox(
            height: 50,
            child: Card(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(name[index]),
              ),
            ),
          );
        },

            separatorBuilder: (context, index) {
              if (index % 4 == 0) {
                return Card(
                  color: Colors.red,
                  child: Text("Advertisement"),
                );
              } else {
                return SizedBox();
              }
            }, itemCount: 12
        )
    );
  }
}
