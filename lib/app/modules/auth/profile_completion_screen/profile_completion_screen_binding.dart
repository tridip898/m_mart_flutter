import 'package:get/get.dart';

import 'profile_completion_screen_controller.dart';

class ProfileCompletionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileCompletionScreenController>(
      () => ProfileCompletionScreenController(),
    );
  }
}
