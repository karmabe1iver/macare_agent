import 'package:get/get.dart';
import 'package:macare_agent/app/data/api_services/laboratory_services.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';

import '../../../data/model/laboratory_model.dart';

class LaboratoryController extends GetxController {

  RxList<LaboratoryResponseModel> laboratoryList =
      <LaboratoryResponseModel>[].obs;

  @override
  void onInit() {
    laboratoryFetchData();
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

  Future<void> laboratoryFetchData() async {
    List<LaboratoryResponseModel> response =
        await LaboratoryServices.laboratoryDetails();
    if(response != null){
      laboratoryList.value = response??[];
    }
  }

}
