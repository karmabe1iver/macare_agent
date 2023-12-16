import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/data/api_services/add_test_services.dart';
import 'package:macare_agent/app/data/model/add_test_response_model.dart';
import 'package:macare_agent/app/data/model/response_model.dart';

import '../../../app.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/my_theme.dart';

class AddTestController extends GetxController {

  RxList<AddTestResponseModel> addTestList = <AddTestResponseModel>[].obs;
  TextEditingController collectionChargeController = TextEditingController();
  RxString reference="".obs;

  final count = 0.obs;
RxBool isChecked = false.obs;
  @override
  void onInit() {
    reference.value=Get.arguments;
    collectionChargeController.text="0";
    fetchData();
    addTestTotal();
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


  Future<void> fetchData()async{
    List<AddTestResponseModel> response = await AddTestServices.fetchData(bookingReference: Get.arguments);
    if (response != null) {
      addTestList.value = response ?? [];
      addTestTotal();
    }
  }


  Future<void>fetchDeleteTest({required id })async{
    dynamic response = await AddTestServices.fetchDeletedTest(id: id);
    if (response.message == "updated") {
      fetchData();
    }
  }
  RxInt sum = 0.obs;
  RxInt totalFeee = 0.obs;

  Future<void> addTestTotal() async {
    List<int> numbers = [];

    for (var i = 0; i < addTestList.length; i++) {
      String? testFeeString = addTestList[i].testFee;

      if (testFeeString != null) {
        int? testFee = int.parse(testFeeString);

        if (testFee != null) {
          numbers.add(testFee);
        }
      }
    }

    int calculatedSum = numbers.fold(0, (previousValue, element) => previousValue + element);
    sum.value = calculatedSum;
    // if(collectionChargeController.text.isNotEmpty) {.
      int totalFee = calculatedSum + int.parse(collectionChargeController.text);
      totalFeee.value = totalFee;
      App.totalfeeee = totalFeee.value.toString();
    //}

  }
  Future<void> fetchCheckout( {required bookingReference,required bookingAllocationStatus,
    required bookingStatus,required empReference,})async{
    dynamic response = await AddTestServices.fetchCheckout(
        bookingReference: bookingReference, bookingAllocationStatus: bookingAllocationStatus,
        bookingStatus: bookingStatus, empReference: empReference);
    if (response.message == "saved") {
      Get.toNamed(Routes.PAYMENT,);

      Fluttertoast.showToast(
        msg: "Picked!",
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
        msg: "Something went wrong!",
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



