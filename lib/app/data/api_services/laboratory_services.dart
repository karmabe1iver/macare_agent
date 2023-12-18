
import 'package:macare_agent/app/app.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';

import '../model/laboratory_model.dart';
import '../model/response_model.dart';

abstract class LaboratoryServices {
  static Future<dynamic> fetchData() async {
    dynamic response = await MyDio().customGet(
        "${ApiPaths.laboratoryUrl}${App.employeeReferences}/",
        baseUrl: ApiPaths.baseUrl,);
    return laboratoryResponseModelFromJson(response);
  }
  static Future<dynamic> accept({required String bookingReference,}) async {
    dynamic response = await MyDio().customPost(
        ApiPaths.laboratoryAcceptUrl,
        baseUrl: ApiPaths.baseUrl,
    data: { "booking_reference": bookingReference,
      "employee_reference": App.employeeReferences,
      "allocation_status": "accepted",
      "booking_allocation":"processed"
    });

    return ResponseModel.fromJson(response);
  }

  static Future<dynamic> reject({required String agentUpdateReference,required String reason}) async {
    dynamic response = await MyDio().customGet(
        ApiPaths.laboratoryRejectUrl,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: { "allocation_reference" : agentUpdateReference,
          'allocation_status' :"rejected",
          "reason" : reason} );

    return responseModelFromJson(response);
  }
}
