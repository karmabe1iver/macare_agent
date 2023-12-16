import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/data/api_services/add_test_services.dart';
import 'package:macare_agent/app/data/api_services/search_services.dart';
import 'package:macare_agent/app/data/model/add_test_response_model.dart';
import 'package:macare_agent/app/data/model/laboratory_model.dart';
import 'package:macare_agent/app/data/model/search_model.dart';

import '../../../app.dart';
import '../../../data/model/add_selected_test_model.dart';
import '../../../routes/app_pages.dart';

class SearchPageController extends GetxController {
  String argument = "";

  //RxInt selectedIndex = (-1).obs;
  TextEditingController searchController = TextEditingController();
  RxList<SearchModel> searchList = <SearchModel>[].obs;
  RxList<SearchModel> selectedList = <SearchModel>[].obs;
  RxList<SearchModel> allList = <SearchModel>[].obs;

  final count = 0.obs;

  @override
  void onInit() {
    argument = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void onCheckboxSelected(int index, SearchModel model) {
    if (selectedList.contains(model)) {
      selectedList.remove(model);
    } else {
      // Select the checkbox
      selectedList.add(model);
    }
  }

  // void filterData(String query) {
  //   filteredData.clear();
  //   if (query.isEmpty) {
  //     filteredData.addAll(data);
  //   } else {
  //     filteredData.addAll(data
  //         .where((item) => item.toLowerCase().contains(query.toLowerCase())));
  //   }
  //   update();
  // }
  Future<void> searchFetchData() async {
    allList.clear();
    allList.addAll(selectedList);
    searchList.clear();
    dynamic response = await SearchServices.searchFetchData(
        laboratoryReferences: App.laboratoryReference,
        searchQuery: searchController.text);
    if (response != null) {
      searchList.value = response ?? [];

      if (selectedList.isNotEmpty) {
        for (int k = 0; k < searchList.length; k++) {
          for (int i = 0; i < selectedList.length; i++) {
            if (searchList[k].id!.contains(selectedList[i].id!)) {
              searchList.removeAt(k);
            }
          }
          allList.addAll(searchList);
        }
      }
      allList.addAll(searchList);
    }
  }

  Future<String> addSelectTestToJson() async{
    List<AddSelectedTestModel> tests = [];
    for (int i = 0; i < selectedList.length; i++) {
      tests.add(AddSelectedTestModel(
          testName: selectedList[i].testName.toString(),
          testPrice: selectedList[i].testPrice,
          bookingReference: App.bookingReference));
    }
  String data=  addSelectedTestModelToJson(tests) ;
    print(data);
    print(tests);
    return data;
  }

  Future<dynamic> addSelectedTests() async {
    dynamic data= await addSelectTestToJson();
    dynamic response = await AddTestServices.fetchAddSelected(data);
      Get.offNamed(Routes.ADD_TEST,arguments: argument);

  }
}

