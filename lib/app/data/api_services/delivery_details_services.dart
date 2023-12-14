import '../../presets/api_paths.dart';
import '../../utils/my_dio.dart';
import '../model/deliverydetailscon1_model.dart';
import '../model/deliverydetailscon2_model.dart';

abstract class DeliveryDetails{
  static Future<dynamic> deliveryDetailsCondition1(
      {required String allocationReference,required String oderstatus}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.deliveryDetailscondition1Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'allocation_reference': allocationReference,
          "order_status": oderstatus,
          'allocation_status': 'Picked'
        });
    return deliveryDetailsCon1ResponseModelFromJson(response);
  }
  static Future<dynamic> deliveryDetailsCondition2(
      {required String orderReference,required String employeereference,required String oderstatus}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.deliveryDetailscondition2Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'order_reference': orderReference,
          "order_status": oderstatus,
          'employee_reference': employeereference,
          'allocation_status': 'Picked'

        }
        );
    return deliveryDetailsCon2ResponseModelFromJson(response);
  }

}