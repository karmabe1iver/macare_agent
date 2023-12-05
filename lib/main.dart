import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/collection_details/views/collection_details_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MACare Agent",
      home: CollectionDetailsView(),

    ),
  );
}
