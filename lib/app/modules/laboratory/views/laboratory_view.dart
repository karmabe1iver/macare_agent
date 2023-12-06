import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/routes/app_pages.dart';
import 'package:macare_agent/app/utils/asset_helper.dart';
import 'package:macare_agent/app/utils/my_theme.dart';

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
                "ALLOCATED COLLECTION",
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
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child:MaterialButton(
                      onPressed: (){
                        if(controller.visibility[index].value == false){
                          Get.toNamed(Routes.COLLOCTIONDETAILS);
                        }
                       // Get.toNamed(Routes.COLLOCTIONDETAILS);
                      },
                      child: Column(
                       // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                AssetHelper.laboratoryLogo,
                                                fit: BoxFit.fill)),
                                      ),
                                      const SizedBox(
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
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amarshankar",
                                      style: MyTheme.outfit(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: Get.height*.02,
                                    ),
                                    _addressDetails(
                                      "Calicut,Kollathara",
                                    ),
                                    _addressDetails(
                                      "Pin:637006",
                                    ),
                                    _addressDetails(
                                      "health issues test",
                                    ),
                                    _addressDetails(
                                      "Kaloor,Kochin",
                                    ),
                                    _addressDetails(
                                      "Samples",
                                    ),
                                    _addressDetails(
                                      "Status:sample collected",
                                    ),
                                    SizedBox(height: Get.height*.03,)
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: Get.height*.15,),
                                    Obx(
                                      ()=> Visibility(visible: controller.visibility[index].value,
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                flex:5,
                                                child: GestureDetector(
                                                 // color: Color(0xFFECF3F3),
                                                  onTap: () {
                                                     controller.visibility[index].value=false;
                                                  },
                                                  child: Container(
                                                    color: const Color(0xFFECF3F3),
                                                    //height: Get.height*.02,
                                                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                    child: Center(
                                                      child: Text(
                                                        "Reject",
                                                        maxLines: 1,
                                                        style: MyTheme.outfit(
                                                          textSize: Get.height*.015,
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Expanded(
                                                flex: 0,
                                                  child: SizedBox(width: 5,)),
                                              Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  // color: Color(0xFFECF3F3),
                                                  onTap: () {
                                                    controller.visibility[index].value=false;
                                                  },
                                                  child: Container(
                                                    color: const Color(0xFFECF3F3),
                                                    //height: Get.height*.02,
                                                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                    child: Center(
                                                      child: Text(
                                                        "Accept",
                                                        maxLines: 1,
                                                        style: MyTheme.outfit(
                                                            textSize: Get.height*.015,
                                                            color: Colors.green),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Expanded(
                                                  flex: 2,
                                                  child: SizedBox()
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 7,
                            color: MyTheme.dividerColor,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )

          // Container(
          //   child: Column(children: [
          //
          //   ],),
          // )
        ],
      ),
    );
  }

  Widget _addressDetails(String title) {
    return Text(
      title,
      //"Calicut,Kollathara",
      style: MyTheme.outfit(
          fontWeight: FontWeight.w400, color: MyTheme.smallFontColor),
    );
  }
}
