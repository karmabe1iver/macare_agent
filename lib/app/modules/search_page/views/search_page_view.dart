import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/utils/my_theme.dart';

import '../../../data/model/laboratory_model.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchPageController());
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
                  Text(
                    'SEARCH PAGE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.height * .025,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
              SizedBox(height: Get.height*.1,width: Get.width,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(//
                        controller: controller.searchController,
                        // onChanged: (value){
                        // controller.searchFetchData();
                        // },
                        // onEditingComplete: (){
                        //   controller.searchFetchData();
                        // },
                        onFieldSubmitted: (value){
                          controller.searchFetchData();
                        },
                        decoration: const InputDecoration(labelText: "Search here",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: MyTheme.appBarColor))),
                      ),
                    )),
              ),
          Expanded(
            child: Obx(
              ()=> ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.allList.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                controller
                                    .allList[index]
                                    .testName.toString(),),
                            ),
                            Spacer(),
                            Container(
                                child: Obx(
                                  ()=> Checkbox(
                                      activeColor: Colors.white,
                                      checkColor: Colors.green,
                                      side: BorderSide(),
                                      value: controller.selectedList.contains(controller.allList[index]),
                                      //value: controller.selectedIndex.value == index,
                                      onChanged: (value) {
                                        controller.onCheckboxSelected(index,controller.allList[index]);
                                      }),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: 3,
                        color: MyTheme.dividerColor,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: TextButton(
          onPressed: () {
            controller.addSelectedTests();
            Get.back();
          },
          child: Text(
            "Submit",
            style: TextStyle(fontSize: Get.height * .028, color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(MyTheme.buttonColor),
          ),
        ),
      ),
    );
  }

}
