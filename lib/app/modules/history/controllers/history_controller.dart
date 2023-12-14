import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/api_services/history_services.dart';
import '../../../data/model/history_response_model.dart';
import '../../../utils/my_theme.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController

  final count = 0.obs;
  RxList<HistoryResponseModel> historyDetails = <HistoryResponseModel>[].obs;
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
  Future<void> historyFetchData() async {
    List<HistoryResponseModel> response = await HistoryServices.history();
    if (response != null) {
      historyDetails.value = response ?? [];
    }


  }

  void increment() => count.value++;
}
