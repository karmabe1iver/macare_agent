import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MACare Agent",
      builder: FToastBuilder(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    ),
  );
}
