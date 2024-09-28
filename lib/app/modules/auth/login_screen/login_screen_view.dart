import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/core/constants/app_colors.dart';
import 'package:m_mart_flutter/app/core/constants/my_text_style.dart';
import 'package:m_mart_flutter/app/core/widgets/app_rich_text.dart';
import 'package:soft_builder/constraints/my_constraints.dart';
import 'package:soft_builder/widget/my_button.dart';
import 'package:soft_builder/widget/my_edit_text.dart';

import '../../../routes/app_pages.dart';
import 'login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: mainPadding(20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: text20Style(
                      fontSize: 32,
                      isWeight500: true,
                    ),
                  ),
                  gapH20,
                  Text(
                    "Hi! Welcome back, you've been missed",
                    style: text16Style(color: AppColor.grey, isWeight400: true),
                    textAlign: TextAlign.center,
                  ),
                  gapH20,
                  Form(
                    key: controller.formKey,
                    child: Obx(() {
                      return Column(
                        children: [
                          MyEditText(
                            title: "",
                            hintText: "Email Address",
                            errorMsg: "Please enter your email",
                            controller: controller.emailController,
                            focusNode: controller.emailFocus,
                            nextFocus: controller.passwordFocus,
                            isEmail: true,
                          ),
                          MyEditText(
                            title: "",
                            hintText: "Password",
                            errorMsg: "Please enter your password",
                            controller: controller.passwordController,
                            focusNode: controller.passwordFocus,
                            isPassword: !controller.needToShowPassword.value,
                            needToShowEye: true,
                            eyeClick: controller.handleShowPassword,
                          ),
                        ],
                      );
                    }),
                  ),
                  gapH6,
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.FORGOT_PASSWORD_SCREEN);
                      },
                      child: Text(
                        "Forgot password?",
                        style: text14Style(
                          isWeight600: true,
                          isPrimaryColor: true,
                        ),
                      ),
                    ),
                  ),
                  gapH30,
                  MyButton(
                    label: "Sign In",
                    onPressed: controller.loginClick,
                  ),
                  gapH20,
                  MyRichText(
                    startText: "Don't have an account?",
                    endText: "Signup",
                    endTextColor: AppColor.primaryColor,
                    endFontWeight: FontWeight.w600,
                    fontSize: 15,
                    onTap: () {
                      Get.toNamed(Routes.SIGNUP_SCREEN);
                    },
                  ),
                  gapH32,
                  gapH8,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
