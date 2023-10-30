import 'package:flutter/animation.dart';
import 'package:flutter_classwork/API%20INTEGRATION1/API%20INTEGRATION%20USING%20DIO/service/DioService.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/data model.dart';

class DataController extends GetxController {
  //implementation come from Rx class
  //another method for observable
  RxList<DataModel> datas = RxList();
  RxBool isLoading = true.obs;
  RxBool isListatDown = false.obs;
  RxBool isNetworkConnected = true.obs;

  var url = "https://jsonplaceholder.typicode.com/posts";

  var itemController = ItemScrollController();

  isInternetConnected() async {
    isNetworkConnected.value = await InternetConnectionChecker().hasConnection;
  }



  //to get all the data's from api
  fetchData() async {
    isInternetConnected();
    isLoading.value = true;
    var response = await DioService().getData(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        datas.add(DataModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }

  //scroll listview to down
  scrollToDown() {
    itemController.scrollTo(
        index: datas.length,
        duration: Duration(seconds: 2),
        curve: Curves.bounceIn);
    isListatDown.value = true;
  }

  scrollToUp() {
    itemController.scrollTo(
        index: 0,
        duration: Duration(seconds: 2),
        curve: Curves.bounceInOut);
    isListatDown.value = false;
  }

 @override
  void onInit() {
    fetchData();
    isInternetConnected();
    super.onInit();
  }
}
