import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/app.dart';
import 'package:macare_agent/app/data/api_services/login_services.dart';
import 'package:macare_agent/app/data/model/login_model.dart';
import 'package:macare_agent/app/utils/local_store.dart';
import '../../../component/show_toast.dart';
import '../../../routes/app_pages.dart';

class LoginpageController extends GetxController {
  //TODO: Implement LoginpageController

  final count = 0.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    // usernameController.text="emp-1001";
    // passwordController.text="staging@123";
    var token = LocalStore.getData("accessToken") ?? "";
    if (token != "") {
      await Future.delayed(const Duration(milliseconds: 30))
          .whenComplete(() => Get.offAllNamed(Routes.HOME));
    }
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

  Future<void> fetchData() async {
    LoginResponseModel response = await LoginServices.staffLogin(
        employeeReference: usernameController.text,
        password: passwordController.text);
    if (response.access != null) {
      App.token = response.access!;
      App.employeereference = response.employeeReference!;
      isLoading(false);
      showToast(msg: ' Login Completed');
      App.token = response.access!;
      App.employeereference = response.employeeReference!;
      App.employeename = response.name!;
      LocalStore.setData("accessToken", response.access);
      LocalStore.setData("employeeReference", response.employeeReference);
      LocalStore.setData("employeeName", response.name);
      Get.toNamed(Routes.HOME);
    } else {
      //Fluttertoast.showToast(msg: 'Something went wrong!!');
      showToast(msg: ' Something went wrong');
    }
  }
}
