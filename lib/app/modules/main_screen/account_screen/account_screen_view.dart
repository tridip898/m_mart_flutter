import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/core/constants/asset_constants.dart';
import 'package:soft_builder/constraints/my_colors.dart';
import 'package:soft_builder/constraints/my_constraints.dart';
import 'package:soft_builder/constraints/my_text_style.dart';

import 'account_screen_controller.dart';

class AccountScreenView extends GetView<AccountScreenController> {
  const AccountScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: text18Style(),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: mainPadding(20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gapH12,
                Text(
                  "Ester Howard",
                  style: text18Style(isWeight600: true),
                ),
                gapH16,
                accountOption(
                  "Payment Methods",
                  accountIcon,
                  () {},
                ),
                accountOption(
                  "My Orders",
                  accountIcon,
                  () {},
                ),
                accountOption(
                  "Settings",
                  accountIcon,
                  () {},
                ),
                accountOption(
                  "Help Center",
                  accountIcon,
                  () {},
                ),
                accountOption(
                  "Privacy Policy",
                  accountIcon,
                  () {},
                ),
                accountOption(
                  "Invite Friends",
                  accountIcon,
                  () {},
                ),
                accountOption(
                  "Log Out",
                  accountIcon,
                  () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  accountOption(String title, String icon, Function()? onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: mainPadding(4, 16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        icon,
                        height: 20.h,
                        width: 20.w,
                      ),
                      gapW12,
                      Flexible(
                        child: Text(
                          title,
                          style: text16Style(),
                        ),
                      )
                    ],
                  ),
                ),
                gapW12,
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        myWidget.divider(color: MyColors.dividerColor, height: 0, thickness: 1)
      ],
    );
  }
}
