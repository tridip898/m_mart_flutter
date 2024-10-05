import 'package:app_builder/constraints/my_colors.dart';
import 'package:app_builder/constraints/my_constraints.dart';
import 'package:app_builder/constraints/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/core/constants/app_colors.dart';
import 'package:m_mart_flutter/app/core/constants/asset_constants.dart';
import 'package:m_mart_flutter/app/core/widgets/app_default/app_app_bar.dart';
import 'package:m_mart_flutter/app/routes/app_pages.dart';

import '../../../core/widgets/app_circle_network_image_viewer.dart';
import 'account_screen_controller.dart';

class AccountScreenView extends GetView<AccountScreenController> {
  const AccountScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "My Account",
        titleColor: AppColor.black,
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
                Center(
                  child: CircleAvatar(
                    backgroundColor: AppColor.plantPrimaryColor,
                    radius: 70.w,
                    child: AppCircleNetworkImageViewer(
                      "",
                      130.w,
                      assetImage: noDataFoundImage,
                      assetWidth: 80,
                    ),
                  ),
                ),
                gapH12,
                Text(
                  "Ester Howard",
                  style: text18Style(isWeight600: true),
                ),
                gapH16,
                accountOption(
                  "Your Profile",
                  personImage,
                  () {
                    Get.toNamed(Routes.MY_PROFILE);
                  },
                ),
                accountOption(
                  "Payment Methods",
                  cardImage,
                  () {},
                ),
                accountOption(
                  "My Orders",
                  orderImage,
                  () {},
                ),
                accountOption(
                  "Settings",
                  settingImage,
                  () {},
                ),
                accountOption(
                  "Help Center",
                  infoImage,
                  () {},
                ),
                accountOption(
                  "Privacy Policy",
                  privacyImage,
                  () {},
                ),
                accountOption(
                  "Invite Friends",
                  addPersonImage,
                  () {},
                ),
                accountOption(
                  "Log Out",
                  logOutImage,
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
            padding: mainPadding(10, 16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        icon,
                        height: 26.h,
                        width: 26.w,
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
