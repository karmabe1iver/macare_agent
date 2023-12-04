import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final List<Widget> screens = [];
  final PageStorageBucket bucket = PageStorageBucket();
  Rx<Widget> currentScreen= const SizedBox().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
