import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView2(),
  ));
}


class GridView2 extends StatelessWidget {
  var colors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.pinkAccent,
    Colors.lightGreenAccent,
    Colors.yellow,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.brown
  ];
  var icons = [
    Icons.home,
    Icons.add_alert_rounded,
    Icons.linked_camera_sharp,
    Icons.adb,
    Icons.stars_rounded,
    Icons.access_alarms_sharp,
    Icons.call,
    Icons.mail_sharp,
    Icons.ad_units_outlined,
    Icons.audiotrack_outlined,
    Icons.ad_units_rounded,
    Icons.account_balance
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 1,
              crossAxisCount: 2,
            crossAxisSpacing: 1
          ),
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(top: 60,bottom: 60,right: 30,left: 30),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[index]
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(icons[index],size: 50,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Heart",style: TextStyle(fontSize: 20),),
                      Text("Shaker",style: TextStyle(fontSize: 20),),

                    ],
                  ),


                ],
              ),
            );

          },itemCount: 12,),

    );
  }
}
