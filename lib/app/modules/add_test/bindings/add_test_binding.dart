import 'package:get/get.dart';

import '../controllers/add_test_controller.dart';

class AddTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTestController>(
      () => AddTestController(),
    );
  }
}
