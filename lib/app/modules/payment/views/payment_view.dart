import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';

import 'package:get/get.dart';

import '../../../app.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/my_theme.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyTheme.appBarColor.withOpacity(0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * .2,
              width: Get.width,
              color: MyTheme.appBarColor,
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 9.0, left: 10, top: 28),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.left_chevron,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'PAYMENT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.height * .025,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height * 0.15,
              width: Get.width,
              color: Colors.white,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.currency_rupee,
                    color: MyTheme.appBarColor,
                    size: Get.height * 0.050,
                  ),
                Text(amount(),
                    style: TextStyle(
                        color: MyTheme.appBarColor,
                        fontSize: Get.height * 0.050,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.010,
            ),
             GestureDetector(
               onTap: () { controller.checkBox1Selected.value = !controller.checkBox1Selected.value; },
               child: Container(
                  height: Get.height * 0.075,
                  width: Get.width,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 18.00, top: 18.00, left: 30),
                    child: Row(
                      children: [
                        Obx(
                        ()=> CheckBoxRounded(
                            size: 20,
                            isChecked: controller.checkBox1Selected.value,
                            checkedColor: MyTheme.appBarColor,
                            onTap: (value) {
                              controller.checkBox1Selected.value =!controller.checkBox1Selected.value ;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          'By Cash',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
             ),

            const Spacer(),
            Center(
              child: SizedBox(
                height: Get.height * 00.050,
                width: Get.width * 0.85,
                child: Obx(
                  () => TextButton(
                    onPressed: () {if(controller.checkBox1Selected.value == true){
                      controller.paymentFetchData(
                          allocationReferrence: controller
                              .argument.value.allocationReference
                              .toString(),
                          deliveryType: controller.argument.value.type.toString(),
                          orderReference: controller.argument.value.orderReference.toString());

                    }
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            controller.checkBox1Selected.value == true
                                ? MyTheme.appBarColor
                                : Colors.grey.shade400)),
                    child: Text(
                      'RECEIVED',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            )
          ],
        ),
      ),
    );
  }
  String amount() {
    if (App.deliverytype == false) {
      return controller.argument.value.orderAmount;
    } else {
      return App.totalfeeee;
    }
  }
}
