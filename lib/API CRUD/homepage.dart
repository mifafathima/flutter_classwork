import 'package:flutter/material.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> _employee = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Employee Details"),
      ),
      // body: (_employee.isEmpty || _employee.length == 0)
      //     ? Center(
      //        child: Text("No Employee added"),
      // )
      //     :
      // ListView.builder(
      //   itemCount: _employee.length,
      //     itemBuilder: (context,index){
      //     final employee = _employee[index];
      //       return ListTile(
      //         title: Text(employee.employeeName),
      //         subtitle: Text(employee.designation),
      //         trailing: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
      //             IconButton(onPressed: (){}, icon: Icon(Icons.delete))
      //           ],
      //         ),
      //       );
      // }),
      // floatingActionButton: FloatingActionButton(
      //     onPressed:_showBottomSheet,
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
