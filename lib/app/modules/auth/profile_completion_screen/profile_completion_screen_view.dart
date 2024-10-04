import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_builder/constraints/my_constraints.dart';
import 'package:app_builder/constraints/my_text_style.dart';
import 'package:app_builder/widget/my_button.dart';
import 'package:app_builder/widget/my_drop_down.dart';
import 'package:app_builder/widget/my_edit_text.dart';

import '../../../core/constants/app_colors.dart';
import 'profile_completion_screen_controller.dart';

class ProfileCompletionScreenView
    extends GetView<ProfileCompletionScreenController> {
  const ProfileCompletionScreenView({super.key});

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
                    "Complete Profile",
                    style: text20Style(
                      fontSize: 32,
                      isWeight500: true,
                    ),
                  ),
                  gapH20,
                  Text(
                    "Don't worry, only you can see your personal data. No one else will be able to see it.",
                    style: text16Style(color: AppColor.grey, isWeight400: true),
                    textAlign: TextAlign.center,
                  ),
                  gapH24,
                  Form(
                    // key: controller.formKey,
                    child: Obx(() {
                      return Column(
                        children: [
                          MyEditText(
                            title: "",
                            hintText: "Name",
                            errorMsg: "Please enter your first name",
                            controller: controller.nameController,
                            focusNode: controller.nameFocus,
                            nextFocus: controller.phoneFocus,
                          ),
                          MyEditText(
                            title: "",
                            hintText: "Phone Number",
                            errorMsg: "Please enter phone number",
                            controller: controller.phoneController,
                            focusNode: controller.phoneFocus,
                            isMobileNumber: true,
                          ),
                          MyDropDown(
                            title: "",
                            dropDownItems: controller.genderList.toList(),
                            selectedItem: controller.selectedGender.value,
                            handleClick: controller.handleSelectedGender,
                            hint: "Gender",
                          ),
                        ],
                      );
                    }),
                  ),
                  gapH48,
                  MyButton(
                    label: "Complete Profile",
                    onPressed: controller.completeProfileClick,
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
