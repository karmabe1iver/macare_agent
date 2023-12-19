import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/fcm/fcm.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FcmSetup().initNotification();
  //await FirebaseApi().initNotifications();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MACare Agent",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    ),
  );
}
