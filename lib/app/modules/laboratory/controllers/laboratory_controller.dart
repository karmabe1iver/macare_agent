import 'package:get/get.dart';

class LaboratoryController extends GetxController {
  //TODO: Implement LaboratoryController

  final count = 0.obs;
  RxList<RxBool> visibility = [true.obs,true.obs,true.obs,true.obs,true.obs,].obs;
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
