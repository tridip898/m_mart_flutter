import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:app_builder/constraints/my_constraints.dart';
import 'package:app_builder/constraints/my_text_style.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/asset_constants.dart';
import '../main_screen/account_screen/account_screen_view.dart';
import '../main_screen/cart_screen/cart_screen_view.dart';
import '../main_screen/chat_screen/chat_screen_view.dart';
import '../main_screen/favorite_screen/favorite_screen_view.dart';
import '../main_screen/home/home_view.dart';
import 'main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBarDesign(),
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomeView(),
            CartScreenView(),
            FavoriteScreenView(),
            ChatScreenView(),
            AccountScreenView(),
          ],
        );
      }),
    );
  }

  bottomNavBarDesign() {
    return IntrinsicHeight(
      child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.grey.withOpacity(.3),
                blurRadius: 15,
                spreadRadius: -3,
              )
            ],
          ),
          alignment: Alignment.center,
          padding: mainPadding(14, 10, bottomPadding: Platform.isIOS ? 16 : 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              bottomItemDesign(
                "Home",
                homeIcon,
                0,
              ),
              bottomItemDesign(
                "Cart",
                cartIcon,
                1,
              ),
              bottomItemDesign(
                "Favorite",
                favIcon,
                2,
              ),
              bottomItemDesign(
                "Chat",
                chatIcon,
                3,
              ),
              bottomItemDesign(
                "Accounts",
                accountIcon,
                4,
              ),
            ],
          )),
    );
  }

  bottomItemDesign(
    String title,
    String iconPath,
    int index,
  ) {
    return Obx(() {
      var isSelected = controller.currentIndex.value == index;
      return InkWell(
        onTap: () async {
          controller.currentIndex.value = index;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: isSelected
                  ? AppColor.primaryColor.withOpacity(.1)
                  : AppColor.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () async {
                  controller.currentIndex.value = index;
                },
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: mainPadding(12, 4),
                  child: Image.asset(
                    iconPath,
                    height: 24.h,
                    width: 24.w,
                    color: isSelected
                        ? AppColor.primaryColor
                        : AppColor.black.withOpacity(.6),
                  ),
                ),
              ),
            ),
            // gapH3,
            Text(
              title,
              style: text14Style(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? AppColor.primaryColor
                    : AppColor.black.withOpacity(.6),
              ),
            )
          ],
        ),
      );
    });
  }
}
