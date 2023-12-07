import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/data/model/visibility_model.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';
import '../../../utils/my_theme.dart';
import '../controllers/delivery_controller.dart';

class DeliveryView extends GetView<DeliveryController> {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DeliveryController());
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Get.height * .2,
            width: Get.width,
            color: MyTheme.appBarColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .04,
                    ),
                    Text(
                      "MAcare",
                      style: MyTheme.outfit(
                          textSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Hi Praveen",
                      style: MyTheme.outfit(color: MyTheme.smallFontColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "ALLOCATED DELIVERIES",
                style: MyTheme.outfit(fontWeight: FontWeight.w500),
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
                      MaterialButton(
                        onPressed: () {
                          print(model[index].visibile.value);
                          print(model[index].status.value);

                          if (!model[index].visibile.value &&
                              model[index].status.value != "pending") {
                            Get.toNamed(Routes.COLLOCTIONDETAILS);
                          }
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: 80,
                                          child: Center(
                                              child: Image.asset(
                                                  AssetHelper.houseLogo,
                                                  fit: BoxFit.fill)),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "2023-11-07",
                                          style: MyTheme.outfit(
                                              color: MyTheme.numbersColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [SizedBox(height: 5,),
                                      Text(
                                        "Amarshankar",
                                        style: MyTheme.outfit(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: Get.height * .02,
                                      ),
                                      _addressDetails(
                                        "Calicut,",
                                      ),
                                      _addressDetails(
                                        "Kollathara,",
                                      ),
                                      _addressDetails(
                                        "Marakkan kadavu paramb",
                                      ),
                                      _addressDetails(
                                        "Pin:637006",
                                      ),
                                      Obx(
                                        () => Visibility(
                                          visible: !model[index].visibile.value,
                                          child: _addressDetails(
                                            model[index].status.value == "accept"
                                                ? "Status : Accepted"
                                                : "Status : Rejected",
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * .03,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: Get.height * .08,
                                      ),
                                      Obx(
                                        () => Visibility(
                                          visible: model[index].visibile.value,
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      model[index].visibile.value =
                                                          false;
                                                    },
                                                    child: Container(
                                                      color:
                                                          const Color(0xFFECF3F3),
                                                      //height: Get.height*.02,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5,
                                                          horizontal: 5),
                                                      child: Center(
                                                        child: Text(
                                                          "Reject",
                                                          maxLines: 1,
                                                          style: MyTheme.outfit(
                                                              textSize:
                                                                  Get.height * .015,
                                                              color: Colors.red),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Expanded(
                                                    flex: 0,
                                                    child: SizedBox(
                                                      width: 5,
                                                    )),
                                                Expanded(
                                                  flex: 4,
                                                  child: GestureDetector(
                                                    // color: Color(0xFFECF3F3),
                                                    onTap: () {
                                                      model[index].visibile.value =
                                                          false;
                                                      model[index].status.value =
                                                          "accept";
                                                    },
                                                    child: Container(
                                                      color:
                                                          const Color(0xFFECF3F3),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5,
                                                          horizontal: 5),
                                                      child: Center(
                                                        child: Text(
                                                          "Accept",
                                                          maxLines: 1,
                                                          style: MyTheme.outfit(
                                                              textSize:
                                                                  Get.height * .015,
                                                              color: Colors.green),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                  width: Get.width,
                  height: 7,
                  child: Container(
                  color: MyTheme.dividerColor,
                  ),
                  )
                    ],
                  );
                },
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
      style: MyTheme.outfit(
          fontWeight: FontWeight.w400, color: MyTheme.smallFontColor),
    );
  }
}
