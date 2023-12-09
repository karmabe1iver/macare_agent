import 'package:macare_agent/app/data/model/delivery_model.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';

import '../../app.dart';

abstract class DeliveryServices{
  static Future <dynamic> delivery()async{
    dynamic response = await MyDio().customGet(ApiPaths.deliveryUrl,
    baseUrl: ApiPaths.baseUrl,
    queryParameters:
      {'employee_reference' : App.employeereference}
     );
    return deliveryResponseModelFromJson(response);
  }
}