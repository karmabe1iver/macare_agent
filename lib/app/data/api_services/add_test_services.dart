import 'package:macare_agent/app/data/model/response_model.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';
import '../model/add_test_response_model.dart';

abstract class AddTestServices {
  static Future<dynamic> fetchData({required bookingReference}) async {
    dynamic response = await MyDio().customGet(
        "${ApiPaths.addTestUrl}$bookingReference/",
        baseUrl: ApiPaths.baseUrl);

    return addTestResponseModelFromJson(response);
  }

  static Future<dynamic> statusFetchData({required String bookingReference,
    required String bookingAllocationStatus,
    required String bookingStatus,
    required String empReference}) async {
    dynamic response = await MyDio().customGet(ApiPaths.addTestStatusUrl,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          "booking_reference": bookingReference,
          "booking_allocation_status": bookingAllocationStatus,
          "booking_status": bookingStatus,
          "employee_reference": empReference,
        });
    return responseModelFromJson(response);
  }
  static Future<dynamic> fetchAddSelected(data) async {
    dynamic response = await MyDio().customPost(ApiPaths.addSelectedTestUrl,
        baseUrl: ApiPaths.baseUrl, data: data);
    return ResponseModel.fromJson(response);
  }


  static Future<dynamic> fetchDeletedTest({required String id})async{
    dynamic response = await MyDio().customPatch(ApiPaths.deletedUrl,"$id/",baseUrl: ApiPaths.baseUrl,
    data: {"delete_status":"true"});
    return ResponseModel.fromJson(response);

  }

  static Future<dynamic> fetchCheckout({required String bookingReference,
    required String bookingAllocationStatus,
    required String bookingStatus,
    required String empReference}) async {
    dynamic response = await MyDio().customGet(ApiPaths.checkoutUrl,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {
          "booking_reference": bookingReference,
          "booking_allocation_status": bookingAllocationStatus,
          "booking_status": bookingStatus,
          "employee_reference": empReference,
        });
    return responseModelFromJson(response);
  }
}