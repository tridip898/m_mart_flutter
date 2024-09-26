import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/my_text_style.dart';

class DoneButton extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const DoneButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          elevation: 0,
          backgroundColor: AppColor.primaryColor),
      onPressed: onTap,
      child: Text(
        title,
        style: text14Style(color: AppColor.white),
      ),
    );
  }
}
