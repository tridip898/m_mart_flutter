import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

// ignore: must_be_immutable
class AppRadioButton extends StatelessWidget {
  final dynamic value, groupValue;
  Function(dynamic)? onChanged;

  AppRadioButton({
    super.key,
    this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Radio(
      splashRadius: 12,
      activeColor: AppColor.primaryColor,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
