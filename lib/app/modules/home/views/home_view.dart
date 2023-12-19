import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/utils/asset_helper.dart';
import 'package:macare_agent/app/utils/my_theme.dart';
import '../../../fcm/fcm.dart';
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
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.currentIndex.value = index;
            // controller.currentScreen.value = controller.screens[index];
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  AssetHelper.laboratoryLogo,
                  height: 40,
                  width: 40,
                ),
                label: "LABORATORY",
                activeIcon: Image.asset(
                  AssetHelper.laboratoryLogoSelected,
                  height: 40,
                  width: 40,
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  AssetHelper.deliveryLogo,
                  height: 40,
                  width: 40,
                ),
                label: "DELIVERY",
                activeIcon: Image.asset(
                  AssetHelper.deliveryLogoSelected,
                  height: 40,
                  width: 40,
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  AssetHelper.historyLogo,
                  height: 40,
                  width: 40,
                ),
                label: "HISTORY",
                activeIcon: Image.asset(
                  AssetHelper.historyLogoSelected,
                  height: 40,
                  width: 40,
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  AssetHelper.logoutLogo,
                  height: 40,
                  width: 40,
                ),
                label: "LOGOUT",
                activeIcon: Image.asset(
                  AssetHelper.logoutLogoSelected,
                  height: 40,
                  width: 40,
                )),
          ],
          selectedItemColor: MyTheme.bottomNavigationBarSelectedColor,
          unselectedItemColor: MyTheme.bottomNavigationBarUnSelectedColor,
          selectedFontSize: 13,
          unselectedFontSize: 10,
        ),
      ),
    );
  }
}
