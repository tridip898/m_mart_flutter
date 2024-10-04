import 'package:app_builder/constraints/my_constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:m_mart_flutter/app/core/constants/asset_constants.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/my_text_style.dart';
import '../../core/widgets/app_circle_network_image_viewer.dart';
import '../../core/widgets/app_default/app_app_bar.dart';
import 'my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBar(
          title: "My Profile",
          titleColor: AppColor.black,
        ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: mainPadding(20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.primaryColor,
                      width: 3,
                    ),
                  ),
                  child: AppCircleNetworkImageViewer(
                    "" ?? "",
                    120.w,
                    assetImage: noDataFoundImage,
                  ),
                ),
              ),
              gapH32,
              Material(
                color: AppColor.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side:  BorderSide(
                      color: AppColor.appBarTextColor,
                    )
                ),
                child: Container(
                  padding: mainPadding(12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profileInfo(
                        topBorderColor: true,
                        iconData: CupertinoIcons.person,
                        title: "Demo Name" ?? "",
                        //If need some edit
                      ),
                      profileInfo(
                        iconData: CupertinoIcons.mail,
                        title: "myaccount@gmail.com",
                        //If need some edit
                      ),
                      profileInfo(
                        iconData: CupertinoIcons.phone,
                        title:  "0983734747448",
                        //If need some edit
                      ),
                      profileInfo(
                        iconData: CupertinoIcons.location,
                        title:  "New York, Dhaka",
                        //If need some edit
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
  }
  Widget profileInfo({
    required String title,
    required IconData iconData,
    bool bottomBorderColor = false,
    bool needTopBorderCircular = false,
    bool topBorderColor = false,
  }) {
    return Ink(
      padding: mainPadding(12, 12),
      decoration: BoxDecoration(
        borderRadius: needTopBorderCircular
            ? const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
           iconData,
            size: 20.w,
          ),
          gapW12,
          Expanded(
            child: Text(
              title,
              style: text16Style(isWeight600: true),
            ),
          ),
        ],
      ),
    );
  }
}
