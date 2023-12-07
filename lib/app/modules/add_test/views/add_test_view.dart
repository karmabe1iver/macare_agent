import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/my_theme.dart';
import '../controllers/add_test_controller.dart';

class AddTestView extends GetView<AddTestController> {
  const AddTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * .2,
            width: Get.width,
            color: MyTheme.appBarColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 50, top: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      CupertinoIcons.left_chevron,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    'ADD TEST',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.height * .025,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.add,
                      color: MyTheme.bottomNavigationBarUnSelectedColor,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, top: 30, bottom: 50),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "X-RAY-GDHFHF",
                                          style: MyTheme.outfit(
                                              fontWeight: FontWeight.w300,
                                              textSize: 20),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              const Icon(Icons.currency_rupee),
                                              Text(
                                                "1000",
                                                style: MyTheme.outfit(
                                                    fontWeight: FontWeight.w500,
                                                    textSize: 20),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                CupertinoIcons.delete,
                                                color: Colors.red,
                                              )))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 7,
                        color: MyTheme.dividerColor,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        _addressDetails(
                          "Subtotal Fee",
                        ),
                        Spacer(),
                        const Icon(Icons.currency_rupee),
                        _addressDetails(
                          "1000",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        _addressDetails(
                          " Collection Charge",
                        ),
                        Spacer(),
                        const Icon(Icons.currency_rupee),
                        _addressDetails(
                          "1000",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          "Total Fee",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(Icons.currency_rupee),
                        Text("1300",
                            style: MyTheme.outfit(
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            activeColor: Colors.white,
                            side: BorderSide(),
                            checkColor: Colors.green,
                            value: controller.isChecked.value,
                            onChanged: (value) {
                              controller.isChecked.value = value!;
                            },
                          ),
                        ),
                        Text(
                          "Cash Collected",
                          style: MyTheme.outfit(
                              fontWeight: FontWeight.w400,
                              color:
                                  MyTheme.bottomNavigationBarUnSelectedColor),
                        ),
                        SizedBox(height: Get.height*.02,),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 49,
                      width: Get.width / 2.4,
                      child: TextButton(
                          onPressed: () {
                          },
                          child: Text(
                            'CHECKOUT',
                            style: TextStyle(
                                color: Colors.white, fontSize: Get.height * .018),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(MyTheme.buttonColor),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _addressDetails(String title) {
    return Text(
      title,
      //"Calicut,Kollathara",
      style: MyTheme.outfit(
          fontWeight: FontWeight.w500, color: MyTheme.smallFontColor),
    );
  }
}
