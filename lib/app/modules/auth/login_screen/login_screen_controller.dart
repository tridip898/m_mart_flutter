import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
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

  loginClick() {}
}
