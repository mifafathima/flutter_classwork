import 'package:flutter_classwork/API%20INTEGRATION1/API%20INTEGRATION%20USING_HTTP/Service/API_Service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  // obs - observable : variable value change monitor cheyyan vendeet
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    getProducts();

    super.onInit();
  }

  void getProducts() async{
    try{
      isLoading(true);
      var products = await HttpService.fetchProducts();
      if(products != null){
        productList.value = products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}