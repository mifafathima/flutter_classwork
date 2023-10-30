

import 'package:flutter/material.dart';
import 'package:flutter_classwork/API%20INTEGRATION1/API%20INTEGRATION%20USING_HTTP/Controller/product_controller.dart';
import 'package:get/get.dart';

import 'Widgets/ProductTile.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  final ProductController productController = Get.put(
      ProductController()); //the instance variable in product controller is obs so we give get.put
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: SizedBox(
        child: Obx(() {  //Obx is to make the widget observable
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },itemCount: productController.productList.length,);
          }
        }),
      ),
    );
  }
}
