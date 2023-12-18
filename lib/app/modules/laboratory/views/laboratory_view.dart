import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/routes/app_pages.dart';
import 'package:macare_agent/app/utils/my_theme.dart';

import '../../../app.dart';
import '../controllers/laboratory_controller.dart';

class LaboratoryView extends GetView<LaboratoryController> {
  const LaboratoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LaboratoryController());
    return Scaffold(
      backgroundColor: MyTheme.appBackgroundColor,
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
                    SizedBox(height: Get.height * .04,),
                    Text(
                      "MAcare",
                      style: MyTheme.outfit(
                          textSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      App.employeename,
                      style: MyTheme.outfit(color: MyTheme.employeeColor),
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
                "ALLOCATED COLLECTION",
                style: MyTheme.outfit(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
              child: RefreshIndicator(
                onRefresh: () async { controller.laboratoryFetchData();},
                child: Obx(
                      () =>
                      ListView.builder(padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: controller.laboratoryList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              MaterialButton(
                                onPressed: () {

                                  if (controller
                                      .laboratoryList[index]
                                      .allocationStatus != "pending") {
                                    App.bookingReference=controller.laboratoryList[index].bRef!;
                                  Get.toNamed(Routes.COLLOCTIONDETAILS,arguments: controller
                                      .laboratoryList[index]);
                                  }
                                },
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        // Expanded(
                                        //   flex: 4,
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(8.0),
                                        //     child: Column(
                                        //       children: [
                                        //         const SizedBox(
                                        //           height: 20,
                                        //         ),
                                        //         Text(
                                        //           controller
                                        //               .laboratoryList[index]
                                        //               .laboratoryBookingTime
                                        //               .toString(),
                                        //           style: MyTheme.outfit(
                                        //               color: MyTheme
                                        //                   .numbersColor),
                                        //         ),
                                        //         Text(
                                        //           controller
                                        //               .laboratoryList[index]
                                        //               .laboratoryBookingDate
                                        //               .toString(),
                                        //           style: MyTheme.outfit(
                                        //               color: MyTheme
                                        //                   .numbersColor),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              const SizedBox(height: 15,),
                                              controller.laboratoryList[index]
                                                  .customerNameForCollection!.isNotEmpty?
                                              Text(
                                                controller.laboratoryList[index]
                                                    .customerNameForCollection
                                                    .toString(),
                                                style: MyTheme.outfit(
                                                    fontWeight: FontWeight
                                                        .w600),
                                              ):const SizedBox(),
                                              SizedBox(height: 3,),
                                              controller.laboratoryList[index]
                                                  .customerAddressForCollection!.isNotEmpty?
                                              _addressDetails(
                                                controller.laboratoryList[index]
                                                    .customerAddressForCollection
                                                    .toString(),
                                              ):const SizedBox(),
                                            //  _addressDetails("Pin:637006",),
                                              controller.laboratoryList[index]
                                                  .customerPhoneForCollection!.isNotEmpty?
                                              _addressDetails(
                                                controller.laboratoryList[index]
                                                    .customerPhoneForCollection
                                                    .toString(),
                                              ):const SizedBox(),
                                              controller.laboratoryList[index]
                                                  .customerEmailForCollection!.isNotEmpty?
                                              _addressDetails(
                                                 controller.laboratoryList[index]
                                                     .customerEmailForCollection
                                                     .toString(),
                                              ):const SizedBox(),
                                              //_addressDetails("Samples",),
                                              _addressDetails(
                                                  "Status : ${controller
                                                      .laboratoryList[index]
                                                      .allocationStatus}"

                                              ),
                                                      SizedBox(height: Get.height*.020,),
                                                      Row(mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [


                                                          Text(
                                                            controller
                                                                .laboratoryList[index]
                                                                .laboratoryBookingTime
                                                                .toString(),
                                                            style: MyTheme.outfit(
                                                                color: MyTheme.numbersColor,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,textSize: 10),
                                                          ),
                                                          SizedBox(width: Get.width*.030,),

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
                                              Visibility(visible: controller
                                                  .laboratoryList[index]
                                                  .allocationStatus == "pending"
                                                ,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: 15,top: 0),
                                                  child: SizedBox(
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: GestureDetector(
                                                            // color: Color(0xFFECF3F3),
                                                            onTap: () {
                                                              controller
                                                                  .laboratoryDialogBox(agentUpdateReference: controller.laboratoryList[index].agentUpdateReference.toString(), context: context);

                                                              // model[index].visibile.value =
                                                              // false;
                                                            },
                                                            child: Container(
                                                              color: const Color(
                                                                  0xFFECF3F3),
                                                              //height: Get.height*.02,
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 5,
                                                                  horizontal: 5),
                                                              child: Center(
                                                                child: Text(
                                                                  "Reject",
                                                                  maxLines: 1,
                                                                  style: MyTheme
                                                                      .outfit(
                                                                      textSize: 12,
                                                                      //Get.height*.015,
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: Get.width*.030,),
                                                        Expanded(
                                                          child: GestureDetector(
                                                            // color: Color(0xFFECF3F3),
                                                            onTap: () {
                                                              controller
                                                                  .laboratoryAcceptData(
                                                                  bRef: controller
                                                                      .laboratoryList[index]
                                                                      .bRef
                                                                      .toString());
                                                            },
                                                            child: Container(
                                                              color: const Color(
                                                                  0xFFECF3F3),
                                                              //height: Get.height*.02,
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 5,
                                                                  horizontal: 5),
                                                              child: Center(
                                                                child: Text(
                                                                  "Accept",
                                                                  maxLines: 1,
                                                                  style: MyTheme
                                                                      .outfit(
                                                                      textSize: 12,
                                                                      // textSize: Get.height*.015,
                                                                      color: Colors
                                                                          .green),
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
                                            ],
                                          ),
                                        ),
                                        // Expanded(
                                        //   flex: 3,
                                        //   child: Column(
                                        //     mainAxisAlignment: MainAxisAlignment
                                        //         .end,
                                        //     children: [
                                        //       SizedBox(
                                        //         height: Get.height * .15,),
                                        //       Visibility(visible: controller
                                        //           .laboratoryList[index]
                                        //           .allocationStatus == "pending"
                                        //         ,
                                        //         child: SizedBox(
                                        //           child: Row(
                                        //             children: [
                                        //               Expanded(
                                        //                 child: GestureDetector(
                                        //                   // color: Color(0xFFECF3F3),
                                        //                   onTap: () {
                                        //                     controller
                                        //                         .laboratoryDialogBox(agentUpdateReference: controller.laboratoryList[index].agentUpdateReference.toString(), context: context);
                                        //
                                        //                     // model[index].visibile.value =
                                        //                     // false;
                                        //                   },
                                        //                   child: Container(
                                        //                     color: const Color(
                                        //                         0xFFECF3F3),
                                        //                     //height: Get.height*.02,
                                        //                     padding: const EdgeInsets
                                        //                         .symmetric(
                                        //                         vertical: 5,
                                        //                         horizontal: 5),
                                        //                     child: Center(
                                        //                       child: Text(
                                        //                         "Reject",
                                        //                         maxLines: 1,
                                        //                         style: MyTheme
                                        //                             .outfit(
                                        //                             textSize: 12,
                                        //                             //Get.height*.015,
                                        //                             color: Colors
                                        //                                 .red),
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //               Expanded(
                                        //                 child: GestureDetector(
                                        //                   // color: Color(0xFFECF3F3),
                                        //                   onTap: () {
                                        //                     controller
                                        //                         .laboratoryAcceptData(
                                        //                         bRef: controller
                                        //                             .laboratoryList[index]
                                        //                             .bRef
                                        //                             .toString());
                                        //                   },
                                        //                   child: Container(
                                        //                     color: const Color(
                                        //                         0xFFECF3F3),
                                        //                     //height: Get.height*.02,
                                        //                     padding: const EdgeInsets
                                        //                         .symmetric(
                                        //                         vertical: 5,
                                        //                         horizontal: 5),
                                        //                     child: Center(
                                        //                       child: Text(
                                        //                         "Accept",
                                        //                         maxLines: 1,
                                        //                         style: MyTheme
                                        //                             .outfit(
                                        //                             textSize: 12,
                                        //                             // textSize: Get.height*.015,
                                        //                             color: Colors
                                        //                                 .green),
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
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
