import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classwork/API%20INTEGRATION1/API%20INTEGRATION%20USING_HTTP/Model/Product%20model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child:
                CachedNetworkImage(fit: BoxFit.cover, imageUrl: product.image!),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            product.title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          Text(
            '${product.price!}\$',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            product.description!,
            style: TextStyle(
              fontSize: 13
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
