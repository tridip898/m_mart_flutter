import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/routes/app_pages.dart';

class LoginScreenController extends GetxController {
  final signinFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController(),
      passwordController = TextEditingController();

  final emailFocus = FocusNode(), passwordFocus = FocusNode();
  final needToShowPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  handleShowPassword() {
    needToShowPassword.value = !needToShowPassword.value;
  }

  loginClick() {
    if (signinFormKey.currentState?.validate() ?? false) {
      Get.offAllNamed(Routes.MAIN_NAV);
    }
  }
}
