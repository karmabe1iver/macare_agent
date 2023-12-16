import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:macare_agent/app/data/api_services/delivery_services.dart';
import 'package:macare_agent/app/data/model/delivery_model.dart';

import '../../../app.dart';
import '../../../data/model/deliverycon1_response_model.dart';
import '../../../data/model/deliverycon2_response_model.dart';
import '../../../utils/my_theme.dart';
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
  RxString datee = "" .obs;

  Future<void> deliveryFetchData() async {
    List<DeliveryResponseModel> response = await DeliveryServices.delivery();
    if (response != null) {
      deliveryDetails.value = response ?? [];
      for (var i = 0; i < deliveryDetails.length; i++) {
        DateTime initial = DateTime.parse(deliveryDetails[i].orderDate);
        DateFormat formattedDate = DateFormat('dd/MM/yyyy');
        String date = formattedDate.format(initial);

        datee.value = date ;
      }


    }

  }

  Future<void> acceptFetchData({required String orderReferrence,
    required String allocationReferrence,
    required String deliveryType}) async {
    List<DeliveryCon1ResponseModel> response =
    await DeliveryServices.acceptCondition1(
        allocationReference: allocationReferrence);
    List<DeliveryCon2ResponseModel> responsee =
    await DeliveryServices.acceptCondition2(
        orderReference: orderReferrence,
        employeereference: App.employeereference);

    if (deliveryType == "prescription") {
      deliveryFetchData();
      DeliveryServices.acceptCondition1(
          allocationReference: allocationReferrence);
      if (response == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Accepted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      DeliveryServices.acceptCondition2(
          orderReference: orderReferrence,
          employeereference: App.employeereference);
      if (responsee == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Accepted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  Future<void> rejectFetchData({required String orderReferrence,
    required String allocationReferrence,
    required String deliveryType}) async {
    List<DeliveryCon1ResponseModel> response =
    await DeliveryServices.rejectCondition1(
        allocationReference: allocationReferrence,
        reason: deliveryDialogController.text);
    List<DeliveryCon2ResponseModel> responsee =
    await DeliveryServices.rejectCondition2(
        orderReference: orderReferrence,
        employeereference: App.employeereference,
        reason: deliveryDialogController.text);

    if (deliveryType == "prescription") {
      deliveryFetchData();

      DeliveryServices.rejectCondition1(
          allocationReference: allocationReferrence,
          reason: deliveryDialogController.text);
      if (response == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Accepted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      DeliveryServices.rejectCondition2(
          orderReference: orderReferrence,
          employeereference: App.employeereference,
          reason: deliveryDialogController.text);
      if (response == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Rejected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  Future<void> deliveryDialogBox({required String allocationReferrence,
    required String deliveryType,
    required String orderReferrence,
    required BuildContext context}) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Write Your Reason"),
            content: TextField(
              controller: deliveryDialogController,
              decoration: InputDecoration(hintText: "Enter your reason here"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    deliveryDialogController.clear();
                    Get.back();
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    rejectFetchData(
                        orderReferrence: orderReferrence,
                        allocationReferrence: allocationReferrence,
                        deliveryType: deliveryType);
                    deliveryDialogController.clear();
                    Get.back();
                  },
                  child: Text("Submit")),
            ],
          );
        });
  }
}
