import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/my_theme.dart';

void showToast({required String message}){
  Fluttertoast.showToast(
    msg:message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: MyTheme.appBarColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}