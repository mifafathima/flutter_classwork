import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavDrawer(),
  ));
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage("https://media.istockphoto.com/id/1095151882/photo/corridor-in-school-or-office-building-blur-background-with-blurry-interior-view-empty-hall.jpg?s=612x612&w=0&k=20&c=O7ey7XczdL_335FAb-hu4LZsQIQm7bJJIreHaQGSGds="))),
              accountName: Text("Mifa Fathima"),
              accountEmail: Text("Mifa@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyPCltDctW8IUIaSrQ5RfALl29wIurYRFKXA&usqp=CAU"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkIZPq1HO4qZ7wm77OsTz_aq1wihxxqYbGtEwG7SaY5W7WCVmNJIXG9wiAzcoCNhQZCvk&usqp=CAU"),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1_7DWonddw4UylyQyktsl8XOLelpOKDDvEA&usqp=CAU"),
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
            ),

          ],
        ),
      ),
    );
  }
}
