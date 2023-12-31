import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../app.dart';
import '../../../utils/asset_helper.dart';
import '../../../utils/my_theme.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HistoryController());
    controller.historyFetchData();

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
                    SizedBox(height: Get.height*.06,),
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
                "ALLOCATION HISTORY",
                style: MyTheme.outfit(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
              child: RefreshIndicator(
                onRefresh: () async{ controller.historyFetchData(); },
                child: Obx(
                  ()=> ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.historyDetails.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 80,
                                        child: Center(
                                            child: Image.asset(
                                                AssetHelper.laboratoryLogo,
                                                fit: BoxFit.fill)),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * .02,
                                    ),
                                    _serviceDetails('Bill Number:  ${
                                        controller.historyDetails[index].bookingReferenceBillNumber.toString()}',
                                    ),

                                    _serviceDetails('Bill Amount:  ${
                                      controller.historyDetails[index].bookingReferenceBillAmount.toString()}',
                                    ),
                                    _serviceDetails('Samples: ${
                                      controller.historyDetails[index].bookingReferenceSampleType.toString()}',
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          controller.historyDetails[index].bookingReferenceBookingTime.toString(),
                                          style: MyTheme.outfit(
                                              color: MyTheme
                                                  .numbersColor,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,textSize: 10),),
                                        SizedBox(width: Get.width*.030,),
                                        Obx(
                                              ()=> Text(
                                            controller.datee.value.toString(),
                                                  style: MyTheme.outfit(
                                                      color: MyTheme
                                                          .numbersColor,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,textSize: 10),
                                          ),
                                        ),
                                        SizedBox(width: Get.width*.030,),
                                      ],
                                    ),


                                    SizedBox(height: Get.height * .01,)
                                  ],
                                ),
                              ),


                            ],

                          ),
                          Container(
                            height: 7,
                            color: MyTheme.dividerColor,
                          )
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

  Widget _serviceDetails(String title) {
    return Text(
      title,
      style: MyTheme.outfit(
          fontWeight: FontWeight.w500, color: MyTheme.smallFontColor),
    );
  }
}
