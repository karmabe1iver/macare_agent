
import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/data/api_services/laboratory_services.dart';
import 'package:macare_agent/app/data/model/response_model.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';
import 'package:macare_agent/app/utils/my_theme.dart';

import '../../../data/model/laboratory_model.dart';

class LaboratoryController extends GetxController {

  RxList<LaboratoryResponseModel> laboratoryList =
      <LaboratoryResponseModel>[].obs;
  TextEditingController laboratoryDialogController = TextEditingController();



  @override
  void onInit() {
    laboratoryFetchData();
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

  Future<void> laboratoryFetchData() async {
    List<LaboratoryResponseModel> response =
        await LaboratoryServices.fetchData();
    if (response != null) {
      laboratoryList.value = response ?? [];
    }
  }

  Future<void> laboratoryAcceptData({required String bRef}) async {
    ResponseModel response =
        await LaboratoryServices.accept(bookingReference: bRef);
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      if (response.message == "saved") {
        Get.snackbar(response.message.toString(), response.message.toString(),
        snackPosition: SnackPosition.BOTTOM,backgroundColor: MyTheme.snackBarColor,colorText: MyTheme.snackBarTextColor);
        laboratoryFetchData();
      }
    }
  }

  Future<void> laboratoryRejectData(
      {required String agentUpdateReference}) async {
    ResponseModel response = await LaboratoryServices.reject(
        agentUpdateReference: agentUpdateReference,
        reason: laboratoryDialogController.text);
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      if (response.message == "updated") {
        Get.snackbar(response.message.toString(), response.message.toString(),
        snackPosition: SnackPosition.BOTTOM,backgroundColor: MyTheme.snackBarColor,colorText: MyTheme.snackBarTextColor);
        laboratoryFetchData();
      }
    }
  }

  Future<void> laboratoryDialogBox(
      {required String agentUpdateReference,required BuildContext context}) async {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Write Your Reason"),
        content: TextField(
          controller: laboratoryDialogController,
          decoration: InputDecoration(hintText: "Enter your reason here"),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Cancel")),
          TextButton(
              onPressed: () {
                laboratoryRejectData(agentUpdateReference: agentUpdateReference);
                laboratoryDialogController.clear();
                Get.back();
              },
              child: Text("Submit")),
        ],
      );
    }
    );

  }
}
