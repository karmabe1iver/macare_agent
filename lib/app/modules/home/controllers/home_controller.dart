import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/modules/home/views/home_view.dart';
import 'package:macare_agent/app/modules/laboratory/views/laboratory_view.dart';

class HomeController extends GetxController {

  //TODO: Implement HomeController

  RxList<Widget> screens = [
    LaboratoryView(),
    LaboratoryView(),
    LaboratoryView(),
    LaboratoryView(),
  ].obs;
  final PageStorageBucket bucket = PageStorageBucket();
  Rx<Widget> currentScreen= const LaboratoryView().obs;
  RxInt currentIndex = 0.obs;
  bool isButtonPressed = false;
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
