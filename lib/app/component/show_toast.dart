import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../utils/my_theme.dart';

void showToast({required String msg}) {
  FToast fToast = FToast();
  fToast.removeQueuedCustomToasts();
  fToast.init(Get.context!);
  fToast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * .01, horizontal: Get.width * .05),
        decoration: BoxDecoration(
            // color: MyTheme.black,
            color: Colors.black,
            borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   "asset/macare_logo.png",
            //   height: Get.height * .04,
            // ),
            Text(
              msg,
              style: MyTheme.outfit(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  textSize: Get.height * .020),
            ),
          ],
        ),
      ),
      positionedToastBuilder: (context, widget) {
        return Positioned(
          bottom: Get.height * .15,
          left: 10,
          right: 10,
          child: widget,
        );
      },
      gravity: ToastGravity.BOTTOM);
  // Fluttertoast.showToast(
  //   msg:message,
  //   toastLength: Toast.LENGTH_LONG,
  //   gravity: ToastGravity.BOTTOM,
  //   timeInSecForIosWeb: 1,
  //   backgroundColor: Colors.black,
  //   textColor: Colors.white,
  //   fontSize: 30.0,
  // );
  // // FToastBuilder();
  // // FToast fToast;
  // // fToast = FToast();
  // //
  // //   Widget toast = Container(
  // //     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  // //     decoration: const BoxDecoration(color: Colors.black,
  // //     ),
  // //     child: const Row(children: [ Text("This is a Custom Toast")],),
  // //   );
  // //   fToast.showToast(child: toast,
  // //    gravity: ToastGravity.BOTTOM,
  // //   toastDuration: const Duration(seconds: 2),
  // //   positionedToastBuilder: (context,child){
  // //     return Positioned(bottom: 16,child: child,
  // //     );
  // //   });
  // //
}
