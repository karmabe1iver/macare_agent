import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../app.dart';
import '../../../component/show_toast.dart';
import '../../../data/api_services/delivery_details_services.dart';
import '../../../data/api_services/payment_services.dart';
import '../../../data/model/delivery_model.dart';
import '../../../data/model/deliverydetailscon2_model.dart';
import '../../../data/model/laboratory_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/my_theme.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  RxBool checkBox1Selected = false.obs;
  Rx<DeliveryResponseModel> argument = DeliveryResponseModel().obs;
  RxList<LaboratoryResponseModel> laboratoryList =
      <LaboratoryResponseModel>[].obs;

  final count = 0.obs;

  @override
  void onInit() {
    argument.value = Get.arguments??DeliveryResponseModel();

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

  Future<void> paymentFetchData({
    required String allocationReferrence,
    required bool deliveryType,
    required String orderReference,
  }) async {
    dynamic resp;
    if (App.deliverytype == false) {
      if (deliveryType == "prescription") {
        resp = await PaymentDetails.paymentCondition1(
            allocationReference: allocationReferrence);
      } else {
        resp = await PaymentDetails.paymentCondition2(
            orderReference: orderReference,
            employeereference: App.employeereference);
      }
    }
    else {
      resp = await PaymentDetails.laboratorypayment(
          bookingreference: App.bookingReference,
          employeereference: App.employeereference);
      if (resp.message == "saved") {
        App.deliverytype = true;
        Get.toNamed(Routes.HOME, arguments: 1);
        showToast(msg: ' Payment Completed');
      }
      else {
        showToast(msg: 'Something went wrong');
      }
    }
  }
}
