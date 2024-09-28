import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soft_builder/model/drop_down_model.dart';

class ProfileCompletionScreenController extends GetxController {
  final nameController = TextEditingController(),
      phoneController = TextEditingController();
  final nameFocus = FocusNode(), phoneFocus = FocusNode();
  final genderList = <DropDownModel>[
    DropDownModel(id: "male", title: "Male"),
    DropDownModel(id: "female", title: "Female"),
    DropDownModel(id: "Others", title: "Others"),
  ].obs;

  final selectedGender = DropDownModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  handleSelectedGender(value) {
    selectedGender.value = value;
  }

  void completeProfileClick() {}
}
