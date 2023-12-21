import 'package:macare_agent/app/data/model/delivery_model.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';

import '../../app.dart';
import '../model/deliverycon1_response_model.dart';
import '../model/deliverycon2_response_model.dart';

abstract class DeliveryServices {
  static Future<dynamic> delivery() async {
    dynamic response = await MyDio().customGet(ApiPaths.deliveryUrl,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {'employee_reference': App.employeereference});
    return deliveryResponseModelFromJson(response);
  }

  static Future<dynamic> acceptCondition1(
      {required String allocationReference}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.deliveryAcceptRejectCondition1Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'allocation_reference': allocationReference,
          "order_status": 'Booking Proccessed',
          'allocation_status': 'accepted'
        });
    return DeliveryCon1ResponseModel.fromJson(response);
  }static Future<dynamic> acceptCondition2(
      {required String orderReference,required String employeereference}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.deliveryAcceptRejectCondition2Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'order_reference': orderReference,
          "order_status": 'Booking Proccessed',
          'employee_reference': employeereference,
          'allocation_status': 'accepted'
        });
    return deliveryCon1ResponseModelFromJson(response);
  }static Future<dynamic> rejectCondition1(
      {required String allocationReference,required String reason}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.deliveryAcceptRejectCondition1Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'allocation_reference': allocationReference,
          "order_status": 'proccessing',
          'allocation_status': 'rejected',
          'reason' : reason
        });
    return deliveryCon1ResponseModelFromJson(response);
  }static Future<dynamic> rejectCondition2(
      {required String orderReference,required String employeereference ,required String reason}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.deliveryAcceptRejectCondition2Url,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          'order_reference': orderReference,
          "order_status": 'proccessing',
          'employee_reference': employeereference,
          'allocation_status': 'rejected',
          'reason' : reason
          });
    return deliveryCon1ResponseModelFromJson(response);  }
}
