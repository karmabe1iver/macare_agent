

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/data/api_services/delivery_services.dart';
import 'package:macare_agent/app/data/model/delivery_model.dart';

import '../../../app.dart';
import '../views/delivery_view.dart';

class DeliveryController extends GetxController {
  //TODO: Implement DeliveryController

  final count = 0.obs;
  TextEditingController deliveryDialogController = TextEditingController();
  RxList<DeliveryResponseModel> deliveryDetails = <DeliveryResponseModel>[].obs;

  @override
  void onInit() {
    deliveryFetchData();
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

  Future<void> deliveryFetchData() async {
    List<DeliveryResponseModel> response = await DeliveryServices.delivery();
    if (response != null) {
      deliveryDetails.value = response ?? [];
    }
  }

  Future<void> acceptFetchData(
      {required String orderReferrence,
      required String allocationReferrence,
      required String deliveryType}) async {

    if (deliveryType == "prescription") {
      deliveryFetchData();
      Get.snackbar('Accepted', '');
      DeliveryServices.acceptCondition1(
          allocationReference: allocationReferrence);
    } else {
      DeliveryServices.acceptCondition2(
          orderReference: orderReferrence,
          employeereference: App.employeereference);
    }
  }

  Future<void> rejectFetchData(
      {required String orderReferrence,
      required String allocationReferrence,
      required String deliveryType}) async {
    if (deliveryType == "prescription") {
      deliveryFetchData();
      Get.snackbar('Rejected', '');
      DeliveryServices.rejectCondition1(
          allocationReference: allocationReferrence,
          reason: deliveryDialogController.text);
    } else {
      DeliveryServices.rejectCondition2(
          orderReference: orderReferrence,
          employeereference: App.employeereference,
          reason: deliveryDialogController.text);
    }
  }

  Future<void> deliveryDialogBox({required String allocationReferrence,
    required String deliveryType,required String orderReferrence,required BuildContext context}) async {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title:  Text("Write Your Reason"),
        content:  TextField(
          controller: deliveryDialogController,
          decoration: InputDecoration(hintText: "Enter your reason here"),
        ),
        actions: [
          TextButton(
              onPressed: () {

                deliveryDialogController.clear();
                Get.back();
              },
              child:  Text("Cancel")),
          TextButton(
              onPressed: () {
                rejectFetchData(
                    orderReferrence: orderReferrence,
                    allocationReferrence: allocationReferrence, deliveryType: deliveryType);
                deliveryDialogController.clear();
                Get.back();

              },
              child:  Text("Submit")),
        ],
      );
    });

  }
}
