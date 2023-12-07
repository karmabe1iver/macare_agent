import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginpageController extends GetxController {
  //TODO: Implement LoginpageController

  final count = 0.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = true.obs ;
  @override

  void onInit() {

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

  void increment() => count.value++;
}
