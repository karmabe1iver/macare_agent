import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:macare_agent/app/data/api_services/laboratory_services.dart';
import 'package:macare_agent/app/data/model/response_model.dart';
import 'package:macare_agent/app/utils/my_theme.dart';
import '../../../component/show_toast.dart';
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
  RxString datee = "" .obs;
  Future<void> laboratoryFetchData() async {
    List<LaboratoryResponseModel> response =
        await LaboratoryServices.fetchData();
    if (response != null) {
      laboratoryList.value = response ?? [];
      for (var i = 0; i < laboratoryList.length; i++) {
        DateTime initial = DateTime.parse(laboratoryList[i].laboratoryBookingDate);
        DateFormat formattedDate = DateFormat('dd/MM/yyyy');
        String date = formattedDate.format(initial);

        datee.value = date ;
      }


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
        //Get.snackbar(response.message.toString(), response.message.toString(),);
        showToast(msg: response.message.toString());
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
        //Get.snackbar(response.message.toString(), response.message.toString(),);
        showToast(msg: response.message.toString(),);
        laboratoryFetchData();
      }
    }
  }

  Future<void> laboratoryDialogBox(
      {required String agentUpdateReference,required BuildContext context}) async {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Write Your Reason"),
        content: TextField(
          controller: laboratoryDialogController,
          decoration: const InputDecoration(hintText: "Enter your reason here"),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                laboratoryRejectData(agentUpdateReference: agentUpdateReference);
                laboratoryDialogController.clear();
                Get.back();
              },
              child: const Text("Submit")),
        ],
      );
    }
    );

  }
}
