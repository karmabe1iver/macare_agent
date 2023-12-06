import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';
import '../../../utils/my_theme.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: Get.height*.04,),
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
                "LABORATORY COLLECTION",
                style: MyTheme.outfit(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "03.33 PM",
                                    style: MyTheme.outfit(
                                        color: MyTheme.numbersColor),
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
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                _serviceDetails(
                                  "Bill Number:00000",
                                ),
                                _serviceDetails(
                                  "Bill Number:00000",
                                ),
                                _serviceDetails(
                                  "Samples",
                                ),


                                SizedBox(height: Get.height * .03,)
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
          )
        ],
      ),


    );
  }

  Widget _serviceDetails(String title) {
    return Text(
      title,
      style: MyTheme.outfit(
          fontWeight: FontWeight.w400, color: MyTheme.smallFontColor),
    );
  }
}
