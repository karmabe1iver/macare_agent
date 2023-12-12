import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryDetailsController extends GetxController {
  //TODO: Implement DeliveryDetailsController

  final count = 0.obs;
  final String phoneNumber = 'tel:+123456789';

  void makePhoneCall() async {
    final Uri url = Uri(
        scheme: 'tel', path: phoneNumber
    );
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }else{
      print("cannot launch this url");
    }

  }
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
