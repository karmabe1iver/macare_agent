import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/app.dart';
import 'package:macare_agent/app/data/api_services/delivery_details_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/api_services/delivery_services.dart';
import '../../../data/model/delivery_model.dart';
import '../../../data/model/deliverydetailscon1_model.dart';
import '../../../data/model/deliverydetailscon2_model.dart';
import '../../../utils/my_theme.dart';

class DeliveryDetailsController extends GetxController {
  //TODO: Implement DeliveryDetailsController
  RxList<DeliveryResponseModel> deliveryDetails = <DeliveryResponseModel>[].obs;


  Rx<DeliveryResponseModel> argument = DeliveryResponseModel().obs;
  final count = 0.obs;

  void makePhoneCall() async {
    final Uri url = Uri(
      scheme: 'tel',
      path: argument.value!.deliveryDetails!.first.customerPhone.toString(),
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("cannot launch this url");
    }
  }

  @override
  void onInit() {
    argument.value = Get.arguments;
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

  Future<void> deliveryDetailsFetchData({required String allocationReferrence,
    required String deliveryType,
    required String orderReference,}) async {
    dynamic response;
    if (deliveryType == "prescription") {
      response = await DeliveryDetails.deliveryDetailsCondition1(
          allocationReference: allocationReferrence, oderstatus: 'Picked');
    }
    if (deliveryType != "prescription") {
      response =
      await DeliveryDetails.deliveryDetailsCondition2(
          oderstatus: 'Picked',
          orderReference: orderReference,
          employeereference: App.employeereference);
    }

    if (response.message!="saved") {

      Fluttertoast.showToast(
        msg: "Something went wrong!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyTheme.appBarColor,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      App.deliverytype = true;
      Fluttertoast.showToast(
        msg: "Picked",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyTheme.appBarColor,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> showdirectionFetchData({
    required String allocationReferrence,
    required String deliveryType,
    required String orderReference,
  }) async {
    dynamic response;
    if (deliveryType == "prescription") {
      response = DeliveryDetails.deliveryDetailsCondition1(
          allocationReference: allocationReferrence, oderstatus: 'On the way');
      if (deliveryType != "prescription") {
        response = DeliveryDetails.deliveryDetailsCondition2(
            orderReference: orderReference,
            employeereference: App.employeereference,
            oderstatus: 'On the way');
      }
      if (response.message != "saved") {
        Fluttertoast.showToast(
          msg: "Something went wrong!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.appBarColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Picked",
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
void increment() => count.value++;}
