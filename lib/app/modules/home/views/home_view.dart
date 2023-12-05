import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/utils/my_theme.dart';

import '../../collection_details/views/collection_details_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
                () => PageStorage(
              bucket: controller.bucket,
              child: controller.currentScreen.value,
            )
        ),
            ///Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
    items: const [
    BottomNavigationBarItem(icon: Icon(Icons.label,size: 40),label: "LABORATORY"),
    BottomNavigationBarItem(icon: Icon(Icons.fire_truck_outlined,size: 40,),label: "DELIVERY"),
    BottomNavigationBarItem(icon: Icon(Icons.book,size: 40,),label: "HISTORY"),
    BottomNavigationBarItem(icon: Icon(Icons.logout,size: 40,),label: "LOGOUT"),
    ],
    selectedItemColor: MyTheme.bottomNavigationBarSelectedColor,
    unselectedItemColor: MyTheme.bottomNavigationBarUnSelectedColor,

    ),
    );
  }
}
