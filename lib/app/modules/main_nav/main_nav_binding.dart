import 'package:get/get.dart';
import 'package:m_mart_flutter/app/modules/main_screen/home/home_controller.dart';

import 'main_nav_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(
      () => MainNavController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}
