import 'package:macare_agent/app/data/model/login_model.dart';
import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';

abstract class LoginServices {
  static Future<dynamic> staffLogin(
      {required String employeeReference, required String password}) async {
    dynamic response = await MyDio().customPost(ApiPaths.stafflogin,
        data: {'employee_reference': employeeReference, 'password': password});
    return LoginResponseModel.fromJson(response);
  }
}
