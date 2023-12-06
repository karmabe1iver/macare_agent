import 'package:get/get.dart';

class DeliveryController extends GetxController {
  //TODO: Implement DeliveryController

  final count = 0.obs;
  RxList<RxBool> visibility = [true.obs,true.obs,true.obs,true.obs,true.obs,].obs;
  RxList<RxBool> statusvisibility = [false.obs,false.obs,false.obs,false.obs,false.obs,].obs;
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
