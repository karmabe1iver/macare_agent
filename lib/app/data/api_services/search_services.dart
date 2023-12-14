import 'package:macare_agent/app/presets/api_paths.dart';
import 'package:macare_agent/app/utils/my_dio.dart';

import '../model/search_model.dart';

abstract class SearchServices{
  static Future <dynamic>searchFetchData({required laboratoryReferences,required String searchQuery})async{
    dynamic response = await MyDio().customGet(
        ApiPaths.searchUrl,baseUrl: ApiPaths.baseUrl,
      queryParameters: {"laboratory_reference": laboratoryReferences,
      "search_param":searchQuery}
    );
    return searchModelFromJson(response);
  }
}