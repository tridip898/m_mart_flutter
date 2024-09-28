import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/core/constants/app_colors.dart';
import 'package:m_mart_flutter/app/core/widgets/app_default/app_app_bar.dart';
import 'package:soft_builder/constraints/my_constraints.dart';
import 'package:soft_builder/constraints/my_text_style.dart';
import 'package:soft_builder/widget/my_button.dart';
import 'package:soft_builder/widget/my_edit_text.dart';

import '../../../core/widgets/app_rich_text.dart';
import '../../../routes/app_pages.dart';
import 'forgot_password_screen_controller.dart';

class ForgotPasswordScreenView extends GetView<ForgotPasswordScreenController> {
  const ForgotPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      backgroundColor: AppColor.white,
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
                    "Forgot Password?",
                    style: text20Style(
                      fontSize: 32,
                      isWeight500: true,
                    ),
                  ),
                  gapH20,
                  Text(
                    "No worries, we'll send you reset instruction",
                    style: text16Style(color: AppColor.grey, isWeight400: true),
                    textAlign: TextAlign.center,
                  ),
                  gapH48,
                  Form(
                    // key: controller.formKey,
                    child: Column(
                      children: [
                        MyEditText(
                          title: "",
                          hintText: "Email Address",
                          errorMsg: "Please enter your email",
                          controller: controller.emailController,
                          isEmail: true,
                        ),
                      ],
                    ),
                  ),
                  gapH48,
                  MyButton(
                    label: "Verify Email",
                    onPressed: controller.loginClick,
                  ),
                  gapH16,
                  MyRichText(
                    startText: "Already have an account?",
                    endText: "Sign In",
                    endTextColor: AppColor.primaryColor,
                    endFontWeight: FontWeight.w600,
                    fontSize: 15,
                    onTap: () {
                      Get.toNamed(Routes.LOGIN_SCREEN);
                    },
                  ),
                  gapH48,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
