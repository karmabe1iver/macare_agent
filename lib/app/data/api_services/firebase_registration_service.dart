import '../../app.dart';
import '../../presets/api_paths.dart';
import '../../utils/my_dio.dart';

abstract class FirebaseServices {
  static Future<dynamic> firebaseRegistration(
      ) async {
     await MyDio().customPost(ApiPaths.firebaseTokenUrl,

        data: {
          "reference_number": App.employeereference,
          "token_reference": App.fcmToken
        });
     print('////${App.fcmToken}');

  }
}
