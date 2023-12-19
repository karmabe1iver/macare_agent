import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/app.dart';
import 'package:macare_agent/app/data/api_services/login_services.dart';
import 'package:macare_agent/app/data/model/login_model.dart';
import '../../../routes/app_pages.dart';

class LoginpageController extends GetxController {
  //TODO: Implement LoginpageController

  final count = 0.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    usernameController.text="emp-1001";
    passwordController.text="staging@123";
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
    if(response.access!=null) {
      App.token=response.access!;
      App.employeeReferences=response.employeeReference!;
      isLoading(false);
      Fluttertoast.showToast(msg: 'Login Completed!!!');
      App.token= response.access !;
      App.employeereference= response.employeeReference! ;
      App.employeename= response.name! ;
      Get.toNamed(Routes.HOME);
    }else{
      Fluttertoast.showToast(msg: 'Something went wrong!!');
    }
  }
  }
