import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Slivers1(),
  ));
}

class Slivers1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          title: const Text("Sliver AppBar"),
          bottom: AppBar(
            elevation: 0,
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.camera_alt)
                ),
              ),
            ),
          ),
        ),
          // SliverList(delegate: SliverChildBuilderDelegate((context, index) => Container(
          //   height: 80,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(40),
          //   ),
          //   child: Text("Data $index"),
          // )))
          SliverGrid(delegate: SliverChildBuilderDelegate((context, index) => Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text("Item $index"),
            ),

          ),
            childCount: 12,
          ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),)
        ],
      )),
    );
  }
}
