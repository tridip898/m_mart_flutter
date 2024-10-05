import 'package:app_builder/constraints/my_constraints.dart';
import 'package:app_builder/constraints/my_text_style.dart';
import 'package:app_builder/widget/my_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asset_constants.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            gapH3,
            Padding(
              padding: mainPadding(16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyEditText(
                      title: "",
                      isRequired: false,
                      prefixIcon: Icons.search_rounded,
                      hintText: "Search",
                      needTopSpace: false,
                      bottomLeftRadius: 30,
                      bottomRightRadius: 30,
                      topLeftRadius: 30,
                      topRightRadius: 30,
                      controller: controller.searchController,
                    ),
                  ),
                  gapW12,
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      padding: mainPadding(8, 8),
                      child: Image.asset(
                        notificationImage,
                        height: 20.w,
                        width: 20.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  gapW12,
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      padding: mainPadding(8, 8),
                      child: Image.asset(
                        filterImage,
                        height: 20.w,
                        width: 20.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gapH8,
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
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
                            ),
                          )
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
                            padding: EdgeInsets.only(
                              left: index == 0 ? 16.w : 0,
                              right: index == 9 ? 16.w : 0,
                            ),
                            child: Column(
                              children: [
                                Ink(
                                  decoration: BoxDecoration(
                                      color:
                                      AppColor.primaryColor.withOpacity(.05),
                                      shape: BoxShape.circle),
                                  padding: mainPadding(12, 12),
                                  child: Image(
                                    image: AssetImage(categoryImageIcon),
                                    height: 32.h,
                                    width: 32.w,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                gapH3,
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
                    ),
                    gapH20,
                    Padding(
                      padding: mainPadding(16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Flash Sale",
                            style: text18Style(),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "View all",
                              style: text14Style(),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: mainPadding(16, 0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.w,
                        ),
                        itemCount: 10,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return Container(
                            color: AppColor.red,
                            child: Column(
                              children: [
                                Image.asset(
                                  blackJacketImage,
                                  height: 100,
                                ),
                                gapH3,
                                Text("Black Jacket"),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
