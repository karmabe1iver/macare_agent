import 'package:get/get.dart';

import '../modules/add_test/bindings/add_test_binding.dart';
import '../modules/add_test/views/add_test_view.dart';
import '../modules/collection_details/bindings/collection_details_binding.dart';
import '../modules/collection_details/views/collection_details_view.dart';
import '../modules/delivery/bindings/delivery_binding.dart';
import '../modules/delivery/views/delivery_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laboratory/bindings/laboratory_binding.dart';
import '../modules/laboratory/views/laboratory_view.dart';
import '../modules/loginpage/bindings/loginpage_binding.dart';
import '../modules/loginpage/views/loginpage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGINPAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LABORATORY,
      page: () => const LaboratoryView(),
      binding: LaboratoryBinding(),
    ),
    GetPage(
      name: _Paths.COLLOCTIONDETAILS,
      page: () => const CollectionDetailsView(),
      binding: CollectionDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () => DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => LoginpageView(),
      binding: LoginpageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TEST,
      page: () => const AddTestView(),
      binding: AddTestBinding(),
    ),

  ];
}
