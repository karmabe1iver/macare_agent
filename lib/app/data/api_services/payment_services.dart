import '../../presets/api_paths.dart';
import '../../utils/my_dio.dart';
import '../model/deliverydetailscon1_model.dart';
import '../model/deliverydetailscon2_model.dart';
import '../model/response_model.dart';

abstract class PaymentDetails{
  static Future<dynamic> paymentCondition1(
      {required String allocationReference}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.paymentcondition1Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'allocation_reference': allocationReference,
          "order_status": 'Delivered',
          'allocation_status': 'Completed',
          'payment_method' : 'cash'
        });
    return deliveryDetailsCon1ResponseModelToJson(response);
  }
  static Future<dynamic> paymentCondition2(
      {required String orderReference,required String employeereference}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.paymentcondition2Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'order_reference': orderReference,
          "order_status": 'Delivered',
          'employee_reference': employeereference,
          'allocation_status': 'Completed',
          'payment_method' : 'cash'

        }
    );
    return deliveryDetailsCon2ResponseModelFromJson(response);
  }  static Future<dynamic> laboratorypayment(
      {required String bookingreference,required String employeereference}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.paymentcondition2Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'booking_reference': bookingreference,
          "booking_allocation_status": 'Completed',
           'booking_status': 'Payment Collected',
          'employee_reference': employeereference,
          'payment_method' : 'cash'

        }
    );
    return responseModelFromJson(response);
  }

  static Future<dynamic> laboratorypayment(
      {required String bookingreference,required String employeereference}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.paymentcondition2Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'booking_reference': bookingreference,
          "booking_allocation_status": 'Completed',
          'booking_status': 'Payment Collected',
          'employee_reference': employeereference,
          'payment_method' : 'cash'

        }
    );
    return responseModelFromJson(response);
  }
}