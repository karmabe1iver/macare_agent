import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/routes/app_pages.dart';

import '../../../app.dart';
import '../../../utils/my_theme.dart';
import '../controllers/add_test_controller.dart';

class AddTestView extends GetView<AddTestController> {
  const AddTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddTestController());
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
                    onPressed: () {
                      Get.toNamed(Routes.SEARCH_PAGE);
                    },
                    icon: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async{  controller.fetchData(); },
              child: ListView(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
                    child: Obx(
                      ()=> ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: controller.addTestList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  const Expanded(flex: 0, child: SizedBox()),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30, bottom: 40,right: 10,left: 15),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Text(
                           controller
                               .addTestList[index].testName.toString(),
                                                  style: MyTheme.outfit(
                                                      fontWeight: FontWeight.w300,
                                                      textSize: 20),
                                                ),
                                              ),
                                              SizedBox(width: Get.width*.03,),
                                              Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.currency_rupee),
                                                      Text(
                                                         controller.addTestList[index].testFee.toString(),
                                                        style: MyTheme.outfit(
                                                            fontWeight: FontWeight.w500,
                                                            textSize: 20),
                                                      ),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        //controller.addTestList.removeAt(index);
                                                        controller
                                                            .fetchDeleteTest(
                                                            id: controller
                                                                .addTestList[index]
                                                                .id
                                                                .toString());
                                                      },
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
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _addressDetails(
                                "Subtotal Fee",
                              ),
                              Spacer(),
                              const Icon(Icons.currency_rupee,size: 15,),
                              SizedBox(width: 50,
                                child: Obx(() => Text('${controller.sum.value}',style: MyTheme.outfit(
                                    fontWeight: FontWeight.w500, color: MyTheme.smallFontColor),),),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              _addressDetails(
                                " Collection Charge",
                              ),
                              Spacer(),
                              const Icon(Icons.currency_rupee,size: 15,),
                              SizedBox(height: 10,width:50,
                                   child: TextFormField(
                                     onChanged: (value){ controller.addTestTotal();},
                                    controller: controller.collectionChargeController,

                                    keyboardType: TextInputType.number,
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            children: [
                              const Text(
                                "Total Fee",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              const Icon(Icons.currency_rupee,size: 15,),
                              SizedBox(width: 50,
                                child: Obx(
                                    ()=> Text('${controller.totalFeee.value}',
                                      style: MyTheme.outfit(
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ),
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
                        Row(
                          children: [Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 49,
                                width: Get.width / 2.4,
                                child: Obx(
                                      ()=> TextButton(
                                      onPressed: () {
                                        if(controller.isChecked.value == true ){
                                          String status="Sample Collected";
                                          controller.fetchCheckout(bookingReference: App.bookingReference,
                                            bookingAllocationStatus: status,
                                            bookingStatus: status,
                                            empReference: App.employeereference,  );

                                        }
                                        //Get.toNamed(Routes.LABORATORY);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            controller.isChecked.value == true
                                                ?  MyTheme.buttonColor
                                                :  Colors.grey.shade400),
                                      ),
                                      child: Text(
                                        'CHECKOUT',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: Get.height * .018),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

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
