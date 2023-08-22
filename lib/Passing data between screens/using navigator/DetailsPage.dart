import 'package:flutter/material.dart';
import 'package:flutter_classwork/Passing%20data%20between%20screens/using%20navigator/Dummy%20data.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //to recieve value from previous page/ route
    final ProductId = ModalRoute.of(context)?.settings.arguments;

    //to get all the items from each map or fetch all the values from the list which satisfy the condition
    final productFromList =
        products.firstWhere((element) => element['id'] == ProductId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(productFromList["name"]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productFromList["images"]))),
            ),
            SizedBox(height: 20,),
            Text(productFromList["name"],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.brown),),
            SizedBox(height: 10,),
            Text('\$ ${productFromList["price"]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink),),
            SizedBox(height: 20,),
            Text(productFromList["description"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.green),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' ${productFromList["rating"]}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Image.network("https://media.istockphoto.com/id/1140391316/vector/five-yellow-stars-customer-product-rating-icon-fow-web-applications-and-websites.jpg?s=612x612&w=0&k=20&c=K_VInFNDXNAQ-BIkog1Joaxa1kfq1sbnHfC2gqh3Vb0=",height: 70,width: 100,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
