import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView2(),
  ));
}

class ListView2 extends StatelessWidget {
  var name = ["burger","pizza","pasta","noodles","coffee","salad","french fries",];
  var image = [
    "assets/images/burger.jpg",
    "assets/images/pizza.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfRsrCDM7b_XxQcmKL5SiYI4IyWT00RYrE4g&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGz1rgLOpWG03TjFGpTemnY0l8PHWbULuzVw&usqp=CAU",
    "assets/images/coffee.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS972i31UPY15LbicKCWnWuF-R8dt2UEZfa5Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH3uAc9N80Dq6WuDbikkWEe1roMchJImPymg&usqp=CAU"
  ];
  var price = ["230","450","350","190","60","290","80"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //
      //   title: const Text("ListView2"),
      //   actions: [
      //     const Icon(Icons.camera_alt),
      //     const SizedBox(width: 20,),
      //     const Icon(Icons.search),
      //     const SizedBox(width: 10,),
      //     PopupMenuButton(itemBuilder: (context){
      //       return[
      //         const PopupMenuItem(child: Text("New Group")),
      //         const PopupMenuItem(child: Text("Profile")),
      //         const PopupMenuItem(child: Text("Starred messages")),
      //         const PopupMenuItem(child: Text("payments")),
      //         const PopupMenuItem(child: Text("settings")),
      //       ];
      //     })
      //   ],
      // ),
      body: ListView(
        children:
          List.generate(7, (index) => Card(
            child: ListTile(
              title: Text(name[index]),
              subtitle: Text("\$ ${price[index]}"),
              trailing: const Wrap(
                direction: Axis.vertical,
                  children: [
              Icon(Icons.call),
                SizedBox(width: 20,),
                CircleAvatar(minRadius: 5,maxRadius: 10,backgroundColor: Colors.teal,
                child: Text("2"),)
                ]
              ),
                leading: CircleAvatar(backgroundImage: NetworkImage(image[index])),

            ),
          ))
        ,
      ),
    );
  }
}
