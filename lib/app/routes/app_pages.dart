import 'package:get/get.dart';
import 'package:macare_agent/app/modules/collection_details/bindings/collection_details_binding.dart';
import 'package:macare_agent/app/modules/collection_details/views/collection_details_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laboratory/bindings/laboratory_binding.dart';
import '../modules/laboratory/views/laboratory_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
    ),GetPage(
      name: _Paths.COLLOCTIONDETAILS,
      page: () => const CollectionDetailsView(),
      binding: CollectionDetailsBinding(),
    ),
  ];
}
