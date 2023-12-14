import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/modules/delivery_details/views/delivery_details_view.dart';
import 'package:macare_agent/app/modules/home/views/home_view.dart';
import 'package:macare_agent/app/modules/laboratory/views/laboratory_view.dart';
import 'package:macare_agent/app/modules/search_page/views/search_page_view.dart';

import '../../delivery/views/delivery_view.dart';
import '../../history/views/history_view.dart';
import '../../loginpage/views/loginpage_view.dart';

class HomeController extends GetxController {

  //TODO: Implement HomeController

  RxList<Widget> screens = [
    const LaboratoryView(),
    const DeliveryView(),
    const HistoryView(),
    const HistoryView(),
  ].obs;
  Rx<PageStorageBucket> bucket = PageStorageBucket().obs;
  Rx<Widget> currentScreen= const LaboratoryView().obs;
  RxInt currentIndex = 0.obs;
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
