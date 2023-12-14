import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app.dart';
import '../../presets/api_paths.dart';
import '../../utils/my_dio.dart';
import '../../utils/my_theme.dart';
import '../model/history_response_model.dart';

abstract class HistoryServices{
  static Future<dynamic> history() async {
    dynamic response = await MyDio().customGet(ApiPaths.historyUrl,
        baseUrl: ApiPaths.baseUrl,
        queryParameters: {'employee_reference': App.employeereference});
    if (response ==null) {
      Fluttertoast.showToast(
        msg: "Something went wrong!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyTheme.appBarColor,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return historyResponseModelFromJson(response);
  }

}