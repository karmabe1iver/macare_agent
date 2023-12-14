import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../app.dart';
import '../../../data/api_services/delivery_details_services.dart';
import '../../../data/api_services/payment_services.dart';
import '../../../data/model/delivery_model.dart';
import '../../../data/model/deliverydetailscon2_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/my_theme.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  RxBool checkBox1Selected = false.obs;
  Rx<DeliveryResponseModel> argument = DeliveryResponseModel().obs;

  final count = 0.obs;

  @override
  void onInit() {
    argument = Get.arguments;
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
    required String deliveryType,
    required String orderReference,
  }) async {
    DeliveryDetailsCon2ResponseModel resp;
    if (deliveryType == "prescription") {
      resp = await PaymentDetails.paymentCondition1(
          allocationReference: allocationReferrence);
    } else {
      resp = await PaymentDetails.paymentCondition2(
          orderReference: orderReference,
          employeereference: App.employeereference);
    }
    if(resp.message=="saved"){
      Get.toNamed(Routes.HOME,arguments:1 );
      Fluttertoast.showToast(
        msg: "Payment completed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyTheme.appBarColor,
        textColor: Colors.white,
        fontSize: 16.0,

      );
    }
    else{
      Fluttertoast.showToast(
          msg: "Someting went wrong!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,);

    }
  }

  void increment() => count.value++;
}
