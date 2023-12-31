import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/data/model/add_test_response_model.dart';
import 'package:macare_agent/app/data/model/laboratory_model.dart';
import 'package:macare_agent/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app.dart';
import '../../../data/api_services/add_test_services.dart';
import '../../../data/model/response_model.dart';
import '../../../utils/my_theme.dart';

class CollectionDetailsController extends GetxController {

  Rx<LaboratoryResponseModel> argument=LaboratoryResponseModel().obs;
  final count = 0.obs;
  RxList<AddTestResponseModel> addTestList =
      <AddTestResponseModel>[].obs;

  void makePhoneCall() async {
    final Uri url = Uri(
        scheme: 'tel', path: argument.value!.customerPhoneForCollection.toString()
    );
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }else{
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

  Future<void> statusFetchData( {required bookingReference,required bookingAllocationStatus,
    required bookingStatus,required empReference,})async{
    ResponseModel response = await AddTestServices.statusFetchData(
        bookingReference: bookingReference, bookingAllocationStatus: bookingAllocationStatus,
        bookingStatus: bookingStatus, empReference: empReference);

    if (response.message == "saved") {
      App.deliverytype = true;
      Get.toNamed(Routes.ADD_TEST,arguments: bookingReference,);
      App.laboratoryReference=argument.value.lbReference!;

      } else {
        App.deliverytype = true;
        Fluttertoast.showToast(
          msg: "Something went wrong!!!",
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
