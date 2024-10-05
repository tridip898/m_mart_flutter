import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/routes/app_pages.dart';

class SignupScreenController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();

  final emailFocus = FocusNode(),
      firstNameFocus = FocusNode(),
      lastNameFocus = FocusNode(),
      passwordFocus = FocusNode();
  final needToShowPassword = false.obs, isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  handleShowPassword() {
    needToShowPassword.value = !needToShowPassword.value;
  }

  signupClick() {
    if (signupFormKey.currentState?.validate() ?? false) {
      Get.toNamed(Routes.PROFILE_COMPLETION_SCREEN);
    }
  }
}
