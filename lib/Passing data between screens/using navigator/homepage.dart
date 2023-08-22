import 'package:flutter/material.dart';
import 'package:flutter_classwork/Passing%20data%20between%20screens/using%20navigator/Dummy%20data.dart';

import 'DetailsPage.dart';

void main(){
  runApp(MaterialApp(
    home: ProductHome(),
    routes: {
      'details' : (context)=>ProductDetails()
    }
  ));
}

class ProductHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Now"),
      ),
      body: ListView(
        children: products.map((e) => Card(
          child: ListTile(
            leading: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(e["images"]))
              ),
                ),
            title: Text(e["name"]),
            subtitle: Text('\$ ${e["price"]}'),    //the price is int so we give it in quotes
            onTap: (){
              gotoNextPage(context,e['id']);
            },
          ),
        )).toList(),
      ),
    );
  }

  void gotoNextPage(BuildContext context, ProductId) {      //productId = e['id']
    Navigator.pushNamed(context, 'details',arguments: ProductId);

  }
}
