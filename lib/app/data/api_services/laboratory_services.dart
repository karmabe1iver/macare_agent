import 'package:macare_agent/app/app.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';

import '../model/laboratory_model.dart';

abstract class LaboratoryServices {
  static Future<dynamic> laboratoryDetails() async {
    dynamic response = await MyDio().customGet(
        "${ApiPaths.laboratoryUrl}${App.employeeReferences}/",
        baseUrl: ApiPaths.baseUrl);
    return laboratoryResponseModelFromJson(response);
  }
}
