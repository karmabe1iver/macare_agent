import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  RxString datee = "" .obs;
  Future<void> historyFetchData() async {
    List<HistoryResponseModel> response = await HistoryServices.history();
    if (response != null) {
      historyDetails.value = response ?? [];
      if (response != null) {
        historyDetails.value = response ?? [];
        for (var i = 0; i < historyDetails.length; i++) {
          DateTime initial = DateTime.parse(historyDetails[i].bookingReferenceBookingDate.toString());
          DateFormat formattedDate = DateFormat('dd/MM/yyyy');
          String date = formattedDate.format(initial);

          datee.value = date ;
        }


      }
    }


  }

  void increment() => count.value++;
}
