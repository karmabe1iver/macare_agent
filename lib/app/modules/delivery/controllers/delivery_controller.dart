import 'package:get/get.dart';
import 'package:macare_agent/app/data/api_services/delivery_services.dart';
import 'package:macare_agent/app/data/model/delivery_model.dart';

class DeliveryController extends GetxController {
  //TODO: Implement DeliveryController

  final count = 0.obs;
  RxList <DeliveryResponseModel> deliveryDetails = <DeliveryResponseModel>[].obs;

  @override
  void onInit() {
    deliveryFetchData();
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
  Future<void> deliveryFetchData()async {
    List <DeliveryResponseModel> response = await DeliveryServices.delivery();
    if(response != null){
      deliveryDetails.value = response??[];
      
    }
  }


  void increment() => count.value++;
}
