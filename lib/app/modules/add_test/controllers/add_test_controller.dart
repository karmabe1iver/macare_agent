import 'package:get/get.dart';

class AddTestController extends GetxController {
  //TODO: Implement AddTestController

  final count = 0.obs;
RxBool isChecked = false.obs;
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
