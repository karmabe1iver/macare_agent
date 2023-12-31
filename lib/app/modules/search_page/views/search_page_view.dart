import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/utils/my_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchPageController());
    return WillPopScope(
      onWillPop: ()async{
        Get.offNamed(Routes.ADD_TEST,arguments: controller.argument);
        return false;
      },
      child: Scaffold(
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
                          style: MyTheme.outfit(),
                          controller: controller.searchController,
                          onChanged: (value){
                            if(controller.searchController.text.length > 2) {
                              controller.searchFetchData();
                            }
                          },
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
                          child: MaterialButton(
                            onPressed: () { controller.onCheckboxSelected(index,controller.allList[index]); },
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    controller
                                        .allList[index]
                                        .testName.toString(),style: MyTheme.outfit(),),
                                ),
                                const Spacer(),
                                Obx(
                                  ()=> Checkbox(
                                      activeColor: Colors.white,
                                      checkColor: Colors.green,
                                      side: const BorderSide(),
                                      value: controller.selectedList.contains(controller.allList[index]),
                                      //value: controller.selectedIndex.value == index,
                                      onChanged: (value) {
                                        controller.onCheckboxSelected(index,controller.allList[index]);
                                      }),
                                )
                              ],
                            ),
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


            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(MyTheme.buttonColor),
            ),
            child: Text(
              "Submit",
              style: TextStyle(fontSize: Get.height * .028, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

}
