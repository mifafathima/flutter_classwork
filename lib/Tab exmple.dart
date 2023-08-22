import 'package:flutter/material.dart';
import 'package:flutter_classwork/ListView/List%20View%202.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TabExample(),
  ));
}
class TabExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("WhatsApp"),
            actions: [
              Icon(Icons.camera_alt),
              SizedBox(width: 10,),
              Icon(Icons.search),
              SizedBox(width: 10,),
              PopupMenuButton(itemBuilder: (context){
                return [
                  PopupMenuItem(child: Text("settings")),
                  PopupMenuItem(child: Text("settings")),
                  PopupMenuItem(child: Text("settings")),
                  PopupMenuItem(child: Text("settings")),
                  PopupMenuItem(child: Text("settings")),
                  PopupMenuItem(child: Text("settings")),

                ];
              })
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.zero,
                tabs: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
                  child: Icon(Icons.people)),
              SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                  child: Text("Chats")),
              SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                  child: Text("Status")),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Text("Calls")),
            ]),
          ),
          body: TabBarView(children: [
            Center(child: Text("Community",)),
            Center(child: ListView2()),
            Center(child: Text("Status",)),
            Center(child: Text("Calls",)),

          ]),
        ));



  }
}
