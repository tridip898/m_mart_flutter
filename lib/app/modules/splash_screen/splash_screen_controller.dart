import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  var appName = "M-Mart";

  @override
  void onInit() {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      },
    );
    super.onInit();
  }
}
