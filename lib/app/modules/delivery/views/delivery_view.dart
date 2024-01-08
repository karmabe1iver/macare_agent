import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app.dart';
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
                      height: Get.height * .06,
                    ),
                    Text(
                      "MAcare",
                      style: MyTheme.outfit(
                          textSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Transform.translate(
                      offset: const Offset(-8, 0),
                      child: Text(
                        App.employeename,
                        style: MyTheme.outfit(color: MyTheme.employeeColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "ALLOCATED DELIVERIES",
                style: MyTheme.outfit(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.deliveryFetchData();
                },
                child: Obx(
                      () =>
                  controller.deliveryDetails.isNotEmpty
                      ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.deliveryDetails.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          MaterialButton(
                            onPressed: () {

                              if (controller.deliveryDetails[index]
                                  .allocationStatus !=
                                  "pending") {controller.deliveryDetailsFetchData(
                                  allocationReferrence: controller
                                      .deliveryDetails[index].allocationReference
                                      .toString(),
                                  deliveryType: controller.deliveryDetails[index].type.toString(),
                                  orderReference: controller.deliveryDetails[index].orderReference
                                      .toString());
                                Get.toNamed(Routes.DELIVERY_DETAILS,
                                    arguments: controller
                                        .deliveryDetails[index]);
                              }
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // Expanded(
                                    //   flex: 4,
                                    //   child: Padding(
                                    //     padding:
                                    //     const EdgeInsets.all(8.0),
                                    //     child: Column(
                                    //       children: [
                                    //         SizedBox(
                                    //           height: 40,
                                    //           width: 80,
                                    //           child: Center(
                                    //               child: Image.asset(
                                    //                   AssetHelper
                                    //                       .houseLogo,
                                    //                   fit: BoxFit.fill)),
                                    //         ),
                                    //
                                    //         SizedBox(
                                    //           height: 20,
                                    //         ),
                                    //         Obx(
                                    //        ()=> Text(
                                    //             controller
                                    //                 .datee.value.toString(),
                                    //             style: MyTheme.outfit(
                                    //                 color: MyTheme
                                    //                     .numbersColor),
                                    //           ),
                                    //         )
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ), controller
                                              .deliveryDetails[index]
                                              .deliveryDetails!
                                              .first
                                              .customerName!.isNotEmpty ?
                                          Text(
                                            controller
                                                .deliveryDetails[index]
                                                .deliveryDetails!
                                                .first
                                                .customerName
                                                .toString(),
                                            style: MyTheme.outfit(
                                                fontWeight:
                                                FontWeight.w600),
                                          ) : SizedBox(),
                                          controller
                                              .deliveryDetails[index]
                                              .deliveryDetails!
                                              .first
                                              .customerAddress!.isNotEmpty ?
                                          _addressDetails(
                                            controller
                                                .deliveryDetails[index]
                                                .deliveryDetails!
                                                .first
                                                .customerAddress
                                                .toString(),
                                          ) : SizedBox(),

                                          _addressDetails(
                                            controller
                                                .deliveryDetails[index]
                                                .deliveryDetails!
                                                .first
                                                .pinCode
                                                .toString(),
                                          ) ,
                                          Obx(
                                                () =>
                                                Visibility(
                                                  visible: true,
                                                  child: controller
                                                      .deliveryDetails[index]
                                                      .allocationStatus!
                                                      .isNotEmpty
                                                      ? _addressDetails(
                                                      "Status : ${controller
                                                          .deliveryDetails[index]
                                                          .allocationStatus
                                                          .toString()}"):SizedBox(),
                                                ),
                                          ),
                                      Row(mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Obx(
                                                   ()=> Text(
                                                        controller
                                                            .datee.value.toString(),
                                                        style: MyTheme.outfit(
                                                            color: MyTheme
                                                                .numbersColor,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,textSize: 10),
                                                      ),
                                                    ),

                                        ],
                                      ),
                                          SizedBox(
                                            height: Get.height * .010,),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Obx(
                                                  () =>
                                                  Visibility(
                                                    visible:
                                                    controller
                                                        .deliveryDetails[index]
                                                        .allocationStatus ==
                                                        "pending",
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          Expanded(

                                                            child:
                                                            GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .deliveryDialogBox(
                                                                    allocationReferrence: controller
                                                                        .deliveryDetails[index]
                                                                        .allocationReference
                                                                        .toString(),
                                                                    deliveryType: controller
                                                                        .deliveryDetails[index]
                                                                        .type
                                                                        .toString(),
                                                                    orderReferrence: controller
                                                                        .deliveryDetails[index]
                                                                        .orderReference
                                                                        .toString(),
                                                                    context:
                                                                    context);
                                                                // controller
                                                                //     .deliveryFetchData();
                                                                // Fluttertoast
                                                                //     .showToast(
                                                                //   msg: "Rejected",
                                                                //   toastLength: Toast
                                                                //       .LENGTH_SHORT,
                                                                //   gravity: ToastGravity
                                                                //       .BOTTOM,
                                                                //   timeInSecForIosWeb: 1,
                                                                //   backgroundColor: MyTheme
                                                                //       .appBarColor,
                                                                //   textColor: Colors
                                                                //       .white,
                                                                //   fontSize: 16.0,
                                                                // );
                                                                // model[index]
                                                                //     .visibile
                                                                //     .value = false;
                                                              },
                                                              child: Container(
                                                                height: 35,
                                                                color: MyTheme.rejectButtonColor,
                                                                //height: Get.height*.02,
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                    5),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Reject",
                                                                    maxLines: 1,
                                                                    style: MyTheme
                                                                        .outfit(
                                                                        textSize: Get.height * .015,
                                                                        fontWeight: FontWeight.w600,
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: Get.width*.030,),
                                                          Expanded(

                                                            child:
                                                            GestureDetector(
                                                              // color: Color(0xFFECF3F3),
                                                              onTap: () {
                                                                controller
                                                                    .acceptFetchData(
                                                                    orderReferrence: controller
                                                                        .deliveryDetails[
                                                                    index]
                                                                        .orderReference
                                                                        .toString(),
                                                                    allocationReferrence: controller
                                                                        .deliveryDetails[
                                                                    index]
                                                                        .allocationReference
                                                                        .toString(),
                                                                    deliveryType: controller
                                                                        .deliveryDetails[
                                                                    index]
                                                                        .type
                                                                        .toString());
                                                                controller
                                                                    .deliveryFetchData();
                                                                Fluttertoast
                                                                    .showToast(
                                                                  msg: "Accepted",
                                                                  toastLength: Toast
                                                                      .LENGTH_SHORT,
                                                                  gravity: ToastGravity
                                                                      .BOTTOM,
                                                                  timeInSecForIosWeb: 1,
                                                                  backgroundColor: MyTheme
                                                                      .appBarColor,
                                                                  textColor: Colors
                                                                      .white,
                                                                  fontSize: 16.0,
                                                                );

                                                                // model[index]
                                                                //     .visibile
                                                                //     .value = false;
                                                                // model[index]
                                                                //         .status
                                                                //         .value =
                                                                //     "accept";
                                                              },
                                                              child: Container(height: 35,
                                                                color: MyTheme.acceptButtonColor,
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                    5),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Accept",
                                                                    maxLines: 1,
                                                                    style: MyTheme
                                                                        .outfit(
                                                                        textSize: Get.height * .015,
                                                                        fontWeight: FontWeight.w600,
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
                                            ),
                                          ),

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
                  )
                      : ListView(
                    children: [
                      SizedBox(
                        height: Get.height * 1.2,
                      )
                    ],
                  ),
                ),
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
          fontWeight: FontWeight.w500, color: MyTheme.smallFontColor),
    );
  }
}
