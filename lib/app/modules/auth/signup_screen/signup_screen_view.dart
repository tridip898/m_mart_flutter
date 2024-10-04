import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_builder/constraints/my_constraints.dart';
import 'package:app_builder/constraints/my_text_style.dart';
import 'package:app_builder/widget/my_button.dart';
import 'package:app_builder/widget/my_edit_text.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_rich_text.dart';
import '../../../routes/app_pages.dart';
import 'signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  const SignupScreenView({super.key});

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
                    "Create Account",
                    style: text20Style(
                      fontSize: 32,
                      isWeight500: true,
                    ),
                  ),
                  gapH20,
                  Text(
                    "Fill your information for create account",
                    style: text16Style(color: AppColor.grey, isWeight400: true),
                    textAlign: TextAlign.center,
                  ),
                  gapH24,
                  Form(
                    key: controller.formKey,
                    child: Obx(() {
                      return Column(
                        children: [
                          MyEditText(
                            title: "",
                            hintText: "First Name",
                            errorMsg: "Please enter your first name",
                            controller: controller.firstNameController,
                            focusNode: controller.firstNameFocus,
                            nextFocus: controller.lastNameFocus,
                          ),
                          MyEditText(
                            title: "",
                            hintText: "Last Name",
                            errorMsg: "Please enter your last name",
                            controller: controller.lastNameController,
                            focusNode: controller.lastNameFocus,
                            nextFocus: controller.emailFocus,
                          ),
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
                  Obx(() {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (val) {
                              controller.isChecked.value = val ?? false;
                            },
                            activeColor: AppColor.primaryColor,
                          ),
                          Flexible(
                            child: MyRichText(
                              startText: "Agree with",
                              endText: "Terms & Condition",
                              endTextColor: AppColor.primaryColor,
                              endFontWeight: FontWeight.w600,
                              fontSize: 15,
                              onTap: () {
                                Get.toNamed(Routes.LOGIN_SCREEN);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  gapH24,
                  MyButton(
                    label: "Sign Up",
                    onPressed: controller.signupClick,
                  ),
                  gapH20,
                  MyRichText(
                    startText: "Already have an account?",
                    endText: "Sign in",
                    endTextColor: AppColor.primaryColor,
                    endFontWeight: FontWeight.w600,
                    fontSize: 15,
                    onTap: () {
                      Get.toNamed(Routes.LOGIN_SCREEN);
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
