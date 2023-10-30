import 'package:flutter_classwork/API%20INTEGRATION1/API%20INTEGRATION%20USING_HTTP/Model/Product%20model.dart';
import 'package:http/http.dart'as http;


class HttpService{
  static Future<List<ProductModel>> fetchProducts() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      var data = response.body;
      return productModelFromJson(data);
    }else{
     throw Exception();
    }
  }
}