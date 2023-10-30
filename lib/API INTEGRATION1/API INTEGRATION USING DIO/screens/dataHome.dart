import 'package:flutter/material.dart';
import 'package:flutter_classwork/API%20INTEGRATION1/API%20INTEGRATION%20USING%20DIO/controller/data%20controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(
    home: DataHome(),
  ));
}

class DataHome extends StatelessWidget {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Home"),
      ),
      // body: Obx(() => SizedBox(
      //       height: double.infinity,
      //       width: double.infinity,
      //   child:controller.isNetworkConnected.value  ?
      //     )),
    );
  }
}
