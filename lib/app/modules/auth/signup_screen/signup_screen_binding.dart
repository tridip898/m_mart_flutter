import 'package:get/get.dart';

import 'signup_screen_controller.dart';

class SignupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupScreenController>(
      () => SignupScreenController(),
    );
  }
}
