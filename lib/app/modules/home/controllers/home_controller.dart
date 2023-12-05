import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/modules/home/views/home_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final List<Widget> screens = [
    const HomeView()
  ];
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
