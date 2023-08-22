import 'package:flutter/material.dart';

import 'Loginpage.dart';
import 'Navigation drawer eg.dart';
import 'SingleChildScrollView Column.dart';
import 'my splash page.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNavBar(),
  ));
}

class BottomNavBar extends StatefulWidget {

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  var screens = [
    LoginPage(),
    NavDrawer(),
    MySplash(),
    SingleScroll(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.teal,
          selectedItemColor: Colors.white,
          currentIndex: index,
          onTap: (tappedindex){
          setState(() {
            index = tappedindex;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded),label: 'Create'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: 'Profile'),
          ]
      ),
      body: Center(
        child: screens[index],
      ),
    );
  }
}
