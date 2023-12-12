import 'package:get/get.dart';

import '../controllers/delivery_details_controller.dart';

class DeliveryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryDetailsController>(
      () => DeliveryDetailsController(),
    );
  }
}
