import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: New_UI(),
  ));
}

class New_UI extends StatelessWidget {
  const New_UI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome! MAUSAM"),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.qr_code_2)
        ],
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            Stack(
              children: [
                Container(
                  height: 70,
                  color: Colors.red.shade900,
                ),
                Container(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                  child: Container(
                    height: 200,
                    width:500,

                    child: Card(
                      child:
                      Center(
                        child: Column(

                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.flare_outlined),
                Text("Would you like to?",style: TextStyle(fontSize: 20),),
              ],
            ),
           // GridView(gridDelegate: gridDelegate)

              ],
            )
          )
        ],
      ),
    );
  }
}
