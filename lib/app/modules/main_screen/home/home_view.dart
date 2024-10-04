import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/core/constants/app_colors.dart';
import 'package:m_mart_flutter/app/core/constants/asset_constants.dart';
import 'package:app_builder/constraints/my_constraints.dart';
import 'package:app_builder/constraints/my_text_style.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: mainPadding(16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: text18Style(),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: text14Style(),
                      ))
                ],
              ),
            ),
            gapH6,
            SizedBox(
              height: 85,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 16.w : 0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(categoryImageIcon),
                          height: 45.h,
                          width: 45.w,
                          color: AppColor.primaryColor,
                        ),
                        gapH6,
                        Text(
                          "Hanger",
                          style: text14Style(isWeight600: true),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return gapW16;
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
