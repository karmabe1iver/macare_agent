import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/modules/history/views/history_view.dart';
import 'package:macare_agent/app/routes/app_pages.dart';
import 'package:macare_agent/app/utils/my_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => IndexedStack(
            index: controller.currentIndex.value,
              children: controller.screens.value,
          ),
      ),

      ///Bottom Navigation
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.currentIndex.value = index;
           // controller.currentScreen.value = controller.screens[index];
          },
          items:  [
            const BottomNavigationBarItem(
                icon: Icon(Icons.label, size: 40), label: "LABORATORY"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fire_truck_outlined,
                  size: 40,
                ),
                label: "DELIVERY"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  size: 40,
                ),
                label: "HISTORY"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.logout,
                  size: 40,
                ),
                label: "LOGOUT"),
          ],
          selectedItemColor: MyTheme.bottomNavigationBarSelectedColor,
          unselectedItemColor: MyTheme.bottomNavigationBarUnSelectedColor,
        ),
      ),
    );
  }
}
