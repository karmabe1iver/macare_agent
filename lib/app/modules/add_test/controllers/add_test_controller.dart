import 'package:get/get.dart';
import 'package:macare_agent/app/data/api_services/add_test_services.dart';
import 'package:macare_agent/app/data/model/add_test_response_model.dart';
import 'package:macare_agent/app/data/model/response_model.dart';

import '../../../utils/my_theme.dart';

class AddTestController extends GetxController {

  RxList<AddTestResponseModel> addTestList = <AddTestResponseModel>[].obs;
  RxString reference="".obs;

  final count = 0.obs;
RxBool isChecked = false.obs;
  @override
  void onInit() {
    reference.value=Get.arguments;
    fetchData();
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
    }
  }


}
